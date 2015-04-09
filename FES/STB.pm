package FES::STB;
use strict;
use warnings;

=head1 Название
    Модуль реализующий API для STB

=cut
##
# API для обработки интерфейса STB через java приложение
#
use lib qw(..);
use JSON::XS;
use BES::DB;
use BES::LB;
use Time::Local;

# - конструктор класса
sub new {
    my ($class, $config) = @_;
    my $self = bless {}, $class;
    # коннект к БД
    $self->{dbh} = BES::DB->connect(
        host => $config->{db}{hostname},
        db   => $config->{db}{database},
        user => $config->{db}{username},
        pass => $config->{db}{password},
    );
    $self->{json} = JSON::XS->new->utf8(0);
    return $self;
}

#############################################
# Методы для обработки событий с "Фильмами"
#############################################
# Назначение: Показать список фильмов из location
# Аргументы (* - помечены необязательные):
# user_id ,
# location(local|location 1|..) - местоположение файлов
# dir(directory_id) - содержимое директории (даже для корневой необходимо указывать) * зависит от контекста
# from(int),to(int) - определяет размер выборки (от и до) для списка *
# sort(name|date) - сортировать выборку по имени (умолчание), дате *
# sort_order(asc|desc) - направление сортировки, asc по умолчанию *
# Возвращает: массив хэшей с именами ключей:
# 1. {movie_id} id фильма 
# 2. {dir_id} id директории
# 3. {foto_url} url на фото
# 4. {movie_name} название фильма/директории
# 5. {date_create} дата создания, 6. {date_upload} дата загрузки, 7. {date_changes} дата изменения
# 8. {paid_status} статус оплаты (1|0);
# ViDi
sub movie_show_location {
    my ( $class, $in ) = @_;
    # аргументы
    my %args = (
            user_id    => 0,
            location   => '',
            dir        => '/',
            from       => 0,
            to         => 100,
            sort       => 'name',
            sort_order => 'asc',
    );
    # сливаем входные данные в один хэш
    %args = (%args, %$in);
    # данные для заглушки
    my $data = [
                {
                 movie_id     => 12345,
                 dir_id       => 300,
                 foto_url     => 'http://film.ru/1.jpg',
                 movie_name   => 'Терминатор 2',
                 date_create  => '2009-11-10',
                 date_upload  => '2009-11-10',
                 date_changes => '2009-11-10',
                 paid_status  => 1,
                 },
                {
                 movie_id     => 12346,
                 dir_id       => 301,
                 foto_url     => 'http://film.ru/2.jpg',
                 movie_name   => 'Новолуние',
                 date_create  => '2009-11-10',
                 date_upload  => '2009-11-10',
                 date_changes => '2009-11-10',
                 paid_status  => 0,
                 },
                ];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: Показать список фильмов из заказов
# Аргументы (* - помечены необязательные):
# user_id,
# serial_id,(если сериал) *
# from(int),to(int) - определяет размер выборки (от и до) для списка *
# sort(name|date) - сортировать выборку по имени (умолчание), дате *
# sort_order(asc|desc) - направление сортировки, asc по умолчанию *
# Возвращает: массив хэшей с именами ключей:
# 1. {movie_id} id фильма
# 2. {percent} - процент заказчики
# 3. {foto_url} url на фото
# 4. {movie_name} название фильма/сериала
# 5. {date_create} дата создания, 6. {date_upload} дата загрузки, 7. {date_changes} дата изменения
# 8. {paid_status} статус оплаты (1|0);
# 9. {serial_id}  - будет !=0 если является фильм сериалом
# ?
sub movie_show_order {
    my $class = shift;
    # аргументы
    my %args = (
            user_id    => 0,
            serial_id  => 0,
            from       => 0,
            to         => 100,
            sort       => 'name',
            sort_order => 'asc',
            @_,
    );
    # данные для заглушки
    my $data = [
                {
                 movie_id     => 12345,
                 percent       => 1,
                 foto_url     => 'http://film.ru/1.jpg',
                 movie_name   => 'Терминатор 2',
                 date_create  => '2009-11-10',
                 date_upload  => '2009-11-10',
                 date_changes => '2009-11-10',
                 paid_status  => 1,
                 serial_id    => 0,
                 },
                {
                 movie_id     => 0,
                 percent      => 0,
                 foto_url     => 'http://film.ru/3.jpg',
                 movie_name   => 'Футурама',
                 date_create  => '2009-11-10',
                 date_upload  => '2009-11-10',
                 date_changes => '2009-11-10',
                 paid_status  => 0,
                 serial_id    => 130,
                 },
                ];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: Показать список фильмов из плейлиста
# Аргументы (* - помечены необязательные):
# playlist_id (т.к. id уникально для всех юзеров),
# serial_id,(если сериал) *
# from(int),to(int) - определяет размер выборки (от и до) для списка *
# Возвращает: массив хэшей с именами ключей:
# 1. {movie_id} id фильма
# 2. {foto_url} url на фото
# 3. {movie_name} название фильма/сериала
# 4. {serial_id}  - будет !=0 если является фильм сериалом
# MySQL
sub movie_show_playlist {
    my ($class, $in, $config) = @_;
    my @array = ();
    ## данные извлекаем из БД на основании id плейлиста
    my $rs = $class->{dbh}->{connect}->
                resultset('Userplaylistfilms')
                        ->search(
                                 {playlistid => $in->{playlist_id}},
                                 {
                                    join      => 'playlistfilmid',
                                    '+select' => ['playlistfilmid.id', 'playlistfilmid.name',
                                                  'playlistfilmid.photo_url', 'playlistfilmid.serial_id'],
                                                  
                                  }
                                 );
    # вносим в массив
    while (my $row = $rs->next) {
        push(@array, {
                     movie_id    =>$row->playlistfilmid->id,
                     movie_name   =>$row->playlistfilmid->name,
                     foto_url  =>$row->playlistfilmid->photo_url,
                     serial_id   =>$row->playlistfilmid->serial_id,
                     });
    }
    
    # from ,to делаем через слайс
    if(defined $in->{to} || defined $in->{from}) {
        my $from = $in->{from} || 0;# либо с самого начала
        my $to   = $in->{to} || @array;# либо все до последнего эл-та
        @array = splice(@array, $from, $to);
    }
        # переводим в JSON
        return $class->{json}->encode(\@array);
}

# Назначение: Показать инфорацию о фильме подробно
# Аргументы (* - помечены необязательные):
# user_id, movie_id,
# Возвращает: массив:
# 1. id фильма
# 2. url на фото
# 3. [массив url на трейлеры]
# 4. название фильма/сериала
# 5. [массив тэгов]
# 6. Жанр
# 7. год выпуска
# 8. режисер
# 9. [актеры]
# 10. Описание
# 11. Стоимость
# 12. Рейтинг

sub movie_show_detail {
    my $class = shift;
    # аргументы
    my %args = (
            user_id     => 0,
            movie_id    => 0,
            @_,
    );
    # данные для заглушки
    # Алгоритм: 1. запрос из БД, запрос из ЛБ стоимости фильма, запрос из ИМХОНЕТ рейтинга
    my @data =  (12345,'http://film.ru/1.jpg',['http://film.ru/3.avi','http://film.ru/2.mpg'],
                 'Терминатор 2',['фантастика','боевик','шварц'],'боевик','1996','Режиссер',
                 ['Шварцнегер','Сара','Актер 3'],'Землю захватили роботы',60.5,3,25);
    # переводим в JSON
    return $class->{json}->encode(\@data);
    
}

##
# Действия на стр.8 для интерфейса
##
# Назначение: Отправить рейтинг (проголосовать)
# Аргументы (* - помечены необязательные):
# movie_id, user_id, rate (1..5)
# Возвращает: новое значение рейтинга
sub movie_rate {
    my $class = shift;
    # аргументы
    my %args = (
            user_id     => 0,
            movie_id    => 0,
            rate        => 4,
            @_,
    );
    # данные для заглушки
    my $data =  [3.24];
    # переводим в JSON
    return $class->{json}->encode($data);
   
}
# Назначение: Добавить тэг
# Аргументы (* - помечены необязательные):
# movie_id, user_id, tag
# Возвращает: массив тэгов, статус операции (0/1):
sub movie_add_tag {
    my $class = shift;
    # аргументы
    my %args = (
            user_id     => 0,
            movie_id    => 0,
            tag         => 'Жуть!',
            @_,
    );
    # данные для заглушки
    my @data = (['Жуть','боевик','шварц'],1);
    # переводим в JSON
    return $class->{json}->encode(\@data);
    
}
# Назначение: Отметить как понравилось
# Аргументы (* - помечены необязательные):
# movie_id, user_id, flag (1|0) - (1 - понравилсь, 0 - снять статус понравившегося)
# Возвращает: статус операции (0|1);
sub movie_mark_favor {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -movie_id    => 0,
            -flag        => 0,
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
}
# Назначение: Добавить комментарий
# Аргументы (* - помечены необязательные):
# movie_id, user_id, comment
# Возвращает: статус операции (0|1)
sub movie_add_comment {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -movie_id    => 0,
            -comment     => '',
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);

}
# Назначение: Показать отзывы о фильме (с .. по ..)
# Аргументы (* - помечены необязательные):
# movie_id, from, to
# Возвращает: массив хэшей с ключами:
# 1. {user_id} - 
# 2. {user_name} - имя автора
# 3. {comment} - текст комментария
sub movie_show_comments {
    my $class = shift;
    # аргументы
    my %args = (
            -movie_id    => 0,
            -from        => '',
            -to          => '',
            @_,
    );
    # данные для заглушки
    my @data =  ([{user_id => 1234,user_name => 'Вася',comment => 'Классный фильм!'}],
                 [{user_id => 1235,user_name => 'Вова',comment => 'Ацтойный фильм!'}]
                 );
    # переводим в JSON
    return $class->{json}->encode(\@data);

}
# Назначение: Оплатить фильм
# Аргументы (* - помечены необязательные):
# user_id, movie_id
# Возвращает: статус операции (0\1):
sub movie_pay {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -movie_id    => 0,
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
}
# Назначение: Предложить другу (вызывается после получения списка друзей)
# Аргументы (* - помечены необязательные):
# movie_id, user_id, friend_id (передаем id друга/друзей, которому предложить)
# friend_id в случае нескольких id передаем через точку с запятой
# Возвращает: статус операции (0\1):
sub movie_offer_friend {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -movie_id    => 0,
            -friend_id   => '12345;12346;13567',
            @_,
    );
    # примерно так
    my @friends = split(/;/,$args{-friend_id});
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: Запрос торрент ссылки по movie_id
# user_id, movie_id
# Возвращает: массив хэшей с ключами:
# {movie_id} => 'url'
sub movie_get_torrent_link {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -movie_id    => 0,
            @_,
    );
        # данные для заглушки
    my $data =  [{132312565 => 'url'}];
    # переводим в JSON
    return $class->{json}->encode($data);    
}
##############################################
# Методы для обработки событий с "Плейлистами
##############################################
# Назначение: Добавляем новый playlist
# Аргументы:
# user_id, playlist_name
# 
# Возвращает: playlist_id, статус операции (0/1):
sub playlist_add {
    my ($class, $in, $config) = @_;
    
    # коннект к БД
    my $rs = $class->{dbh}->{connect}->resultset('Userplaylists');
    my $id = $rs->get_column('playlistid');
    $id = $id->max + 1;
    # date
    my (undef,undef,undef,$mday,$mon,$year,undef,undef,undef) = localtime(time);
    $year+=1900;
    $mon+=1;
    # date
    my $data = {
                playlistid => $id,
                playlistname => $in->{playlist_name},
                userid => $in->{user_id},
                datecreated => 'CURRENT_TIMESTAMP',
                datechanged => "$year-$mon-$mday",
                };
    $class->{dbh}->{connect}->resultset('Userplaylists')->create($data);
    $data = [$id,1];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: Удаляем playlist
# Аргументы: user_id, playlist_id 
# 
# Возвращает: статус операции (0/1):
sub playlist_del {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id      => 0,
            -playlist_id  => 0,
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: Добавляем в playlist
# Аргументы: user_id, playlist_id, movie_id 
# 
# Возвращает: статус операции (0/1):
sub playlist_add_movie {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -playlist_id => 0,
            -movie_id    => 0,
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: Удаляем из playlist
# Аргументы: user_id, playlist_id, movie_id 
# 
# Возвращает: статус операции (0/1):
sub playlist_del_movie {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -playlist_id => 0,
            -movie_id    => 0,
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

# Назначение: показывает список плейлистов пользователя
# Аргументы: user_id,
# Возвращает хэш:
# { play_list_id => playlist_name, }
sub playlist_show {
    my ($class, $in, $config) = @_;
    my $data = undef;
    # коннект к БД
    my $rs = $class->{dbh}->{connect}->resultset('Userplaylists')->search({userid => $in->{user_id}});
    
    while(my $row = $rs->next) {
        $data->{$row->playlistid} = $row->playlistname;
    }
    return $class->{json}->encode($data);
}
#############################################
# Методы для обработки событий с "Друзьями"
#############################################
# Назначение: показать "Друзья смотрели"
# Аргументы: 
# user_id, serial_id*,
# from(int),to(int) - определяет размер выборки (от и до) для списка *
# sort(name|date) - сортировать выборку по имени (умолчание), дате *
# sort_order(asc|desc) - направление сортировки, asc по умолчанию *
# Возвращает: массив хэшей с именами ключей:
# 1. {movie_id} id фильма
# 2. {foto_url} url на фото
# 3. {movie_name} название фильма/сериала
# 4. {serial_id}  - будет !=0 если является фильм сериалом
# 5. {friend_id} - id пользователя (друга)
# 6. {friend_name} - имя друга
sub friends_watched {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -serial_id   => 0,
            -from        => 0,
            -to          => 100,
            -sort        => 'name',
            -sort_order  => 'asc',
            @_,
    );
    # данные для заглушки
    my $data = [
                {
                 movie_id     => 12345,
                 foto_url     => 'http://film.ru/1.jpg',
                 movie_name   => 'Терминатор 2',
                 serial_id    => 0,
                 friend_id    => 1435,
                 friend_name  => 'Вова',
                 },
                {
                 movie_id     => 12245,
                 foto_url     => 'http://film.ru/3.jpg',
                 movie_name   => 'Футурама',
                 serial_id    => 234,
                 friend_id    => 1433,
                 friend_name  => 'Вася',
                 },
                ];
    # переводим в JSON
    return $class->{json}->encode($data);

}

# Назначение: Список друзей/общих друзей
# Аргументы (* - помечены необязательные):
# user_id, share* (1|0) - показать общих друзей, показать своих друзей
# Возвращает: массив:
# 1. id друга
# 2. Имя друга
# 3. Ссылка на фото
sub friends_list {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -share       => 0,
            @_,
    );
    # данные для заглушки
    my @data = ([134,'Вася','http://film.ru/1.jpg'],[133,'Вова','http://film.ru/2.jpg']);
    # переводим в JSON
    return $class->{json}->encode(\@data);
}
# Назначение: Показать Профайд друга
# Аргументы: user_id, friend_id
# 
# Возвращает: массив:
#1. id друга
#2. Имя друга
#3. Ссылка на фото
#4. О себе
sub friend_profile {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -friend_id   => 0,
            @_,
    );
    # данные для заглушки
    my @data = ([134,'Вася','http://film.ru/1.jpg','Крутой перец!'],[133,'Вова','http://film.ru/2.jpg','Фанат']);
    # переводим в JSON
    return $class->{json}->encode(\@data);

}

# Назначение: Публичный контент друга  
# Аргументы (* - помечены необязательные): 
# user_id, friend_id, serial_id*,
# from(int),to(int) - определяет размер выборки (от и до) для списка *
# sort(name|date) - сортировать выборку по имени (умолчание), дате *
# sort_order(asc|desc) - направление сортировки, asc по умолчанию *
# Возвращает: массив хэшей с именами ключей:
# 1. {movie_id} id фильма
# 2. {foto_url} url на фото
# 3. {movie_name} название фильма/сериала
# 4. {serial_id}  - будет !=0 если является фильм сериалом
# 5. {friend_id} - id пользователя (друга)
# 6. {friend_name} - имя друга
sub friend_content {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -serial_id   => 0,
            -friend_id   => 0,
            -from        => 0,
            -to          => 100,
            -sort        => 'name',
            -sort_order  => 'asc',
            @_,
    );
    # данные для заглушки
    my $data = [
                {
                 movie_id     => 12345,
                 foto_url     => 'http://film.ru/1.jpg',
                 movie_name   => 'Терминатор 2',
                 serial_id    => 0,
                 friend_id    => 1435,
                 friend_name  => 'Вова',
                 },
                {
                 movie_id     => 12245,
                 foto_url     => 'http://film.ru/3.jpg',
                 movie_name   => 'Футурама',
                 serial_id    => 234,
                 friend_id    => 1433,
                 friend_name  => 'Вася',
                 },
                ];
    # переводим в JSON
    return $class->{json}->encode($data);

}
# Назначение: Удаляем/Добавляем друга
# Аргументы: user_id, friend_id, act (add/dell)
# Возвращает: статус операции (0/1):
sub friend_edit {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -friend_id => 0,
            -act        => 'add',
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);

}

# Назначение: Поиск друзей в системе
# Аргументы: user_id, keyword
# Возвращает: массив:
# 1. id друга
# 2. Имя друга
# 3. Ссылка на фото
sub friend_search {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            -keyword     => 'Костик',
            @_,
    );
    # данные для заглушки
    my @data = ([134,'Костик Пахомов','http://film.ru/1.jpg'],[133,'Костик Мостик','http://film.ru/2.jpg']);
    # переводим в JSON
    return $class->{json}->encode(\@data);

}
##################################################
# Методы для обработки событий с "Сообщениями"
##################################################
# Назначение: Сообщения друга
# Аргументы (* - помечены необязательные):
# user_id, friend_id, from* , to(int)* (диапазон с .. по ..) 
# Возвращает: массив хэшей с ключами:
# 1. user_id
# 2. id сообщения
# 3. время отправки сообщения unixtime
# 4. тело сообщения
# 5. friend_id
# 6. прочитано ли сообщение получателем (0 или 1)
sub messages_friend {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id    => 0,
            -friend_id  => 0,
            -from       => 0,
            -to         => 100,
            @_,
    );
    # данные для заглушки
    my @data =  ({user_id => 123, message_id => 123046,
                   time => 1258981093, message => 'Привет! Как дела?',
                   friend_id => 124,status => 1},
                 {user_id => 124, message_id => 123047,
                   time => 1258981099, message => 'Чем занимаешься?',
                   friend_id => 123,status => 0});
    # переводим в JSON
    return $class->{json}->encode(\@data);    
}
# Назначение: Написать сообщение
# Аргументы: 
# user_id, friend_id, message
# Возвращает: статус операции (0/1):
sub message_post {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id    => 0,
            -friend_id  => 0,
            -message    => '',
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
}

##################################################
# Методы для обработки событий с "Locations"
##################################################
# Назначение: Добавить location
# Аргументы:  
# user_id, url
# Возвращает: статус операции (0/1):
sub location_add {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id    => 0,
            -url        => '',
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
}
# Назначение: Удалить Location
# Аргументы: 
# user_id, url 
# Возвращает: статус операции (0/1):
sub location_del {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id    => 0,
            -url        => '',
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
}
# Назначение: Проверить доступность location
# Аргументы: 
# # user_id, url
# Возвращает: статус доступности (0 -нет /1 - доступно):
sub location_available {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id    => 0,
            -url        => '',
            @_,
    );
    # данные для заглушки
    my $data =  [1];
    # переводим в JSON
    return $class->{json}->encode($data);
}
# Назначение: Сканировать LAN
# Аргументы: user_id
# Возвращает: массив:
# 1. url на фото  (?)
# 2. ссылку на ресурс
sub location_scan_lan {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            @_,
    );
    # данные для заглушки
    my @data =  (['http://film.ru/foto.jpg','smb://10.2.0.1/home'],['http://film.ru/foto2.jpg','smb://10.2.0.2/home']);
    # переводим в JSON
    return $class->{json}->encode(\@data);
}

##################################################
# Методы для обработки событий с "Настройками/ЛК"
##################################################
# Назначение: Показывает настройки профиля/ сохраняет настройки при
# передаче необязательных аргументов
# Аргументы (* - помечены необязательные):
# user_id,
# hist * , histXXX *, public - показывать историю, /-/ XXX, показывать инфо
# принимают значения 1 или 0 (да, нет -  соответственно)
# Возвращает массив:
# 1. ссылка на фото
# 2. массив хэшей с элементами:
# {hist} - показывать историю (1|0)
# {histXXX} - показывать историю XXX (1|0)
# {public} - показывать инфо обо мне (1|0)
sub user_profile {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id  => 0,
            -hist     => 0,
            -histXXX  => 0,
            -public   => 0,
            @_,
    );
    # данные для заглушки
    my @data =  ('http://film.ru/foto.jpg',{hist => 1, histXXX => 0, info => 1});
    # переводим в JSON
    return $class->{json}->encode(\@data);
}
# Назначение: Показать список пользователей
# Аргументы:  
# user_id
# Возвращает: массив массивов:
# 1. account_id
# 2. url на фото
# 3. имя пользователя
sub user_accounts {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id  => 0,
            @_,
    );
    # данные для заглушки
    my @data =  ([123,'http://film.ru/foto.jpg','Мама'],[124,'http://film.ru/foto2.jpg','Аня']);
    # переводим в JSON
    return $class->{json}->encode(\@data);
}
# Назначение: Добавить пользователя
# Аргументы:  
# user_id, account_name
# Возвращает: id пользователя (account_id,) статус операции (0/1)
sub user_acc_add {
    my ($class, $in) = @_;
    return $class->{json}->encode([$in->{email}]);
    # аргументы
    my $tarid = 1; # ID тарифа не должен передавать STB его формирует система

    ## creating    
    if (($in->{name} eq undef) || ($in->{email} eq undef) || ($in->{birthday} eq undef)) {
	return $class->{json}->encode([undef]);
    } else {
        my $agr = getNextAgreement();
        my $data = addAccount($agr, "2", $in->{name}, $tarid, $in->{email}, $in->{birthday}); 
	return $class->{json}->encode([$data]);
    }

}
# Назначение: Удалить пользователя
# Аргументы:  
# user_id, account_id
# Возвращает: статус операции (0/1):
sub user_acc_del {
    my ($class, $in) = @_;  

    # аргументы
#    my %args = (
#            -user_id    => 0,
#            -account_id => 0,
#            @_,
#    );

    my $agr = "";
    $in->{agr} =~ /(\d{10})/; 
    if (defined($1)) {
        $agr = $1;
    } else {
        return $class->{json}->encode([0]);
    }

    ## удаляем в биллинге
    my $data = delAccount($agr);
    # переводим в JSON
    return $class->{json}->encode([$data]);

}
# Назначение: Показать настройки пользователя/сохранить настройки
# Аргументы (* - помечены необязательные):
# user_id, account_id,
# balance*,cost_limit*,age_limit*
# PIN*,rePIN* - пин и повтор пина
# browser*
# Возвращает: ссылку на хэш
# {balance} - остаток на счете (number)
# {cost_limit} - месячный лимит (number)
# {age_limit} - возрастной лимит (8,12,17,21)
# {browser} - разрешить броузер (1|0)
sub user_account_details {
    my ($class, $in) = @_;  
    # аргументы
#    my %args = (
#            -user_id    => 0,
#            -account_id => 0,
#            -balance    => 0,
#            -cost_limit => 0,
#            -age_limit  => 8,
#            -PIN        => 0,
#            -rePIN      => 0,
#            -browser    => 1,
#            @_,
#    );

    my $agr = "";
    $in->{agr} =~ /(\d{10})/; 
    if ((defined($1))||$1 ne "") {
        $agr = $1;
    } else {
        return $class->{json}->encode([0]);
    }

    my $data = getAccount($agr);
    # данные для заглушки
    #my $data =  {balance => 1400.5,cost_limit => 700,age_limit => 17, browser => 1};
    # переводим в JSON
    return $class->{json}->encode([$data]);
}
# Назначение: Баланс пользователя
# Аргументы:  
# user_id
# Возвращает: баланс и валюту
sub user_balance {
    my ($class, $in, $config) = @_;  
    my $lb = BES::LB->new($config);

    # аргументы
#    my ($buffer,$name,$value,$user_id) = 0;
#    if (!($in->{user_id} =~ /(\d{10})/)) {
#        return $class->{json}->encode([0]);
#    }
#    my $t{agr} = "5500000001";
#    $in{agr} = $in{user_name};  
    my $data = $lb->getBalance($in);
    # переводим в JSON
    return $class->{json}->encode([$data]);
}


# Назначение: Статистика потребления за период
# Аргументы:  
# user_id, from, to (формат даты: YYYY-MM-DD)
# Возвращает: массив хэшей
# {date} - дата операции
# {account} - имя пользователя (аккаунта)
# {descr} - описание услуги
# {cost} - списанная сумма
sub user_statistic {
    my ($class, $in, $config) = @_;
    #my $class = shift;
    # аргументы
    my %args = (
            -user_id    => 0,
            -from       => 0,
            -to         => 0,    
            @_,
    );
    
    my $lb = BES::LB->new($config);
    my %in     = undef;
    $in->{user_id} = "5500000003";
    
    my @pay = $lb->getPayments($in);
    my @spent = $lb->getStats($in);
    
    my @opers = ();
    push(@opers,@spent);
    push(@opers,@pay); 
    
    # сортировка по дате
    my @sorted_opers = sort {_timec($a->{date}) <=> _timec($b->{date})} @opers;
    
    # данные для заглушки
#    my @data =  ({date => '2009-12-03 12:45:55',account => 'Личный',descr =>'Просмотр фильма Матрица',cost =>50},
#                 {date => '2010-01-05 02:35:55',account => 'Аня',descr =>'Просмотр фильма терминатор',cost =>25});
    # переводим в JSON
    return $class->{json}->encode(\@sorted_opers);
}

sub _timec ($){                                                                                                                                               
    $_[0] =~ /^(\d+)-(\d+)-(\d+)\s(\d+):(\d+):(\d+)$/;                                                                                                       
    my $numeric_time = timelocal ($6, $5, $4, $3, $2-1, $1-1900);                                                                                            
    return $numeric_time;                                                                                                                                    
}

# Назначение: Рекомендации для пользователя (из имхонета)
# Аргументы:  
# user_id
# Возвращает: массив массивов хэшей с именами ключей:
# 1. {movie_id} id фильма
# 2. {foto_url} url на фото
# 3. {movie_name} название фильма/сериала
# 4. {serial_id}  - будет !=0 если является фильм сериалом
sub user_reccomend {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id     => 0,
            @_,
    );
    # данные для заглушки
    my $data = [
                {
                 movie_id     => 12345,
                 foto_url     => 'http://film.ru/1.jpg',
                 movie_name   => 'Терминатор 2',
                 serial_id    => 0,
                 },
                {
                 movie_id     => 32154,
                 foto_url     => 'http://film.ru/3.jpg',
                 movie_name   => 'Футурама',
                 serial_id    => 0,
                 },
                ];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}

############################################
# Add-on method... или просто то что не учли
############################################
# Назначение: Получить ключ по id транзакции
# Аргументы:  user_id, transact_id
# Возвращает: массив с 1 элементом
# 1. drm_key
sub get_DRM_key {
    my $class = shift;
    # аргументы
    my %args = (
            -user_id      => 0,
            -transact_id  => 0,
            @_,
    );
    # данные для заглушки
    my $data =  ['ASOJNIHBAUSCVUBAICXUYUAB'];
    # переводим в JSON
    return $class->{json}->encode($data);
    
}
# Назначение: Сообщает нам об успешном получении файлов 
# через torrent-клиент на STB (медиаобъекта)
# Аргументы: user_id, movie_id
# Возвращает: 1 
sub user_got_movie {
    my ($class, $in) = @_;  
    # аргументы
#    my %args = (
#            user_id => 0,
#            movie_id => 0,
#            @_,
#    );

    ## при получении клиентом фильма надо списать деньги в биллинге

    ## get query
    my ($query_string, $user_id, $movie_id) = "";
    $in->{user_id} =~ /(\d{10})/; 
    if (defined($1)) {
        $user_id = $1;
    } else {
        return $class->{json}->encode([0]);
    }

    ## эти параметры должны формироваться системой, а не STB
    my $tarid = 1;
    my $catid = 1;
    my $count = 1;

    my $data = addAccService($user_id, $tarid, $catid, $count);
#    my $data = $catid;
    # переводим в JSON
    return $class->{json}->encode([$data]);
}

##
# обработка ошибок
# в случае системной ошибки возвращает хэш:
# status => -1
# errmsg => 'системное сообщение'
sub catch_error {
    my ($class, $error) = @_;
    my %error_hash = (
                      status  => -1,  
                      errmsg  => $error,
                      );
    # переводим в JSON
    return $class->{json}->encode(\%error_hash);
}

1;
