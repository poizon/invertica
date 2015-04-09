package BES::Billing::Devices;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("devices");
__PACKAGE__->add_columns(
  "device_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "device_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "tpl",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "prototype_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "country_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 3 },
  "area_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "region_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "city_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "settle_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "street_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "building_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "flat_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "address",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("device_id");
__PACKAGE__->has_many(
  "device_groups_members",
  "BES::Billing::DeviceGroupsMembers",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->has_many(
  "device_statuses",
  "BES::Billing::DeviceStatus",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->has_many(
  "device_trees",
  "BES::Billing::DeviceTree",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->belongs_to(
  "prototype_id",
  "BES::Billing::Devices",
  { device_id => "prototype_id" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.prototype_id" => "self.device_id" },
);
__PACKAGE__->belongs_to(
  "area_id",
  "BES::Billing::AddressArea",
  { record_id => "area_id" },
);
__PACKAGE__->belongs_to(
  "country_id",
  "BES::Billing::AddressCountry",
  { record_id => "country_id" },
);
__PACKAGE__->belongs_to(
  "city_id",
  "BES::Billing::AddressCity",
  { record_id => "city_id" },
);
__PACKAGE__->belongs_to(
  "street_id",
  "BES::Billing::AddressStreet",
  { record_id => "street_id" },
);
__PACKAGE__->belongs_to(
  "building_id",
  "BES::Billing::AddressBuilding",
  { record_id => "building_id" },
);
__PACKAGE__->belongs_to(
  "flat_id",
  "BES::Billing::AddressFlat",
  { record_id => "flat_id" },
);
__PACKAGE__->belongs_to(
  "region_id",
  "BES::Billing::AddressRegion",
  { record_id => "region_id" },
);
__PACKAGE__->belongs_to(
  "settle_id",
  "BES::Billing::AddressSettl",
  { record_id => "settle_id" },
);
__PACKAGE__->has_many(
  "devices_options",
  "BES::Billing::DevicesOptions",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.device_id" => "self.device_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+5dNQQU0Am1Mb9w9HjsTHw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Devices.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Devices;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("devices");
__PACKAGE__->add_columns(
  "device_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "device_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "tpl",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "prototype_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "country_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 3 },
  "area_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "region_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "city_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "settle_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "street_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "building_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "flat_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "address",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("device_id");
__PACKAGE__->has_many(
  "device_groups_members",
  "BES::Billing::DeviceGroupsMembers",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->has_many(
  "device_statuses",
  "BES::Billing::DeviceStatus",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->has_many(
  "device_trees",
  "BES::Billing::DeviceTree",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->belongs_to(
  "prototype_id",
  "BES::Billing::Devices",
  { device_id => "prototype_id" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.prototype_id" => "self.device_id" },
);
__PACKAGE__->belongs_to(
  "area_id",
  "BES::Billing::AddressArea",
  { record_id => "area_id" },
);
__PACKAGE__->belongs_to(
  "country_id",
  "BES::Billing::AddressCountry",
  { record_id => "country_id" },
);
__PACKAGE__->belongs_to(
  "city_id",
  "BES::Billing::AddressCity",
  { record_id => "city_id" },
);
__PACKAGE__->belongs_to(
  "street_id",
  "BES::Billing::AddressStreet",
  { record_id => "street_id" },
);
__PACKAGE__->belongs_to(
  "building_id",
  "BES::Billing::AddressBuilding",
  { record_id => "building_id" },
);
__PACKAGE__->belongs_to(
  "flat_id",
  "BES::Billing::AddressFlat",
  { record_id => "flat_id" },
);
__PACKAGE__->belongs_to(
  "region_id",
  "BES::Billing::AddressRegion",
  { record_id => "region_id" },
);
__PACKAGE__->belongs_to(
  "settle_id",
  "BES::Billing::AddressSettl",
  { record_id => "settle_id" },
);
__PACKAGE__->has_many(
  "devices_options",
  "BES::Billing::DevicesOptions",
  { "foreign.device_id" => "self.device_id" },
);
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.device_id" => "self.device_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IuLIvcFhDLUD0YjEv32w8g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Devices.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
