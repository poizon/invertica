package BES::Billing::DeviceGroupsMembers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("device_groups_members");
__PACKAGE__->add_columns(
  "device_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);
__PACKAGE__->belongs_to(
  "group_id",
  "BES::Billing::DeviceGroups",
  { group_id => "group_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p1G1nbYbvKzj/v/7Dct4Gw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/DeviceGroupsMembers.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::DeviceGroupsMembers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("device_groups_members");
__PACKAGE__->add_columns(
  "device_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);
__PACKAGE__->belongs_to(
  "group_id",
  "BES::Billing::DeviceGroups",
  { group_id => "group_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HhdD0DjRTCQwT7oz0yVpbA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/DeviceGroupsMembers.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
