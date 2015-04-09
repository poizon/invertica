package BES::Schema::Operads;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("OperAds");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "operid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "level",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 255 },
  "dayvisits",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 255 },
  "screenplace",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "fileid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to("operid", "BES::Schema::Operators", { operid => "operid" });


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O6LNWIiOFSzqZa1eokMQZA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
