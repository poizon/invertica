#!/usr/bin/perl -w
use strict;

use lib qw(.);
use DBtest::Schema;

# автосоздание классов по БД. Пример:
# perl -MDBIx::Class::Schema::Loader=dump_to_dir:/foo/bar -MMy::Schema -e 'My::Schema->connection("dbi:Pg:dbname=foo", ...)'
#

# коннект к БД
my $schema = DBtest::Schema->connect('dbi:mysql:host=localhost;database=amarok','root','');

# простая выборка
my @artist = $schema->resultset('Artist')->search({id => { '>' => 0}});
# вывод на печать
foreach my $name (@artist) {
    print $name->name,"\n";
}

# JOIN'ы + прописываем связи в пакетах по belongs_to
#SELECT t.title,t.url,a.name FROM tags t JOIN album a ON t.album=a.id
my $rs = $schema->resultset('Tags')->search(
                                    { 'me.album'  => {'>' => 0} },
                                    { prefetch => ['Album'] });

print "=================\n";
while (my $name = $rs->next) {
print $name->title,"\n";
}

# пейджинг ?
print "====== PAGE ======\n";
#my $pagez = my_pages();

#
#foreach my $name (@pagez) {
#    print $name->name,"\n";
#}

#sub my_pages {
#my $rs_pages = $schema->resultset('Artist')->search(
#    undef,
#    {
#      page => 1,  # page to return (defaults to 1)
#      rows => 3, # number of results per page
#    },
#  );
#
#print $rs_pages->all(); # all records for page 1
#
#print $rs_pages->page(2); # records for page 2
#
#}

print "++++ INSERT ++++\n";

# insert'ы
# если использовать create - то сразу инсерт в БД,
# если new - то инсерт только после вызова ->insert
#my $newpath = $schema->resultset('Artist')->new(
#  {
#     id    => 20,  
#     name => 'Rammstein 3',
#  });
#
##print $newpath->in_storage();  ## 0 (FALSE)
#$newpath->insert();
## добавили в БД. Проверка 
#print $newpath->in_storage(),"\n";  ## 1 (TRUE)

# update
# апдейтим 1 строку
print "+++++ UPDATE +++++\n";
#my $namerow = $schema->resultset('Artist')->find({ id => 20 });
#$namerow->name('Popsa 11');
#$namerow->update;    ## UPDATE

# апдейтим сразу несколько строк
#my $name_rs = $schema->resultset('Name')->search(
#  {
#    'me.name' => 'Evaluation',
#  });
#$name_rs->update({ name => 'Free Trial' });  ## UPDATE .. WHERE

# delete
print "========= DEleTE =======\n";

#my $namerow = $schema->resultset('Artist')->find({ id => 20 });
#$namerow->delete;
# удалить несколько
#my $path_rs = $schema->resultset('Path')->search(
#  {
#    'me.path' => 'products/es',
#  });
#  $path_rs->delete;     ## DELETE .. WHERE

# КАСКАДНОЕ УДАЛЕНИЕ. Согласно зависимостям в пакетах
# To delete multiple rows with cascading, call delete_all on the ResultSet, which will delete each row and its related rows individually.
#@  $path_rs->delete_all;    ## many DELETE statements

