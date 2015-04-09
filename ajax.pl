#!/usr/bin/perl -w
$|=1;
use strict;
use CGI::Simple;
use File::Temp;

$CGI::Simple::DISABLE_UPLOADS = 0;      # enable uploads
$CGI::Simple::POST_MAX = 1_048_576;     # allow 1MB uploads

my $q = CGI::Simple->new();

my $filename = $q->param('Filedata');
my %in = $q->Vars();
my $tempfile = File::Temp::tempnam( '/tmp', 'INV' );
my $ok = $q->upload( $q->param('Filedata'), $tempfile );

print $q->header(-charset => 'utf8');

if ($ok) {
    print qq($filename|$tempfile);     
} else {
    print STDERR $q->cgi_error();
}
