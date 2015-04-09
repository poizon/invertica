package BES::Schema::Userfilmcomments;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("UserFilmComments");
__PACKAGE__->add_columns(
  "commentid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "commentname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "userid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "filmname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
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
__PACKAGE__->set_primary_key("commentid");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Nfobi8RvEDu68A3jDmfJGw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
