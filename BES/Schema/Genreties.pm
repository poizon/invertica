package BES::Schema::Genreties;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("GenreTies");
__PACKAGE__->add_columns(
  "movieid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "genreid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
);
__PACKAGE__->belongs_to("movieid", "BES::Schema::Mediaobjects", { id => "movieid" });
__PACKAGE__->belongs_to("genreid", "BES::Schema::Genres", { id => "genreid" });
__PACKAGE__->set_primary_key('movieid','genreid');# add manual

# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-12-27 21:03:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sJ4jmv/QsY286XeVvITPzQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
