package BES::Billing::AccountsAddonsStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addons_staff");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 16,
  },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "idx",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("idx");
__PACKAGE__->belongs_to("name", "BES::Billing::AccountsAddonsSet", { name => "name" });
__PACKAGE__->has_many(
  "accounts_addons_vals",
  "BES::Billing::AccountsAddonsVals",
  { "foreign.value" => "self.idx" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uXumWlBILx/C78qeua3oCg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddonsStaff.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AccountsAddonsStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addons_staff");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 16,
  },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "idx",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("idx");
__PACKAGE__->belongs_to("name", "BES::Billing::AccountsAddonsSet", { name => "name" });
__PACKAGE__->has_many(
  "accounts_addons_vals",
  "BES::Billing::AccountsAddonsVals",
  { "foreign.value" => "self.idx" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c5FD8CSbCR5x4Be3rPUEJw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddonsStaff.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
