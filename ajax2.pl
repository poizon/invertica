#!/usr/bin/perl -w
# ajax2.pl
$|=1;
use strict;
use CGI::Simple;
use FES::RH qw (bad_session);
use BES::Common qw (abs_dir);
use YAML qw(LoadFile Load);
use Storable;

$CGI::Simple::DISABLE_UPLOADS = 0;      # enable uploads
$CGI::Simple::POST_MAX = 1_048_576;     # allow 1MB uploads

# конфиг
my $path = abs_dir();
my $config = LoadFile("$path/config.yml");

my $q = CGI::Simple->new();
# входные данные
#my $filename = $q->param('Filedata');
my %in = $q->Vars();
#print STDERR "$config->{dir}{files}/$in{rhid}/0" and exit 0;
# создаем папку для хранения аватарки если она не существует
mkdir ("$config->{dir}{files}/$in{rhid}/0") unless (-d "$config->{dir}{files}/$in{rhid}/0");
# сохраняем картинку в папку
my $ok = $q->upload( $q->param('Filedata'), "$config->{dir}{files}/$in{rhid}/0/avatar.jpg" );

print $q->header(-charset => 'utf8');

if ($ok) {
    1;     
} else {
    print STDERR $q->cgi_error();
}
