#!/usr/bin/perl -w

use warnings;
use strict;

# тест генератор для апи

open(FILE,"<","API/STB/PersonalArea.pm") || die "$!";
while(<FILE>) {
    chomp;
    next unless /^sub/;
    /^sub\s(.+)\s\{/;
    #print $1 . " ";
    my $sub = '\&'.$1.',';
    my (@caller) = split(/_/,$1);
    my $call = undef;
    foreach my $part (@caller) {
        $part = ucfirst $part;
        $call .= $part;
    }
    #print "\t\t\t'".lcfirst $call."' => $sub\n";
    print "<tr><td><a href=\"?mode=".lcfirst $call."&id=100\" target=\"_self\">Название</a></td><td>Описание</td></tr>\n";
}

#<tr><td>link</td><td>descr</td></tr>