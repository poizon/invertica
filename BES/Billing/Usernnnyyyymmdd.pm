package BES::Billing::Usernnnyyyymmdd;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("userNNNYYYYmmdd");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "remote",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "cin",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cout",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "timeto",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "protnum",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 3 },
  "ipport",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "remport",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "asnum",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "asnum_remote",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "ifnum",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "ifnum_remote",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "traff_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "need_calc",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2mDLzBkRmUDx77lR6asaJg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Usernnnyyyymmdd.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Usernnnyyyymmdd;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("userNNNYYYYmmdd");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "remote",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "cin",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cout",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "timeto",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "protnum",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 3 },
  "ipport",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "remport",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "asnum",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "asnum_remote",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "ifnum",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "ifnum_remote",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "traff_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "need_calc",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HXTf8TW+CNYQCaMlcQ2y0A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Usernnnyyyymmdd.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
