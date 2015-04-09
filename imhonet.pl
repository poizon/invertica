#!/usr/bin/perl -w
use strict;
use lib qw(.);
use BES::IMHO;

my $imho = BES::IMHO->new();

my $status = $imho->edit_rate('t20',29,2);

print "Status: $status\n";

my $rate = $imho->get_rate('t20',29);

print "Object: 29 has rate: $rate\n";