#!/usr/bin/perl -w
use strict;

use lib qw(.);
use API::STB qw (:ALL);
use CGI qw(header param);

print header(-charset => 'utf8');
print qq(<title>Интерфейс  STB</title>);
my $mode = param('mode') || 'error';
my $id = param('id') || 0;

my %hash = ( 'showMovieTitles'   => \&show_movie_titles,
             'showMovieTags'     => \&show_movie_tags,
             'showMovieComments' => \&show_movie_comments,
             'showMovieStatus'   => \&show_movie_status,
             'showUserPlaylist'  => \&show_user_playlist,
             'showUserBalance'   => \&show_user_balance,
             'showUserFriends'   => \&show_user_friends,
             'addMovieRate'      => \&add_movie_rate,
             'addMovieComment'   => \&add_movie_comment,
             'addMovieToPlaylist'=> \&add_movie_to_playlist,
             'addMovieTag'       => \&add_movie_tag,
             'addMoviePay'       => \&add_movie_pay,
             'showUserRecomends' => \&show_user_recomends,
             'error'             => \&stb_error,
            );

if(!param) {
    print $hash{error}->($id);
} else {
    print $hash{$mode}->($id);
}
