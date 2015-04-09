package BES::Schema::Rhs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("RHs");
__PACKAGE__->add_columns(
  "rhid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "rhname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "adress",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "internet",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "tel",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "fax",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "notes",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
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
__PACKAGE__->set_primary_key("rhid");
__PACKAGE__->has_many(
  "mediaobjects",
  "BES::Schema::Mediaobjects",
  { "foreign.rhid" => "self.rhid" },
);
__PACKAGE__->has_many(
  "rhftps",
  "BES::Schema::Rhftps",
  { "foreign.rhid" => "self.rhid" },
);
__PACKAGE__->has_many(
  "rhoffers",
  "BES::Schema::Rhoffers",
  { "foreign.rhid" => "self.rhid" },
);
__PACKAGE__->has_many(
  "rhprofiles",
  "BES::Schema::Rhprofiles",
  { "foreign.rhid" => "self.rhid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nquhlWrX/ayRCIR9sSZY1Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
