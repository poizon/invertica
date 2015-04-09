#!/usr/bin/perl -w
$|=1;
use strict;

use lib qw(.);
use BES::LB;
use CGI::Simple;
use YAML qw(LoadFile);
use utf8;
use open qw(:std :utf8);
use Data::Dumper;
my $config = LoadFile("config.yml");
my $lb    = BES::LB->new($config);
my $data   = undef;
my %in     = undef;
#my $method = _clean($in{act});

my $q = CGI::Simple->new();  
print $q->header(-charset => 'utf-8');

print $config->{soap}{url};
$in{user_id} = "5500000001";
$data = $lb->getBalance(\%in);
print "\nBALANCE = $data->{balance} $data->{symbol}\n" ;
$in{agr} = "5500000001";
my @data = $lb->getPayments(\%in);
#print Dumper(@data);
#print "<br>@data[0] @data[1] @data[2]";
my $s=@data;
print "<br>$s<br>";
my $i=0;
my @array2=();
for (my $index=0; $index<@data; $index=$index+4) {
    $array2[$i]{a} = $data[$index];
    $array2[$i]{aa} = $data[$index+1];
    $array2[$i]{aaa} = $data[$index+2];
    $array2[$i]{aaaa} = $data[$index+3];
    $i++;
}

my @temp= ([{item => 'один'},{item => 'два'}, {item => 'три'}]);

         
print Dumper(@data);
print Dumper(@array2);
#print "$data->{} $data->{symbol}" ; 

#use BES::LB qw (getNextAgreement isAccountsExist addAccount addAccService addTariff addTarCategory delAccount delVgroup getBalance delAccService);
#print getNextAgreement ();
#print isAccountsExist("777785");
#my $tmp = getNextAgreement();
#print $tmp;
#my $tmp2 = addTariff("Первый тариф");
#my $tmp2 = addTarCategory("Покупка кино (ежедн)",1,100,3);
#print $tmp2;
#my $tmp2 = addAccount(5500000001,"2","Петров Петр Степаныч","1", "nikk\@nikk.net.ru", "2009-12-16");
#my $tmp2 = getBalance("5500000001");
#delAccService("6");

#print $tmp2;

$in{agr} = "5500000001";                                                                                                                                     
@data = $lb->getStats(\%in);
print Dumper(@data->{val});
