package BES::Schema::Regions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Regions");
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
  "resourceid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "networks",
  "BES::Schema::Networks",
  { "foreign.regionsid" => "self.resourceid" },
);
__PACKAGE__->has_many(
  "rhoffers",
  "BES::Schema::Rhoffers",
  { "foreign.regionsid" => "self.resourceid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4PJF/d8Kmk6rK6HJrpP3rg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
