package BES::Schema::Purchases;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Purchases");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "tarid",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 128,
  },
  "movieid",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 128,
  },
  "agreement",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 10 },
  "catid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 255 },
  "datecreated",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->add_unique_constraint("ID", ["id"]);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VH5ziSZc19tAB/JYZUdLVQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
