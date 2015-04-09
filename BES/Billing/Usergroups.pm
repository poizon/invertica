package BES::Billing::Usergroups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("usergroups");
__PACKAGE__->add_columns(
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 128 },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "promise_allow",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "promise_max",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "promise_min",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "promise_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "promise_till",
  { data_type => "INT", default_value => 30, is_nullable => 0, size => 3 },
  "promise_limit",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
);
__PACKAGE__->set_primary_key("group_id");
__PACKAGE__->has_many(
  "man_staffs",
  "BES::Billing::ManStaff",
  { "foreign.ug_id" => "self.group_id" },
);
__PACKAGE__->has_many(
  "usergroups_staffs",
  "BES::Billing::UsergroupsStaff",
  { "foreign.group_id" => "self.group_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jmxisKl6MAfSOfyiTpBmcQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Usergroups.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Usergroups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("usergroups");
__PACKAGE__->add_columns(
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 128 },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "promise_allow",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "promise_max",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "promise_min",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "promise_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "promise_till",
  { data_type => "INT", default_value => 30, is_nullable => 0, size => 3 },
  "promise_limit",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
);
__PACKAGE__->set_primary_key("group_id");
__PACKAGE__->has_many(
  "man_staffs",
  "BES::Billing::ManStaff",
  { "foreign.ug_id" => "self.group_id" },
);
__PACKAGE__->has_many(
  "usergroups_staffs",
  "BES::Billing::UsergroupsStaff",
  { "foreign.group_id" => "self.group_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BUD/D4+5R4xHj0sGk4KUow


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Usergroups.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
