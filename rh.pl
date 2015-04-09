#!/usr/bin/perl -w
$|=1;
use strict;
use warnings;
use lib('/home/brosku/Invertica/', '/home/poiz/develop/Invertica' );
use CGI::Simple;
use BES::DB;
use BES::Common qw(abs_dir);
use FES::RH qw (show_object list_all list_load process
                rh_login bad_session show_login rh_logout show_profile
                show_finance add_object add_mediaobject del_object
                offline show_persons);
use YAML qw(LoadFile Load);

my $q = CGI::Simple->new();
# входные данные
my %in = $q->Vars();
$in{cookie} = $q->cookie('CGISESSID');# сохраняем куки с сессией
# конфиг
my $path = abs_dir();
my $config = LoadFile("$path/config.yml");
# выходной html
my $html;
# коннект к БД
my $db = BES::DB->connect(
        host => $config->{db}{hostname},
        db   => $config->{db}{database},
        user => $config->{db}{username},
        pass => $config->{db}{password},
    );

# если сессия не верна и это не логин - то принудительно отправляем на логин
if(bad_session(\%in) && $in{act} ne 'login') {
    $in{act}='default';
    $in{cookie} = undef;
}

# действие в интерфейсе
my %act = (
           detail  => \&show_object,
           load    => \&list_load,
           process => \&process,
           default => \&show_login,
           login   => \&rh_login,
           logout  => \&rh_logout,
           list    => \&list_all,
           profile => \&show_profile,
           finance => \&show_finance,
           add     => \&add_object,
           add_m   => \&add_mediaobject,
           del_m   => \&del_object,
           offline => \&offline,
           persons => \&show_persons,
            );

# вызов нужной функции
if(exists $in{'act'}) {
    $html = $act{$in{'act'}}->($db, \%in, $config);
} else {
    $html = $act{'default'}->($db, \%in, $config);
}

# выводим страницу
print $q->header(-charset => 'utf-8', -cookie => $in{cookie});
print $html;



