#!/usr/bin/perl -w
$|=1;
use strict;

use lib qw(.);
use FES::STB;
use CGI::Simple;
use YAML qw(LoadFile);

#my $path = 'd:\tv\Invertica';
my $config = LoadFile("config.yml");
my $q      = CGI::Simple->new();
my $stb    = FES::STB->new($config);
my $data   = undef;
my %in     = $q->Vars();
my $method = _clean($in{act});


print $q->header(-charset => 'utf-8');

if($stb->can($method)) {
eval {$data = $stb->$method(\%in, $config);   };
if($@) {
    $data = $stb->catch_error($@);
}

} else {
    $data = '{"status":-1,"errmsg":"unknown act"}';
}
print $data,"\n";

# здесь чистим входящие данные.
# пока к очистке только параметр act
sub _clean {
my $method = shift || 'movie_show_location';
$method =~ s/[^a-z_0-9]+//g;
$method =~ s/new//g;
return $method;
}