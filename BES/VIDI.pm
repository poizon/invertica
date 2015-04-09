package BES::VIDI;
use strict;
use warnings;

=head1 VIDI MMP class
try it!
=cut
use LWP::UserAgent;

our $VERSION = 0.1;
##
# экземпляр класса
sub new {
    my $class = shift;
    my %args = (
                user   => 'ed',
                passwd => 'mmp_ed',
                url    => 'http://192.168.207.90/mmp/cgi-bin/search.fpl',
                @_,
                );
    my $self = bless {}, $class;
    $self->{connect} = LWP::UserAgent->new(timeout => 20, agent => 'Mozilla/5.0' );
    # строка для обращения к vidi mmp, без команды
    $self->{ident_string} = "$args{url}?user=$args{user}&passwd=$args{passwd}&query=";
    return $self;
}

## 
# Метод возвращает версию протокола
# возвращаем строку (скаляр)
sub protocol_ver {
    my $self = shift;
    # нужен массив
    my @content = _run($self,"GetProtocolVersion");
    return 0 if $content[0] =~ /^ERROR/i;
    # во втором элементе - версия протокола
    return $content[1];
}

##
#
sub get_upload_tree {
    my $self = shift;
    # нужна строка с \n
    my $string = _run($self,"GetUploadTree_v4");
    return $string;
}

##
#
sub get_user_attr {
    my $self = shift;
    # нужна строка с \n
    my $string = _run($self,"GetUserAttributes_v4");
    #my $string = qq(OK\nTYPES=[\n{ ID=Source NAME="Исходник" }\n{ ID=Item NAME="Готовый сюжет" }\n{ ID=ArchiveSource NAME="Исходник архива" }\n{ ID=Archive NAME="Архив" }\n]ATTR=[]);
    return 'ERROR' if $string =~ /^ERROR/i;
    # начинаем колдовать с ответом сервера
    $string =~ s/^OK\n//;# удаляем статус
    # парсим в хэш (сложный) данные
    my $data = _parse($string);
    #my %parsed =
    #map { /ID=/ ? +{ m{ID=(\w+) NAME="(.*?)"}sg } : $_ }
    #    $string =~ /^(\w+)=\[(.*?)\]/sgm;

    # упрощаем структуру данных
    # типы
    my %types = (
                Source => $data->{TYPES}->[0]->{Source},
                Item   => $data->{TYPES}->[1]->{Item},
                ArchiveSource   => $data->{TYPES}->[2]->{ArchiveSource},
                Archive   => $data->{TYPES}->[3]->{Archive},
    );
    # аттрибуты
    my %attr = (
                Attr1 => $data->{ATTR}->[0],
    );
    
    # возвращаем ссылки на хэши
    return (\%types,\%attr);
}

##
# в качестве аргумента - путь к папке
# возвращает список ID фильмов как ссылка на массив
sub read_folder {
    my ($self, $folder) = @_;
    # нужен массив
    my @array = _run($self,"ReadFolder&folder=$folder");
    #my $array_ref = ["OK", "CLIPS = [ID1 ID2 ID3]"];
    return 0 if ($array[0] =~ /^ERROR/i );
    $array[1] =~ /\[(.+)\]/g;
    my @ids = split(/\s/,$1);
    return \@ids;
}

##
# аргумент: ID клипа
# возвращает ссылку на хэш с данными по клипу
sub read_clip_info {
    my ($self, $clip_id) = @_;
    my @array = _run($self,"ReadClipInfo&clip=$clip_id");
    my %clip_info=();
    # загоняем данные в хэш из массива
    foreach my $item(@array) {
        my ($key, $val) = split(/\s*=\s*/,$item,2);
        $clip_info{$key}=$val  if(defined($key) && defined($val));
    }
    
    return \%clip_info;
}

##
#CreateClipLink
#
sub create_clip_link {
    my ($self, $folder, $clip_id) = @_;
    my $string = _run($self,"CreateClipLink&folder=$folder&clip=$clip_id");
    return $string;
}
##
# DeleteClipLink
#
sub delete_clip_link {
    my ($self, $folder, $clip_id) = @_;
    my $string = _run($self,"DeleteClipLink&folder=$folder&clip=$clip_id");
    return "OK" unless $string =~ /^ERROR(.+)/;
    return $1;
}

##
# WriteClipInfo
#
sub write_clip_info {
    my ($self, $clip_id, $data) = @_;
    my $string = _run($self,"WriteClipInfo&clip=$clip_id&data=$data");
    return "OK" unless $string = ~/^ERROR(.+)/;
    return $1;
}

   #'AIRTIME' => '""'
   #'AUDIO_INFO' => '"Audio: WAVE, pcm_s16le, 48000 Hz, mono, 768 kb/s\\nAudio: WAVE, pcm_s16le, 48000 Hz, mono, 768 kb/s"'
   #'AUTHOR' => '""'
   #'CITY' => '""'
   #'CLIPIN' => '"00:00:00:00"'
   #'CLIPOUT' => '"00:00:04:08"'
   #'COMMENT' => '""'
   #'COUNTRY' => '" "'
   #'DURATION' => '"00:00:04:08"'
   #'FILE_A1' => '"a_1.wav"'
   #'FILE_A2' => '"a_2.wav"'
   #'FILE_A3' => '""'
   #'FILE_A4' => '""'
   #'FILE_LRV' => '"v.lrv.avi"'
   #'FILE_STILL1' => '"00000001.jpg"'
   #'FILE_V' => '"v0.dif"'
   #'ID' => '"857ae0e4df4d11dea399c15db881b8ad"'
   #'KEYWORDS' => '""'
   #'NAME' => '"Terminator3"'
   #'NLE' => '"NLE1"'
   #'PERSON' => '""'
   #'PROVIDER' => '"РњРѕСЃРєРІР°"'
   #'REEL' => '""'
   #'TIME' => '""'
   #'TRIMIN' => '"00:00:00:00"'
   #'TRIMOUT' => '"00:00:04:08"'
   #'VIDEO_INFO' => '"Video: dvvideo, yuv420p, 720x576 [PAR 118:81 DAR 295:162], 28800 kb/s, 25.00 tb(r)"'
   #'sARCHIVE' => '"0"'
   #'sFOLDER' => '""'
   #'sHASDESCRIPTION' => '"0"'
   #'sHIDDEN' => '"0"'
   #'sMANUALDELETE' => '"0"'
   #'sMEDIA_BUSY' => '"0"'
   #'sMEDIA_ERROR' => '""'
   #'sMEDIA_ERROR_ARCHIVE' => '""'
   #'sMEDIA_ERROR_DELIVERY' => '""'
   #'sMEDIA_ERROR_LRV' => '""'
   #'sMEDIA_EXTERNAL' => '"0"'
   #'sMEDIA_HRV_SIZE' => '"16383256"'
   #'sMEDIA_LRV_SIZE' => '"426658"'
   #'sMEDIA_OFFLINE' => '"0"'
   #'sMEDIA_ONLINE' => '"1"'
   #'sMEDIA_REF_COUNT' => '"2"'
   #'sRESTORE_COUNT' => '"0"'
   #'sTIME_ARCHIVE' => '"1259763500"'
   #'sTIME_ONLINE' => '"1259763500"'
   #'sTIME_TRASH' => '""'
   #'sTRASH' => '"0"'
   #'sTYPE' => '"Source"'
   #'sVN_BLOCK_POSITION' => '""'
   #'sVN_STORY_NAME' => '""'
   #'sVN_STORY_PATH' => '""'
   
###
# privte subs
# отправляет команды на север
# возвращает ответ севера
sub _run {
    my ($self, $command) = @_;
    my $url = $self->{ident_string} . $command;
    # запрос url
    my $content =$self->{connect}->get($url);
    # пока режем ответ в массив
    my $string = $content->content;
    my @array = split(/\n/,$string);
    # возвращаем либо массив, либо строку (с сохраненными \n)
    # в зависимости от контекста
    return wantarray ? @array : $string;
}
###
# парсим ответ в perl-структуру
sub _parse {
    my $line = shift;
    my $struct = undef;
    $line =~ s/ID=(?=[^}]+=[^}]+})//g;
    $line =~ s/NAME//g;
    $line =~s/=/=>/g;
    $line =~s/([\]}])/$1,/g;
    eval '$struct = {' . $line . '};';
    return $struct;
}

1;

###
###