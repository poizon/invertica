package BES::Billing::DeviceTree;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("device_tree");
__PACKAGE__->add_columns(
  "device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "port_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "parent_device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "parent_port_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);
__PACKAGE__->belongs_to(
  "port_device_id_port_id",
  "BES::Billing::Ports",
  { device_id => "device_id", port_id => "port_id" },
);
__PACKAGE__->belongs_to(
  "port_parent_device_id_parent_port_id",
  "BES::Billing::Ports",
  { device_id => "parent_device_id", port_id => "parent_port_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/xrI/OpGBIZ27bSGGwGrbA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/DeviceTree.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::DeviceTree;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("device_tree");
__PACKAGE__->add_columns(
  "device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "port_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "parent_device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "parent_port_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);
__PACKAGE__->belongs_to(
  "port_device_id_port_id",
  "BES::Billing::Ports",
  { device_id => "device_id", port_id => "port_id" },
);
__PACKAGE__->belongs_to(
  "port_parent_device_id_parent_port_id",
  "BES::Billing::Ports",
  { device_id => "parent_device_id", port_id => "parent_port_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qiccpm7Wol7RYT40TkeAqA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/DeviceTree.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
