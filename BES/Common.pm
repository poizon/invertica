package BES::Common;
use strict;
use warnings;

use Cwd 'abs_path';
use HTML::Template;
use IO::File;
require Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(my_syslog abs_dir prepare_template open_pid_file time2db);

# пишем в сислог
sub my_syslog {
    my ($log_file, $app, $message, $type) = @_;
    $type = 'info' unless defined $type;
    # type: err, info
    my $fh = IO::File->open(">> $log_file");
    if($fh) {
	print $fh localtime() ."[ $app ][ uc($type) ]: ". $message;
    }
    # если тип ошибки err - выходим, иначе продолжаем
    if($type eq 'err') {
    exit 0;
    } else {
        return 0;
    }
}

# путь к рабочей директории скрипта (абсолютный путь)
sub abs_dir {
    #my $file = shift;
    my $cwd = abs_path($0);
    $cwd =~ /^(.+)\/.+$/g; 
    return $1;
}

sub prepare_template {
    my %args = ( -path => '/home/poiz/develop/Invertica/Templates', @_,);
    # возвращаем объект HTML::Template
    return HTML::Template->new(
			       filename => $args{-template},
			       path 	=> $args{-path},
			       die_on_bad_params => 0,
				 );
}

# создание pid файла
sub open_pid_file {
    my $file = shift;           # full path to file
    return 0 if $^O eq 'MSWin32';
    if ( -e $file ) {
        my $fh = IO::File->new($file) || return;
        my $pid = <$fh>;
        die "Script already running with PID $pid" if ( kill( 0, $pid ) );
        warn "Removing PID file for defunct script process $pid.\n";
        die "Can't unlink PID file $file" unless -w $file && unlink $file;
    }

    my $fh = IO::File->new( $file, O_WRONLY | O_CREAT | O_EXCL, 0644 )
      or die "Can't create $file: $!\n";
    print $fh $$;
}

# форматирование времени для БД
sub time2db {
    my $time = shift || time();
    # date
    my (undef,undef,undef,$mday,$mon,$year,undef,undef,undef) = localtime($time);
    $year+=1900;
    $mon+=1;
    #
    return "$year-$mon-$mday 00:00:00";
}
1;
