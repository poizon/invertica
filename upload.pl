#!/usr/bin/perl -w
#
use strict;
use warnings;

# скрипт по загрузке на кроне
# 1. Читаем из БД список заданий которые не обработаны
# 2. Ставим им статус в очереди
# 3. Запускаем нити по заданиям, ждем завершения и выходим.
# в Нитях:
# 1. Подключаемся - качаем, пишем в файлы логи:
#   пишем в случае ошибки информацию
# возможно потребуется добавить определение абс пути. см. свои скрипты для cron
use lib('/home/brosku/Invertica/', '/home/poiz/develop/Invertica' );
use YAML qw(LoadFile);
use BES::DB;
use BES::Common qw(my_syslog abs_dir open_pid_file);
use Net::FTP;
use IO::File;
use POSIX qw( WNOHANG );
use constant DEBUG => 1;
$SIG{CHLD} = sub {
    while ( waitpid( -1, WNOHANG ) > 0 ) { }
};

# global config. возможно придетсья прописывать абс. путь
my $path   = abs_dir($0);
my $config = LoadFile("$path/config.yml");
# манипуляции для крона и контроля запуска
my $pid = 0;
openPidFile("$path/$config->{upload}{pid_upload}");
$pid = $$;

# получаем задания из БД
my $jobs = get_jobs_from_db();

# начинаем ветвление
while ( my $hash_ref = pop(@$jobs) ) {
    my $pid = fork();    # форкаемся
    die "fork don't work: $!" unless defined $pid;
    unless ($pid) {      # процесс-потомок
                         # загружаем файло
        my_syslog($config->{log}{file}, 'UPLOADER',"Started with PID: $$") if (DEBUG);
        load_file($hash_ref);
        exit 0;
    }
}


END { unlink "$path/$config->{upload}{pid_upload}" if $pid == $$; }
####################
## SUBS
####################
# загружаем файл
sub load_file {
    my $hash_ref = shift;    # хэш с заданием на закачку
                             # извлекаем имя файла
    $hash_ref->{file} =~ /.+\/(.+)$/ig;
    my $file = $1;

    # переменная для контроля ошибок
    my $error = 0;

    # лог файл
    my $log = IO::File->new();
    $log->open(">> $path/$config->{upload}{log}/$hash_ref->{id}.log")
	    || my_syslog($config->{log}{file}, 'UPLOADER',"Can't write to log, $!",'err');

    # соединяемся с фтп
    my $ftp = Net::FTP->new(
        Host    => $hash_ref->{host},
        Timeout => 20,
    ) or ( print $log "Can't connect: $!<br>" and return -1 );

    # логин
    $ftp->login( $hash_ref->{user}, $hash_ref->{pass} )
      or print $log $ftp->message, "<br>" and $error = 1;

 # пока для всего делаем binary, далее посмотрим
    $ftp->binary;

    # определяем размер файла
    my $remote_size = $ftp->size( $hash_ref->{file} );

    # если файл существует локально, то
    if ( -f "$path/$config->{upload}{to_dir}/$file" ) {

        # локальный размер файла,
        my $local_size = -s "$path/$config->{upload}{to_dir}/$file";

# если не полностью скачен - инициируем докачку
        if ( $remote_size == $local_size ) {
            print $log "OK" unless ($error);
            return 1;
        }
        else {

# инициируем докачку, передавая методу get кол-во байт на локальном диске
            print "resuming load\n" if (DEBUG);
            $ftp->get( $hash_ref->{file},
                "$path/$config->{upload}{to_dir}/$file", $local_size )
              or print $log $ftp->message, "<br>" and $error = 1;
            print $log "OK" unless ($error);
        }
        return 1;
    }

    # сюда попадаем если файла на диске нет
    $ftp->get( $hash_ref->{file}, "$path/$config->{upload}{to_dir}/$file" )
      or print $log $ftp->message, "<br>" and $error = 1;

    # все хорошо
    print $log "OK" unless ($error);
    return 1;
}

###
# получаем из базы список заданий и
# меняем статусы на в очереди
sub get_jobs_from_db {
    my $db = BES::DB->connect(
        host => $config->{db}{hostname},
        db   => $config->{db}{database},
        user => $config->{db}{username},
        pass => $config->{db}{password},
    );

#SELECT Files.ID,Files.FileName,Files.FileSize,Files.FileStatus,Files.LogMsg,Files.FullPath,
#RHFTPs.ServerAdr,RHFTPs.User,RHFTPs.Password,RHFTPs.Flag
#FROM Files INNER JOIN RHFTPs ON Files.FTPID=RHFTPs.ID WHERE Files.FileStatus=0
    my $rs = $db->{connect}->resultset('Files')->search(
        { 'FileStatus' => 0 },
        {
            join      => 'ftpid',   # имя связи, а не таблицы!
            '+select' => [
                'ftpid.serveradr', 'ftpid.user',
                'ftpid.password',  'ftpid.flag'
            ],
            '+as' => [ 'serveradr', 'user', 'password', 'flag' ],
        }
    );

    my @jobs = ();
    while ( my $task = $rs->next ) {

        # формируем массив с заданиями
        push(
            @jobs,
            {
                id   => $task->id,
                host => $task->ftpid->serveradr,
                user => $task->ftpid->user,
                pass => $task->ftpid->password,
                file => $task->fullpath,
            }
        );

        # устанавливаем статус файла
        $task->filestatus(1);    #unless(DEBUG);
                                 # обновляем
        $task->update;           #  unless(DEBUG);
    }
    return \@jobs;
}

# статус в процентах сможем определить посмотрев на файл и сравнив с
# с указанным размеров в бд (то есть на диске еще не скачан (или частично), в БД полный размер)
# исходя из указанного в БД и считанного из файла
# если в log-error чисто - то пишем в БД что заказчка идет,
# если в log-error есть что-то - пишем в БД, и удаляем файл error-log
# при завершении прохода по файлам - чистим время от времени директории
# от лог файлов успешных закачек
