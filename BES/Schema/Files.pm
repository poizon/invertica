package BES::Schema::Files;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Files");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "mediaobjectid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "rhprofileid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "filename",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 256,
  },
  "filetype",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "filesize",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 50 },
  "filestatus",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 1 },
  "logmsg",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "filevideoformat",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "filevideocontainer",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "filevideobitrate",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "filevideoresolution",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 265,
  },
  "filevideohd",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 1 },
  "fileaudiochannels",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "fileaudioformat",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "fileaudiobitrate",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
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
  "ftpid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "fullpath",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "ismain",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "mediaobjectid",
  "BES::Schema::Mediaobjects",
  { id => "mediaobjectid" },
);
__PACKAGE__->belongs_to("ftpid", "BES::Schema::Rhftps", { id => "ftpid" });
__PACKAGE__->belongs_to(
  "rhprofileid",
  "BES::Schema::Rhprofiles",
  { id => "rhprofileid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n8284doGCU3rKi5ZGztmMA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
