package FES::RH;
use strict;
use warnings;
use lib( '/var/www/pcgi' );
use BES::Common qw(prepare_template time2db);
use CGI::Session ('-ip_match');
use CGI::Cookie;
use Time::Local;
use File::Copy;# для перемещения файлов
use BES::LB;

#use Storable;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK =
  qw(show_object list_all list_load process rh_login bad_session show_login rh_logout
     show_profile show_finance show_report add_object add_mediaobject del_object offline show_persons show_stat);

######################
# нужные функции :))
####
# проверяем валидность сессии
sub bad_session {
    my $in = shift;
    my $s =
      CGI::Session->load( "driver:file", $in->{cookie},
        { Directory => '/tmp' } )
      or die CGI::Session->errstr;

    # если сессия не валидна то true
    if ( $s->is_empty or $s->is_expired ) {
        return 1;
    }    # если валидна то false
    else {

        # дергаем из сессии RhId
        $in->{rhid} = $s->param('rhid');
        return 0;
    }

    # по дефолту true
    return 1;
}
##
# показываем форму логина
sub show_login {
    my ( $db, $in, $config ) = @_;
    my $templ = prepare_template( -template => 'login.html' );
    $templ->param( ERROR => $in->{error} );
    return $templ->output;
}
##
# выход из системы
sub rh_logout {
    my ( $db, $in, $config ) = @_;
    my $s =
      CGI::Session->load( "driver:file", $in->{cookie},
        { Directory => '/tmp' } )
      or die CGI::Session->errstr;
    $s->delete;
    return show_login();
}

##
# процедура входа
sub rh_login {
    my ( $db, $in, $config ) = @_;

    # если успешно залогинились
    # проверка логина и пароля RH
    my $rs = $db->{connect}->resultset('Rhprofiles')->search(
        {
            login    => $in->{user},
            password => $in->{pass},
        }
    );
    my $row  = $rs->first;
    my $rhid = 0;
    my $uid = 0;
    eval { $rhid = $row->get_column('rhid');
           $uid  = $row->get_column('id');
          }; # выполняем в eval блоке
    if ($@) {
        $rhid = 0;
        $uid = 0;
    }
    if ($rhid) {
        my $s =
          CGI::Session->new( "driver:file", undef, { Directory => '/tmp' } );
        $s->expire(600);                        # 10 минут
        $s->param( rhid => $rhid );    # сохраняем в сессии RhId
        $s->param( uid => $uid ); # и UID пользователя
                                       # печем печеньки
        my $c = CGI::Cookie->new(
            -name  => $s->name,
            -value => $s->id
        );
        $in->{cookie} = $c;
        # для запроса внутри функции list_all нужен uid и rhid
        $in->{rhid}   = $rhid;
        $in->{uid} = $uid;
         
        # все ок - выводим список медиаобъектов
        return list_all( $db, $in, $config );
    }
    else {

        # не верно - возвращаем форму логина
        $in->{error} =
'Неверное имя пользователя или пароль';
        return show_login( $db, $in, $config );
    }
}
##
# данные о файле медиаобъекта подробно
sub process {
    my ( $db, $in, $config ) = @_;
    my $file = $db->{connect}->resultset('Files')->find($in->{id});
    my $media_id = $file->get_column('mediaobjectid');
    my $mediaobject = $db->{connect}->resultset('Mediaobjects')->find($media_id);
    my $filename = $file->filename;
    # если получены данные для формы
    if($in->{form_save}) {
        if($in->{checkbox}) {
            $file->ismain(1);
            $file->update;
            $mediaobject->photo_url("$config->{dir}{web}/$in->{rhid}/$media_id/$filename");
            $mediaobject->update;
        } else {
            $file->ismain(0);
            $file->update;
            $mediaobject->photo_url('');
            $mediaobject->update;
        }
    }
    # если запрос на удаление объекта
    if($in->{flag} eq 'delete') {
        # удаляем из БД
        $file->delete;
        # удаляем из ФС
        unlink("$config->{dir}{files}/$in->{rhid}/$media_id/$filename") or print STDERR "$!\n";
        $in->{id} = $media_id;
        $in->{form_save} = 0;
        return show_object($db, $in, $config);
    }
    my $templ = undef;
    # если это картинка, то шаблон image.html
    # если не картинка, то шаблон process_file.html
    if($file->filetype == 3) {# картинка
        $templ = prepare_template( -template => 'image.html' );
        my $checked = $file->ismain ? "checked=1" : undef;
        my %stash = (
                ObjectID    => $media_id,
                MediaObject => $mediaobject->name,
                FileName    => $filename,
                Checked     =>  $checked,
                ImageSrc    =>
                "$config->{dir}{web}/$in->{rhid}/$media_id/$filename",
                FileId      => $in->{id},
                );
        $templ->param(\%stash);
        return $templ->output;
    }
    else { # прочее
        $templ = prepare_template( -template => 'process_file.html' );
        my %stash = (
                    MediaObject => $mediaobject->name,
                    LogMsg      => $file->logmsg,
        );
        $templ->param(\%stash);
        return $templ->output;
    }
}
##
# оффлайн загрузка
sub offline {
    my ( $db, $in, $config ) = @_;

    # шаблон
    my $templ = prepare_template( -template => 'process.html' );
    # если поступил путь к файлу
    if($in->{file}) {
        my ($path, $size) = split (/\|/, $in->{file});
        $templ->param( server => $in->{server} );
        $templ->param( login => $in->{login} );
        $templ->param( passwd => $in->{passwd} );
        $templ->param( filetoload => $path );
        $templ->param( SIZE    => $size );
    }
    if ($in->{form_save}) {
        #store \$in, '/tmp/in.txt';
        my $fname = $in->{ServerName} ? $in->{ServerName} : $in->{Server};
        my $flag = $in->{ServerName} ? 1 : 0;
        # сохраняем фтп сервер в таблице RHFTPs
        my $rs1 = $db->{connect}->resultset('Rhftps');
        my $obj = $rs1->create( {
                                rhid        => $in->{rhid},
                                serveradr  => $in->{Server},
                                user        => $in->{Login},
                                password    => $in->{Password},
                                fname       => $fname,
                                flag        => $flag,
                                });
        # добавляем файл на закачку
        $rs1 = $db->{connect}->resultset('Files');
        $rs1->create({
            mediaobjectid => $in->{Object},
            rhprofileid   => $in->{rhid},
            filename      => _get_filename($in->{FileToLoad}),
            filetype      => $in->{Type},
            filesize      => $in->{size},
            filestatus    => 0,
            datecreated   => time2db(),
            datechanged   => time2db(),
            ftpid         => $obj->id,
            fullpath      => $in->{FileToLoad},
            ismain        => 0,
        });
        return list_load( $db, $in, $config );
    }
    
    my @loop = ();
    my @saved_servers = ();
    # result set
    my $rs = $db->{connect}->resultset('Mediaobjects')
      ->search( { 'RHId' => $in->{rhid} } );
    while ( my $item = $rs->next ) {
        push(
            @loop,
            {
                mediaID => $item->id,
                Name    => $item->name,
            }
        );
    }
    # запрос списка северров
    $rs = $db->{connect}->resultset('Rhftps')
      ->search( { 'rhid' => $in->{rhid},
                   'flag' => 1 } );
    while ( my $item = $rs->next ) {
        push(
            @saved_servers,
            {
                ServerId => $item->id,
                ServerSavedName    => $item->fname,
            }
        );
    }
    $templ->param( media_objects => \@loop );
    $templ->param( ServerList => \@saved_servers );
    # возвращаем сгенерированный html
    return $templ->output;

}

sub list_load {
    my ( $db, $in, $config ) = @_;
    my $page = $in->{page} || 1;
    my $filetype = $in->{type} || undef; # тип файла
    # шаблон
    my $templ = prepare_template( -template => 'load.html' );
    my @loop = ();
    my $rs = undef;
    # если запрос на определенный тип файлов
    if ($filetype) {
    # result set
    $rs = $db->{connect}->resultset('Files')->search(
        {
            FileType   => $filetype ,
            FileStatus => { '<>' => -1 },
        },
        {
                  page => $page,
                  rows => $config->{page}{rows},
                }
    );
    }# если показывать все данные
    else {
    # result set
    $rs = $db->{connect}->resultset('Files')->search(
        {
            FileStatus => { '<>' => -1 },
        },
        {
                  page => $page,
                  rows => $config->{page}{rows},
                }
    );    
    }
    
    # use Data::Page
    my $pager = $rs->pager();
    my @pages = (1..$pager->last_page);# массив с номерами страниц
    my @loop_data=();# массив для нумерации страниц
    # нумеруем страциы
    foreach my $elem (@pages) {
        if($elem == $pager->current_page) {
             push(@loop_data,{ NUM => qq([$elem])});
        } else {
            push(@loop_data,{ NUM => qq(<a href="?act=load&page=$elem&type=$filetype">$elem</a>)});
        }
    }
    
    while ( my $item = $rs->next ) {
        my $size = $item->filesize > 1000000 ? sprintf("%.2f Мб",$item->filesize/1024/1024)
        : sprintf("%.2f Кб",$item->filesize/1024);
        push(
            @loop,
            {
                ID       => $item->id,
                FileName => $item->filename,
                FileType => _file_type($item->filetype),
                FileSize => $size,
                FullPath => $item->fullpath,
                Percent  => $item->filesize,   # переписать позже
                FileStatus => _file_status( $item->filestatus),
            }
        );
    }
    
    $templ->param( files => \@loop );
    $templ->param ( PAGES => \@loop_data);
    $templ->param ( PAGE  => $pager->current_page);
    # возвращаем сгенерированный html
    return $templ->output;
}
# добавить медиаобъект
sub add_mediaobject {
    my ( $db, $in, $config ) = @_;
    my %stash = ();
    my $rs = $db->{connect}->resultset('Mediaobjects');
    # если поступили данные из формы
    if ( $in->{form_save} ) {
        my $obj = $rs->create({
                        rhid           => $in->{rhid},
                        name           => $in->{RusName} ,
                        nameoriginal   => $in->{Name} ,
                        author         => $in->{Autor} ,
                        creationdate   => $in->{year} ,
                        description    => $in->{Note} ,
                        genres         => $in->{Genres} ,
                        countryid      => $in->{countries} ,
                        originallangid => $in->{lang} ,
                     });
                     
        my $id = $obj->id;
        #print STDERR "ID: $obj->id\n";
        # обновляем жанры во всех необходимых таблицах
        _genres_update ( $in->{Genres}, $id, $db );
        # показываем что добавили
        $in->{form_save}  = 0;
        #$in->{id} = $id;
        return list_all( $db, $in, $config );
    }
    # заполняем LOOPы
    $stash{countries} = _get_countries_list( 1, $db );
    $stash{langs}  = _get_lang_list( 1, $db );
    $stash{name} = 'Новый медиаобъект';
    # шаблон
    my $templ = prepare_template( -template => 'item.html' );
    $templ->param( act => 'add_m' );
    $templ->param( \%stash );
    # возвращаем сгенерированный html как шаблон
    return $templ->output;
}
# показывает медиаобъект (и редактирует его)
sub show_object {
    my ( $db, $in, $config ) = @_;

    # шаблон
    my $templ = prepare_template( -template => 'item.html' );
    my %stash = ();
    my @loop  = ();
    
    # result set
    my $rs = $db->{connect}->resultset('Mediaobjects')->search(
        { 'me.ID' => $in->{id} },
        {
            join => [ 'countryid', 'originallangid' ]
            ,    # имя связи, а не таблицы!
            '+select' => [ 'countryid.id', 'originallangid.lang_id' ],
            '+as'     => [ 'cID',          'lid' ],
        }
    );

    while ( my $item = $rs->next ) {

# если поступили данные на обновление информации
        if ( $in->{form_save} ) {
            $item->name( $in->{RusName} )      if defined $in->{RusName};
            $item->nameoriginal( $in->{Name} ) if defined $in->{Name};
            $item->author( $in->{Autor} )      if defined $in->{Autor};
            $item->creationdate( $in->{year} ) if defined $in->{year};
            $item->description( $in->{Note} )  if defined $in->{Note};

# обновляем жанры во всех необходимых таблицах
            _genres_update( $in->{Genres}, $in->{id}, $db );
            $item->genres( $in->{Genres} ) if defined $in->{Genres};

            # обновляем ID страны
            $item->countryid( $in->{countries} ) if defined $in->{countries};

            # и id языка
            $item->originallangid( $in->{lang} ) if defined $in->{lang};
            $item->update;
        }
        $stash{id}            = $item->id;
        $stash{name}          = $item->name;
        $stash{name_original} = $item->nameoriginal;
        $stash{author}        = $item->author;
        $stash{creation_year} = $item->creationdate;

        # заполняем LOOP
        $stash{countries} = _get_countries_list( $item->countryid->id, $db );

        #
        $stash{descr}  = $item->description;
        $stash{genres} = $item->genres;
        $stash{langs}  = _get_lang_list( $item->originallangid->lang_id, $db );
        $stash{img}    = $item->photo_url;
    }

    # если  кэшировано
    #if ( my $ref = $db->{cache}->get("files:$in->{id}") ) {
    #    @loop = @$ref;    # разыменовываем ссылку
    #}    # в противном случае лезем в базу
    #else {

        # второй запрос
        $rs =
          $db->{connect}->resultset('Files')
          ->search( { mediaobjectid => $in->{id} } );

        while ( my $item = $rs->next ) {
            my $ismain = $item->ismain ? qq(<img style="border: 0;"
            src="http://localhost/img/img/check.gif" width="17" height="14">) : '';
            push(
                @loop,
                {
                    file_id     => $item->id,
                    file_name   => $item->filename,
                    file_type   => _file_type($item->filetype),
                    file_status => _file_status($item->filestatus),
                    ismain      => $ismain,
                }
            );
        }

        # сохраняем в кэше
     #   $db->{cache}->set( "files:$in->{id}", \@loop );
    #}

    # параметизируем
    $templ->param( act => 'detail' ); 
    $templ->param( \%stash );
    $templ->param( files => \@loop );

  # возвращаем сгенерированный html как шаблон
    return $templ->output;
}

###
sub list_all {
# должен поступать rhid для идентификации клипов
    my ( $db, $in, $config ) = @_;
    my $page = $in->{page} || 1;
    my $sort = $in->{sort} || 'id';
    my $order = $in->{order} || 'ASC';
    # result set
    my $rs =
      $db->{connect}->resultset('Mediaobjects')
      ->search( { RHId => $in->{rhid} },
                {
                  page => $page,
                  rows => $config->{page}{rows},
                  order_by =>  "$sort $order" ,
                }
               );
      # use Data::Page
    my $pager = $rs->pager();
    my @pages = (1..$pager->last_page);# массив с номерами страниц
    my @loop_data=();# массив для нумерации страниц
    # нумеруем страциы
    foreach my $elem (@pages) {
        if($elem == $pager->current_page) {
             push(@loop_data,{ NUM => qq([$elem])});
        } else {
            push(@loop_data,{ NUM => qq(<a href="?act=list&page=$elem&sort=$sort&order=$order">$elem</a>)});
        }
    }
    my @loop = ();
    while ( my $item = $rs->next ) {
        my %films = ();
        $films{id}          = $item->id;
        $films{name}        = $item->name;
        $films{duration}    = $item->duration;
        $films{views}       = $item->views;
        $films{genre}       = $item->genres;
        $films{img}         = $item->photo_url;
        $films{date_update} = $item->datechanged;
        push( @loop, \%films );

    }

    # шаблон
    my $templ = prepare_template( -template => 'index.html' );
    my $order_num = $order eq 'ASC' ? 'DESC' : 'ASC';
    # параметизируем
    $templ->param( films => \@loop );
    $templ->param ( PAGES => \@loop_data);
    $templ->param ( order => $order_num );
    $templ->param ( CUR_NUM   => $pager->current_page );
    # возвращаем сгенерированный html
    return $templ->output;
}
##
# добавление объекта в каталоге загрузки
sub add_object {
    my ( $db, $in, $config ) = @_;
# если поступили данные из формы:
# чем оперируем:
# 1. каталог хранения файлов/RHID/MEDIAOBJID/
# 2. имя временного файла, имя реального файла (перемещаем в каталог)
# 3. Пишем в БД ID файла, ID медиаобъекта, имя файла, и т.п.
    if($in->{form_save}) {
        my ( $file, $temp ) = split(/%7C/,$in->{temp_file});
        my ($size,$last_access, $last_modify) = (stat($temp))[7,8,9];
        # перемещаем файл
        # если каталог правообладателя не существует
        mkdir "$config->{dir}{files}/$in->{rhid}" unless(-d "$config->{dir}{files}/$in->{rhid}");
        # если каталог медиаобъекта не существует
        mkdir "$config->{dir}{files}/$in->{rhid}/$in->{Object}"
            unless(-d "$config->{dir}{files}/$in->{rhid}/$in->{Object}");
        # перемещаем файл    
        move("$temp","$config->{dir}{files}/$in->{rhid}/$in->{Object}/$file") or print STDERR $!;
        # теперь запишем в бд что получилось
        my $rs = $db->{connect}->resultset('Files');
        
        $rs->create({
                    mediaobjectid => $in->{Object},
                    rhprofileid   => $in->{rhid},
                    filename      => $file,
                    filetype      => $in->{Type},
                    filesize      => $size,
                    filestatus    => 3,
                    logmsg        => 'OK',
                    datecreated   => time2db($last_access),
                    datechanged   => time2db($last_modify),
                    ftpid         => 1,
                    fullpath      => '',
                    });
        # работаем с кэшем/ очищаем его.
        $db->{cache}->delete("files:$in->{Object}");
        # и выведем список файлов всех
        return list_load($db, $in, $config);
    }
    # шаблон
    my $templ = prepare_template( -template => 'addobject.html' );
    my @loop = ();
    # result set
    my $rs =
      $db->{connect}->resultset('Mediaobjects')
      ->search( { 'RHId' => $in->{rhid} } );
    while ( my $item = $rs->next ) {
        push(
            @loop,
            {
                mediaID => $item->id,
                Name    => $item->name,
            }
        );
    }

    $templ->param( media_objects => \@loop);
    # возвращаем сгенерированный html
    return $templ->output;
}
######
# удаление медиаобъекта и всех связанных файлов
sub del_object {
    my ( $db, $in, $config ) = @_;
    # 1. удаляем из Files все файлы связанные с медиаобъектом
    my $rs = $db->{connect}->resultset('Files')->search({ mediaobjectid => $in->{id} });
    $rs->delete;
    # 2. удаляем файлы из файловой системы
    if( -d "$config->{dir}{files}/$in->{rhid}/$in->{id}" ) {
        opendir(DIR,"$config->{dir}{files}/$in->{rhid}/$in->{id}") || print STDERR "$!";
        my @files = grep( !/^.\.?$/, readdir DIR );
        close(DIR);
        foreach my $file(@files) {
            unlink("$config->{dir}{files}/$in->{rhid}/$in->{id}/$file") || print STDERR "$!";
        }
    }
    # 3. удаляем все записи из таблица GenreTies
    $rs = $db->{connect}->resultset('Genreties')->search({ movieid => $in->{id} });
    $rs->delete;
    # 4. удаляем запись из таблицы Mediaobjects
    $rs = $db->{connect}->resultset('Mediaobjects')->search({ id => $in->{id} });
    $rs->delete;
    # возвращаем список фильмов
    $in->{id} = undef;
    return list_all( $db, $in, $config );
}
######################
# ЛИЧНЫЙ КАБИНЕТ
# работаем с профилем
sub show_profile {
    my ( $db, $in, $config ) = @_;
    my $photo = -e "$config->{dir}{files}/$in->{rhid}/0/avatar.jpg" ?
    "$config->{dir}{web}/$in->{rhid}/0/avatar.jpg" : 'http://localhost/img/img/nophoto.png';
    my $templ = prepare_template( -template => 'cab.html' );
    # резульсет
    my $rs =  $db->{connect}->resultset('Rhs')->find( $in->{rhid} );

    if($in->{form_save}) {
        #store $in, '/tmp/in2.txt';
        $rs->adress( $in->{Adress} )      if defined $in->{Adress};
        $rs->email( $in->{Email} )      if defined $in->{Email};
        $rs->internet( $in->{Web} )      if defined $in->{Web};
        $rs->tel( $in->{Tel} )      if defined $in->{Tel};
        $rs->fax( $in->{Fax} )      if defined $in->{Fax};
        $rs->notes( $in->{Notes} )      if defined $in->{Notes};
        $rs->update;
        #$rs->picture; доделать позже
    }
    
    my %stash = ( CompanyName =>  $rs->rhname,
                  Adress     =>  $rs->adress,
                  Email       =>  $rs->email, 
                  Web         =>  $rs->internet,
                  Tel         =>  $rs->tel,
                  Fax         =>  $rs->fax, 
                  Notes       =>  $rs->notes,
                  Photo       =>  $photo,
                  RHID        => $in->{rhid},
                  );
    # параметизируем
    $templ->param (\%stash);
    # возвращаем сгенерированный html
    return $templ->output;
}
##
# работаем с сотрудниками
sub show_persons {
    my ( $db, $in, $config ) = @_;
    my %stash = ();
    my @people_list = ();
    # шаблон
    my $templ = prepare_template( -template => 'persons.html' );
    #if(1) { $templ->param(NO_READ => 1); return $templ->output;}
    # резульсет для всех данных
    my $rs =  $db->{connect}->resultset('Rhprofiles')->search( { rhid => $in->{rhid} } );
    # если поступила команда на удаление
    if ($in->{flag} eq 'delete') {
        my $rs2 = $db->{connect}->resultset('Rhprofiles')->search( { rhid => $in->{rhid},
                                                                     id   => $in->{uid}} );
        $rs2->delete;
    }
    
    my $uid = $in->{LoadName} || 1;
    
    if( $in->{Name}) {# если поступили данные на добавление новог сотрудника
       my $obj = $rs->create( { name        => $in->{Name},
                                datecreated => time2db() });
       $uid = $obj->id;
    }
    while ( my $item = $rs->next ) {
        my $selected = '';
        # если поступил запрос на конкретного сотрудника
        if ($uid and $item->id eq $uid) {
            $selected = qq(selected="1") if $uid == $item->id;
            $stash{UID}          = $item->id;
            $stash{Name}         = $item->name;
            $stash{DateCreated}  = $item->datecreated;
            $stash{LastVisited}  = $item->lastvisited;
            $stash{Email}        = $item->email;
            $stash{Login}        = $item->login;
            $stash{Passwd}       = $item->password;
            my $rights           = _get_rights($item->rights);
            #store \%rights, '/tmp/right.txt';
            %stash = (%stash, %$rights);
        }
        # сохраняем данные если id совпадают
        if($uid and ($item->id eq $uid) and ($in->{uid} eq $uid)) {
            $selected = qq(selected="1") if $uid == $item->id;
            $stash{UID}          = $item->id;
            $stash{Name}         = $item->name;
            $stash{DateCreated}  = $item->datecreated;
            $stash{LastVisited}  = $item->lastvisited;
            $stash{Email}        = $item->email($in->{Email});
            $stash{Login}        = $item->login($in->{Login});
            $stash{Passwd}       = $item->password($in->{Passwd});
            # конвертим права для БД
            my $rights = _set_rights($in);
            $item->rights($rights);
            $item->update;
            # а затем для шаблона
            $rights           = _get_rights($rights);
            %stash = (%stash, %$rights);
        }
        push(
            @people_list,
            {
                IdList   => $item->id,
                NameList => $item->name,
                Selected => $selected,
            }
        );
    }
    
    # параметизируем
    $templ->param (\%stash);
    $templ->param (PeopleList => \@people_list);
    # возвращаем сгенерированный html
    return $templ->output;
}
######################
######################
# работаем с финансами
sub show_finance {
    my ( $db, $in, $config ) = @_;

    my $lb = BES::LB->new($config);
    my %in     = undef;    
    $in->{user_id} = "5500000003"; 

    # получаем баланс
    my $data = $lb->getBalance($in);
    my %stash = ( Balance => $data->{balance},
                  CurSymbol  => $data->{symbol},
                  Agreement => $in->{user_id},
                  dtfrom => $in->{dtfrom},
                  dtto => $in->{dtto},
                  );

    my @opers = ();
    my $i = 0;
    
    # получаем платежи
    my @opers = $lb->getPayments($in);
#    for (my $index = 0; $index < @pay; $index = $index + 4) {
#        $opers[$i]{date} = $pay[$index];
#        $opers[$i]{oper} = "Зачисление";
#        $opers[$i]{amount} = "+".$pay[$index+1];
#        $opers[$i]{cur} = $pay[$index+2];
#	$opers[$i]{comments} = $pay[$index+3];
#        $i++;
#    }                  
    
    $i = @opers;
    
    # получаем расходы
    my @spend = $lb->getStats($in);
    push(@opers, @spend);
#    for (my $index = 0; $index < @spend; $index = $index + 4) {
#	$opers[$i]{date} = $spend[$index];	
#	$opers[$i]{oper} = "Списание";
#	$opers[$i]{amount} = "-".$spend[$index+1];
#	$opers[$i]{cur} = $spend[$index+2];
#	$opers[$i]{comments} = $spend[$index+3];
#	$i++;
#    }
    
#    @sorted_opers = sort @opers;
    my @sorted_opers = sort {timec($a->{date}) <=> timec($b->{date})} @opers;            

    # шаблон
    my $templ = prepare_template( -template => 'finance.html' );
    # параметизируем
    $templ->param( payments => \@sorted_opers);
    $templ->param (\%stash);
    # возвращаем сгенерированный html
    return $templ->output;
}

sub timec ($){
    $_[0] =~ /^(\d+)-(\d+)-(\d+)\s(\d+):(\d+):(\d+)$/;
    my $numeric_time = timelocal ($6, $5, $4, $3, $2-1, $1-1900);
    return $numeric_time;
}


sub show_stat {                                                                                                                                           
    my ( $db, $in, $config ) = @_;
    
    my %stash = ( Data => "Проверили"  );
    my $templ = prepare_template( -template => 'stat.html' );
    $templ->param (\%stash); 
    return $templ->output;
}

####################################
## ITERNAL SUBS
#
# получить список стран, и отметить текущую страну объекта как selected=1
# вернуть ссылку на массив хэшей
sub _get_countries_list {
    my ( $countrID, $db ) = @_;

    # выборка всех стран
    my $rs   = $db->{connect}->resultset('Countries');
    my @loop = ();

    while ( my $row = $rs->next ) {
        if ( $row->id == $countrID ) {
            push(
                @loop,
                {
                    countryID => $row->id,
                    selected  => 'selected=1',
                    country   => $row->country,
                }
            );
        }
        else {
            push(
                @loop,
                {
                    countryID => $row->id,
                    selected  => '',
                    country   => $row->country,
                }
            );
        }
    }
    return \@loop;

}

##
# получить список языков
sub _get_lang_list {
    my ( $langID, $db ) = @_;

    # выборка всех стран
    my $rs   = $db->{connect}->resultset('Languages');
    my @loop = ();

    while ( my $row = $rs->next ) {
        if ( $row->lang_id == $langID ) {
            push(
                @loop,
                {
                    langID   => $row->lang_id,
                    selected => 'selected=1',
                    langName => $row->lang,
                }
            );
        }
        else {
            push(
                @loop,
                {
                    langID   => $row->lang_id,
                    selected => '',
                    langName => $row->lang,
                }
            );
        }
    }
    return \@loop;

}
##
# обвновить данные о жанрах в таблицах Genres и ...
sub _genres_update {
    my ( $genre_list, $obj_id, $db ) = @_;
    my @genres = split( /,/, $genre_list );
    return 1 if (scalar @genres <= 0);
    my $rs = $db->{connect}->resultset('Genres');
    my @id_tag = ();    # массив с id тэгов
      # проверяем есть ли в базе... если нет - добавляем
    foreach my $item (@genres) {
        my $obj = $rs->find_or_new( { name => $item } );
        push( @id_tag, $obj->get_column('id') )
          ; # сохраяем id тэгов для дальнейшего использования
        unless ( $obj->in_storage ) {
            $obj->insert();
            push(@id_tag, $obj->id);# вставляем 
        }
    }

    _genre_tie( \@id_tag, $obj_id, $db );
    return 1;
}

# ... GenreTies
# ссылка на массив жанров, id медиаобъекта, $db коннект
sub _genre_tie {
    my ( $genres, $obj_id, $db ) = @_;
    return 1 if(scalar(@$genres)<=0);
    my $rs =
      $db->{connect}->resultset('Genreties')->search( { movieid => $obj_id } );

    # сперва все удаляем
    # если не удялеся - проверить наличие __PACKAGE__->set_primary_key('movieid','genreid');
    # в модуле Genreties.pm 
    while ( my $row = $rs->next ) {
        $row->delete();
    }
    
    #store $genres, '/tmp/ids.txt';
    # а затем вносим то что пришло
    foreach my $item (@$genres) {
        $rs->create(
            {
                movieid => $obj_id,
                genreid => $item
            }
        );
    }
    return 1;
}
##
# получаем набор прав для шаблона
sub _get_rights {
    my $rights = shift;
    my @rights = split(/:/,$rights, 7);
    my %checks = ();
            $checks{RRES}   = $rights[0] ? 'checked="1"': ''; 
            $checks{RWRES}  = $rights[1] ? 'checked="1"': ''; 
            $checks{RBIR}   = $rights[2] ? 'checked="1"': ''; 
            $checks{RWBIR}  = $rights[3] ? 'checked="1"': ''; 
            $checks{RSTAT}  = $rights[4] ? 'checked="1"': ''; 
            $checks{RPROF}  = $rights[5] ? 'checked="1"': ''; 
            $checks{RWPROF} = $rights[6] ? 'checked="1"': ''; 
    return \%checks;        
}
# формируем набор прав для БД
sub _set_rights {
    my $in = shift;
    my @rights=();
      $rights[0] = $in->{rres}  ? 1 : 0;
      $rights[1] = $in->{rwres}  ? 1 : 0;
      $rights[2] = $in->{rbir}  ? 1 : 0;
      $rights[3] = $in->{rwbir} ? 1 : 0;
      $rights[4] = $in->{rstat} ? 1 : 0;
      $rights[5] = $in->{rprof} ? 1 : 0;
      $rights[6] = $in->{rwprof} ? 1 : 0;
      my $string = join(':',@rights);
      return $string;
    
}
###
#  костыли...
sub _file_type {
    my $type = shift || 0;
        # костыль 2
        my %files_type = (
            1 => 'Аудио',
            2 => 'Субтитры',
            3 => 'Картинка',
            4 => 'Данные',
            5 => 'Видео',
        );
        return $files_type{$type};
}

sub _file_status {
    my $st = shift || 0;
    # костыль 1
        my %files_st = (
            0 => 'Не обработан',
            1 => 'Загружается',
            2 => 'Ошибка',
            3 => 'Хранение'
        );
        return $files_st{$st};
}
# получаем имя файла на фтп
sub _get_filename {
    my $full_path = shift;
    $full_path =~ /^.+\/(.+)$/g; 
    return $1;
}


1;
