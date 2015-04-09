package BES::Billing::Telnnnyyyymmdd;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("telNNNYYYYmmdd");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "parent_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "numfrom",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "numto",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "trunk_in",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "trunk_out",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "duration",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "direction",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "duration_round",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "zone_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "need_calc",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "session_id",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 36,
  },
  "original_numfrom",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "original_numto",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "original_direction",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 3 },
  "original_vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cin",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "cout",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "source",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "cause",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JOukL6hzdbWQgBdu+h5syA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Telnnnyyyymmdd.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Telnnnyyyymmdd;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("telNNNYYYYmmdd");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "parent_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "numfrom",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "numto",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "trunk_in",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "trunk_out",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "duration",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "direction",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "duration_round",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "zone_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "need_calc",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "session_id",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 36,
  },
  "original_numfrom",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "original_numto",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "original_direction",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 3 },
  "original_vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cin",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "cout",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "source",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "cause",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:03N2accaEXyDtVH6occWqg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Telnnnyyyymmdd.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
