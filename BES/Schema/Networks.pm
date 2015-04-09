package BES::Schema::Networks;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Networks");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "name",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "regcustomers",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "allcustomers",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "regionsid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "resourceid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "description",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "regionsid",
  "BES::Schema::Regions",
  { resourceid => "regionsid" },
);
__PACKAGE__->has_many(
  "operauds",
  "BES::Schema::Operaud",
  { "foreign.networksid" => "self.resourceid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yYU5NfH55j/8XKQKFYRLcw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
