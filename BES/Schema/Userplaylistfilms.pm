package BES::Schema::Userplaylistfilms;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("UserPlayListFilms");
__PACKAGE__->add_columns(
  "playlistfilmid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "playlistid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "playlistfilmname",
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
__PACKAGE__->set_primary_key("playlistfilmid");
__PACKAGE__->belongs_to(
  "playlistfilmid",
  "BES::Schema::Mediaobjects",
  { id => "playlistfilmid" },
);
__PACKAGE__->belongs_to(
  "playlistid",
  "BES::Schema::Userplaylists",
  { playlistid => "playlistid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wPIRrHKSRiio2fcuWJq05w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
