#!/usr/bin/perl -w
#
#
$|=1;

use strict;

use CGI qw(header param);
use Cache::Memcached;
use DBIx::Abstract;


my $db = DBIx::Abstract->connect({
           driver=>'mysql',
           host=>'localhost',
           dbname=>'test',
           user=>'tv',
           password=>'tv',
           });

my  $cache  =  Cache::Memcached->new({servers  => ["127.0.0.1:12345"], debug => 1, compress_threshold => 10000});
# предположим что поступает запрос на выборку инфо по фильму с id = 3
my $id = param('id') || 3;#
# пробуем получить информацию из кэша согласно $id
my $movie_info = $cache->get("movie_id_$id");
print header(-charset=>'utf8');
if(!$movie_info) {
if ($db->select({fields=>'*',table=>'movie',where =>{'movie_id',['=',$id]} })->rows) {
           while (my $data = $db->fetchrow_arrayref) {
             print "From DB: $data->[0] $data->[1]\n";
             $cache->set("movie_id_$id", "$data->[0];$data->[1]");
           }
         }
} else {
    print "From cache: $movie_info\n";
}

