package BES::Schema::Rhftps;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("RHFTPs");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "rhid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "serveradr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "user",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "password",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "fname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "flag",
  { data_type => "BIT", default_value => "\0", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "files",
  "BES::Schema::Files",
  { "foreign.ftpid" => "self.id" },
);
__PACKAGE__->belongs_to("rhid", "BES::Schema::Rhs", { rhid => "rhid" });


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9pabe5BWe5FYfDXjKUqnUQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
