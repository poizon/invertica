#!/usr/bin/perl -w
#
$|=1;

use strict;

use lib qw(.);
use CGI qw(header Vars);
use API::STB qw (:MENU);
# входные данные
my %in = Vars();

my %mode = (
            content => \&show_content,
            default => \&show_menu,
            );

print header(-charset => 'utf8');

if (!$in{mode}) {
    print $mode{default}->(\%in);
} else {
    print $mode{$in{mode}}->(\%in);
}
