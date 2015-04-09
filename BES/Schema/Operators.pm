package BES::Schema::Operators;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Operators");
__PACKAGE__->add_columns(
  "operid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "operatorname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "datecreated",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
  "datechanged",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("operid");
__PACKAGE__->has_many(
  "operads",
  "BES::Schema::Operads",
  { "foreign.operid" => "self.operid" },
);
__PACKAGE__->has_many(
  "operauds",
  "BES::Schema::Operaud",
  { "foreign.operid" => "self.operid" },
);
__PACKAGE__->has_many(
  "opercrews",
  "BES::Schema::Opercrew",
  { "foreign.operid" => "self.operid" },
);
__PACKAGE__->has_many(
  "operoffers",
  "BES::Schema::Operoffers",
  { "foreign.operid" => "self.operid" },
);
__PACKAGE__->has_many(
  "operprofiles",
  "BES::Schema::Operprofiles",
  { "foreign.operid" => "self.operid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9SXZ4tr/Rbh0pPtcwkJq1w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
