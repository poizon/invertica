package BES::Billing::Ports;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ports");
__PACKAGE__->add_columns(
  "port_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "device_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tpl",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "prototype_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "speed",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "media",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "vlan",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "comment",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "policy_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("port_id");
__PACKAGE__->has_many(
  "device_statuses",
  "BES::Billing::DeviceStatus",
  {
    "foreign.device_id" => "self.device_id",
    "foreign.port_id"   => "self.port_id",
  },
);
__PACKAGE__->has_many(
  "device_tree_device_id_port_ids",
  "BES::Billing::DeviceTree",
  {
    "foreign.device_id" => "self.device_id",
    "foreign.port_id"   => "self.port_id",
  },
);
__PACKAGE__->has_many(
  "device_tree_parent_device_id_parent_port_ids",
  "BES::Billing::DeviceTree",
  {
    "foreign.parent_device_id" => "self.device_id",
    "foreign.parent_port_id"   => "self.port_id",
  },
);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "prototype_id",
  "BES::Billing::Ports",
  { port_id => "prototype_id" },
);
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.prototype_id" => "self.port_id" },
);
__PACKAGE__->belongs_to(
  "policy_id",
  "BES::Billing::PortPolicy",
  { policy_id => "policy_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6q9dXXeoaHaCPSJpFVh5yw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Ports.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Ports;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ports");
__PACKAGE__->add_columns(
  "port_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "device_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tpl",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "prototype_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "speed",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "media",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "vlan",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "comment",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "policy_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("port_id");
__PACKAGE__->has_many(
  "device_statuses",
  "BES::Billing::DeviceStatus",
  {
    "foreign.device_id" => "self.device_id",
    "foreign.port_id"   => "self.port_id",
  },
);
__PACKAGE__->has_many(
  "device_tree_device_id_port_ids",
  "BES::Billing::DeviceTree",
  {
    "foreign.device_id" => "self.device_id",
    "foreign.port_id"   => "self.port_id",
  },
);
__PACKAGE__->has_many(
  "device_tree_parent_device_id_parent_port_ids",
  "BES::Billing::DeviceTree",
  {
    "foreign.parent_device_id" => "self.device_id",
    "foreign.parent_port_id"   => "self.port_id",
  },
);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "prototype_id",
  "BES::Billing::Ports",
  { port_id => "prototype_id" },
);
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.prototype_id" => "self.port_id" },
);
__PACKAGE__->belongs_to(
  "policy_id",
  "BES::Billing::PortPolicy",
  { policy_id => "policy_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jEK1N9dZ7VriLvcZTv2YMw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Ports.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
