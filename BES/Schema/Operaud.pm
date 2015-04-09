package BES::Schema::Operaud;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("OperAud");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "operid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "custterminal",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "drm",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "networksid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "age_18_25",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "age_26_35",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "age_36_50",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "age_50_",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "sex_m",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "sex_f",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "revenue_",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to("operid", "BES::Schema::Operators", { operid => "operid" });
__PACKAGE__->belongs_to(
  "networksid",
  "BES::Schema::Networks",
  { resourceid => "networksid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0PhGUibVPeVZm+C7joiFqA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
