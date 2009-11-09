#!/usr/bin/perl -w
use strict;
# тестим SOAP
use SOAP::Lite;

my $client = SOAP::Lite->service('http://perlmonks.org.ru/api3.wsdl');
$client->proxy('http://127.0.0.1:34012');
$client->getTelClass;

#foreach (@services) {
#    print $_,"\n";
#}
#foreach my $k(keys %$services) {
#    print "$services->{$k}\t$k\n";
#}
print 1;

