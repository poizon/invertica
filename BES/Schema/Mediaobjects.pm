package BES::Schema::Mediaobjects;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("MediaObjects");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "rhid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 256,
  },
  "nameoriginal",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 256,
  },
  "author",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 256,
  },
  "duration",
  { data_type => "TIME", default_value => undef, is_nullable => 0, size => 8 },
  "views",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "creationdate",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 256,
  },
  "countryid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "originallangid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "genres",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "actors",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "tags",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 254,
  },
  "serial_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "photo_url",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 256,
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
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "files",
  "BES::Schema::Files",
  { "foreign.mediaobjectid" => "self.id" },
);
__PACKAGE__->has_many(
  "genreties",
  "BES::Schema::Genreties",
  { "foreign.movieid" => "self.id" },
);
__PACKAGE__->belongs_to("rhid", "BES::Schema::Rhs", { rhid => "rhid" });
__PACKAGE__->belongs_to("countryid", "BES::Schema::Countries", { id => "countryid" });
__PACKAGE__->belongs_to(
  "originallangid",
  "BES::Schema::Languages",
  { lang_id => "originallangid" },
);
__PACKAGE__->has_many(
  "userplaylistfilms",
  "BES::Schema::Userplaylistfilms",
  { "foreign.playlistfilmid" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:x1WEqsVgWxCCWy9ZjkaJDg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
