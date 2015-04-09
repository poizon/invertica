package BES::Billing::Settings;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("settings");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 3 },
  "flush",
  { data_type => "INT", default_value => 600, is_nullable => 0, size => 11 },
  "timer",
  { data_type => "INT", default_value => 30, is_nullable => 0, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "service_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "na_ip",
  {
    data_type => "VARCHAR",
    default_value => "127.0.0.1",
    is_nullable => 0,
    size => 16,
  },
  "na_db",
  {
    data_type => "VARCHAR",
    default_value => "billing",
    is_nullable => 0,
    size => 32,
  },
  "na_username",
  {
    data_type => "VARCHAR",
    default_value => "billing",
    is_nullable => 0,
    size => 64,
  },
  "na_pass",
  {
    data_type => "VARCHAR",
    default_value => "billing",
    is_nullable => 0,
    size => 64,
  },
  "nfhost",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "nfport",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "local_as_num",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "use_rtime",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "day",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "raccport",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rauthport",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "remulate_on_naid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "raddrpool",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "save_stat_addr",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "eapcertpassword",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "rad_stop_expired",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "max_radius_timeout",
  { data_type => "INT", default_value => 86400, is_nullable => 0, size => 11 },
  "session_lifetime",
  { data_type => "INT", default_value => 86400, is_nullable => 0, size => 11 },
  "ignorelocal",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "multiply",
  { data_type => "INT", default_value => 1024, is_nullable => 0, size => 11 },
  "lastcontact",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "adm_notify",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "pbx_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tel_src",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "com_speed",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "com_parity",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "com_data_bits",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "com_stop_bits",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "tel_raw_copy",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "tel_direction_mode",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "failed_calls",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "voip_card_user",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 128 },
  "recalc_stat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "recalc_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "recalc_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "recalc_group",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "recalc_current",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "oper_cat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "keepdetail",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "device_groups",
  "BES::Billing::DeviceGroups",
  { "foreign.agent_id" => "self.id" },
);
__PACKAGE__->has_many(
  "ignorenets",
  "BES::Billing::Ignorenets",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "interfaces",
  "BES::Billing::Interfaces",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "phone_replaces",
  "BES::Billing::PhoneReplaces",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many("rnas", "BES::Billing::Rnas", { "foreign.id" => "self.id" });
__PACKAGE__->has_many(
  "segments",
  "BES::Billing::Segments",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->belongs_to("pbx_id", "BES::Billing::Pabxes", { pbx_id => "pbx_id" });
__PACKAGE__->has_many(
  "tarifs_rasps",
  "BES::Billing::TarifsRasp",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "tarifs_staffs",
  "BES::Billing::TarifsStaff",
  { "foreign.group_module_id" => "self.id" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aJDbTKgMBia5CcC7n8Bj5A
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Settings.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Settings;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("settings");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 3 },
  "flush",
  { data_type => "INT", default_value => 600, is_nullable => 0, size => 11 },
  "timer",
  { data_type => "INT", default_value => 30, is_nullable => 0, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "service_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "na_ip",
  {
    data_type => "VARCHAR",
    default_value => "127.0.0.1",
    is_nullable => 0,
    size => 16,
  },
  "na_db",
  {
    data_type => "VARCHAR",
    default_value => "billing",
    is_nullable => 0,
    size => 32,
  },
  "na_username",
  {
    data_type => "VARCHAR",
    default_value => "billing",
    is_nullable => 0,
    size => 64,
  },
  "na_pass",
  {
    data_type => "VARCHAR",
    default_value => "billing",
    is_nullable => 0,
    size => 64,
  },
  "nfhost",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "nfport",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "local_as_num",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "use_rtime",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "day",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "raccport",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rauthport",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "remulate_on_naid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "raddrpool",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "save_stat_addr",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "eapcertpassword",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "rad_stop_expired",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "max_radius_timeout",
  { data_type => "INT", default_value => 86400, is_nullable => 0, size => 11 },
  "session_lifetime",
  { data_type => "INT", default_value => 86400, is_nullable => 0, size => 11 },
  "ignorelocal",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "multiply",
  { data_type => "INT", default_value => 1024, is_nullable => 0, size => 11 },
  "lastcontact",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "adm_notify",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "pbx_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tel_src",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "com_speed",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "com_parity",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "com_data_bits",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "com_stop_bits",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "tel_raw_copy",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "tel_direction_mode",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "failed_calls",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "voip_card_user",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 128 },
  "recalc_stat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "recalc_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "recalc_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "recalc_group",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "recalc_current",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "oper_cat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "keepdetail",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "device_groups",
  "BES::Billing::DeviceGroups",
  { "foreign.agent_id" => "self.id" },
);
__PACKAGE__->has_many(
  "ignorenets",
  "BES::Billing::Ignorenets",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "interfaces",
  "BES::Billing::Interfaces",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "phone_replaces",
  "BES::Billing::PhoneReplaces",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many("rnas", "BES::Billing::Rnas", { "foreign.id" => "self.id" });
__PACKAGE__->has_many(
  "segments",
  "BES::Billing::Segments",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->belongs_to("pbx_id", "BES::Billing::Pabxes", { pbx_id => "pbx_id" });
__PACKAGE__->has_many(
  "tarifs_rasps",
  "BES::Billing::TarifsRasp",
  { "foreign.id" => "self.id" },
);
__PACKAGE__->has_many(
  "tarifs_staffs",
  "BES::Billing::TarifsStaff",
  { "foreign.group_module_id" => "self.id" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+Pjv7zLZhE2h+Vs+1kRyNA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Settings.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
