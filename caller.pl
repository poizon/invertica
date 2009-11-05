#!/usr/bin/perl -w
use strict;

use lib qw(.);
use API::STB qw (show_movie_titles show_movie_tags show_movie_comments stb_error);
use CGI qw(header param);

print header(-charset => 'utf8');
print qq(<title>Интерфейс  STB</title>);
my $mode = param('mode') || 'error';
my $id = param('id') || 0;

my %hash = ( 'showMovieTitles'   => \&show_movie_titles,
             'showMovieTags'     => \&show_movie_tags,
             'showMovieComments' => \&show_movie_comments,
             'error'             => \&stb_error,
            );

if(!param) {
    print $hash{error}->($id);
} else {
    print $hash{$mode}->($id);
}
