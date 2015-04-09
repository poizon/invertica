package BES::Schema::Usertags;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("UserTags");
__PACKAGE__->add_columns(
  "tagid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "tagname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "userid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
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
__PACKAGE__->set_primary_key("tagid");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DDexe+oOwAo/I6qlyoKbug


# You can replace this text with custom content, and it will be preserved on regeneration
1;
