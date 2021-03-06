package BES::Billing::DeviceGroups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("device_groups");
__PACKAGE__->add_columns(
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "agent_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("group_id");
__PACKAGE__->belongs_to("agent_id", "BES::Billing::Settings", { id => "agent_id" });
__PACKAGE__->has_many(
  "device_groups_members",
  "BES::Billing::DeviceGroupsMembers",
  { "foreign.group_id" => "self.group_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xh7IvgYqqv0GQHvv1PUATg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/DeviceGroups.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::DeviceGroups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("device_groups");
__PACKAGE__->add_columns(
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "agent_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("group_id");
__PACKAGE__->belongs_to("agent_id", "BES::Billing::Settings", { id => "agent_id" });
__PACKAGE__->has_many(
  "device_groups_members",
  "BES::Billing::DeviceGroupsMembers",
  { "foreign.group_id" => "self.group_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m65S9AfWemWXpGM+19fk1g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/DeviceGroups.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
