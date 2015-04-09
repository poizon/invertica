#!/usr/bin/perl -w
use strict;
use warnings;

# скрипт мониторинга -
# 1. Читаем лог-файлы:
# читаем директорию с лог файлами
# выбираем файлы которые больше чем 0 байт
# открываем каждый из них, читаем, анализируем, если ОК - сразу в бд статус,
# если не ок, то читаем - пишем в БД лог, ставим статус, удаляем лог файл
# удаляем в eval функции
# имя файла представляет из себя: ID_File.log.

use lib( '/home/brosku/Invertica/',
    '/home/poiz/develop/Invertica' );
use YAML qw(LoadFile);
use BES::DB;
use BES::Common qw(my_syslog abs_dir);
use IO::File;
use constant DEBUG => 1;

# global config.
# определяем абсолютный путь к папке
my $path   = abs_dir($0);
my $config = LoadFile("$path/config.yml") || "die: $!";

my_syslog($config->{log}{file},'LOG_WIPER','start log_wiper', 'info') if DEBUG;

# манипуляции для крона и контроля запуска
my $pid = 0;
openPidFile("$path/$config->{upload}{pid_file}");
$pid = $$;

# читаем директорию
opendir( DIR, "$path/$config->{upload}{log}" )
  || my_syslog($config->{log}{file}, "Can't read directory $!", 'err' );
my @FILES = grep( !/^.\.?$/, readdir DIR );
close(DIR);

# удаляем пустые файлы
foreach my $file (@FILES) {
    my $file = shift(@FILES);    # берем верхний элемент
      # если размер больше 0, то "пушим" в низ массива
    push( @FILES, $file ) if ( -s "$path/$config->{upload}{log}/$file" > 0 );
}

# читаем файлы, пишем в бд, удаялем
foreach my $file (@FILES) {
    my $fh = IO::File->new();
    if ( $fh->open("< $path/$config->{upload}{log}/$file") ) {

        # читаем строку из файла
        my $str = <$fh>;

        # пишем в базу (статус, лог по ID файла)
        log_to_db( $file, $str );
        $fh->close;
    }   # если не смогли открыть - пишем в сислог
    else {
        my_syslog($config->{log}{file},'LOG_WIPER',"Can't open file - $file:  $!", 'err' );
    }

    # здесь удялем файл
    eval { unlink("$path/$config->{upload}{log}/$file"); };
    if ($@) {
        my_syslog($config->{log}{file},'LOG_WIPER',"Can't delete file - $file:  $!", 'err' );
    }
}

END { unlink "$path/$config->{upload}{pid_file}" if $pid == $$; }
####
# пишем в БД информацию о загрузках, ставим статусы
sub log_to_db {
    my ( $filename, $line ) = @_;
    $filename =~ s/[^0-9]+//g; # убираем все кроме цифр - получаем ID файла
        # коннектимся к бд
    my $db = BES::DB->connect(
        host => $config->{db}{hostname},
        db   => $config->{db}{database},
        user => $config->{db}{username},
        pass => $config->{db}{password},
    );

    # 1 запись т.к. ID - уникально
    my $row = $db->{connect}->resultset('Files')->find($filename);
    if ( $line =~ /^OK/ )
    {   # если статус ОК, то пишем в БД 3 (успешно)
        $row->filestatus(3);
        $row->logmsg("OK");
        $row->update;
    }
    else {
        $row->filestatus(2);    # ошибка
        $row->logmsg($line);    # текст ошибки
        $row->update;
    }

    return 1;
}
#####

