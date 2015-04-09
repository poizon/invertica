package BES::Schema::Genres;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Genres");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "genreties",
  "BES::Schema::Genreties",
  { "foreign.genreid" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FhQz8gWWbRLL6z8irtJCNA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
