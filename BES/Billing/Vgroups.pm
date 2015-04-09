package BES::Billing::Vgroups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("vgroups");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "cu_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "login",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "pass",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "agrm_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "blk_req",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "blocked",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "changed",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "shape",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "d_limit",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "d_clear",
  { data_type => "DATE", default_value => undef, is_nullable => 1, size => 10 },
  "max_sessions",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "current_shape",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "ip_det",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "port_det",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "acc_ondate",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "acc_offdate",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "block_date",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "creation_date",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "template",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("vg_id");
__PACKAGE__->add_unique_constraint("cu_id", ["cu_id", "id"]);
__PACKAGE__->add_unique_constraint("login", ["login", "id"]);
__PACKAGE__->has_many(
  "card_set_lists",
  "BES::Billing::CardSetList",
  { "foreign.vg_tpl" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "climits",
  "BES::Billing::Climits",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "gr_staffs",
  "BES::Billing::GrStaff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "mac_staffs",
  "BES::Billing::MacStaff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "radblacklogs",
  "BES::Billing::Radblacklog",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "rentcharges",
  "BES::Billing::Rentcharge",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "staffs",
  "BES::Billing::Staff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "tarifs_histories",
  "BES::Billing::TarifsHistory",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasps",
  "BES::Billing::TarifsRasp",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "tel_staffs",
  "BES::Billing::TelStaff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "usbox_services",
  "BES::Billing::UsboxServices",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "vg_blocks",
  "BES::Billing::VgBlocks",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AJ9GpExblR7Y1oAZVmzt7A
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Vgroups.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Vgroups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("vgroups");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "cu_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "login",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "pass",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "agrm_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "blk_req",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "blocked",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "changed",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "shape",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "d_limit",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "d_clear",
  { data_type => "DATE", default_value => undef, is_nullable => 1, size => 10 },
  "max_sessions",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "current_shape",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "ip_det",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "port_det",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "acc_ondate",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "acc_offdate",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "block_date",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "creation_date",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "template",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("vg_id");
__PACKAGE__->add_unique_constraint("cu_id", ["cu_id", "id"]);
__PACKAGE__->add_unique_constraint("login", ["login", "id"]);
__PACKAGE__->has_many(
  "card_set_lists",
  "BES::Billing::CardSetList",
  { "foreign.vg_tpl" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "climits",
  "BES::Billing::Climits",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "gr_staffs",
  "BES::Billing::GrStaff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "mac_staffs",
  "BES::Billing::MacStaff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "radblacklogs",
  "BES::Billing::Radblacklog",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "rentcharges",
  "BES::Billing::Rentcharge",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "staffs",
  "BES::Billing::Staff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "tarifs_histories",
  "BES::Billing::TarifsHistory",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasps",
  "BES::Billing::TarifsRasp",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "tel_staffs",
  "BES::Billing::TelStaff",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "usbox_services",
  "BES::Billing::UsboxServices",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->has_many(
  "vg_blocks",
  "BES::Billing::VgBlocks",
  { "foreign.vg_id" => "self.vg_id" },
);
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:B8mE7k/QNb+8KTn+5+i0wg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Vgroups.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
