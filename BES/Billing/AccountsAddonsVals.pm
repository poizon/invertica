package BES::Billing::AccountsAddonsVals;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addons_vals");
__PACKAGE__->add_columns(
  "uid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 16,
  },
  "value",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
  "str_value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });
__PACKAGE__->belongs_to("name", "BES::Billing::AccountsAddonsSet", { name => "name" });
__PACKAGE__->belongs_to(
  "value",
  "BES::Billing::AccountsAddonsStaff",
  { idx => "value" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eNAv1ZuI8UlZWk5qqrpg0g
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddonsVals.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AccountsAddonsVals;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addons_vals");
__PACKAGE__->add_columns(
  "uid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 16,
  },
  "value",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
  "str_value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });
__PACKAGE__->belongs_to("name", "BES::Billing::AccountsAddonsSet", { name => "name" });
__PACKAGE__->belongs_to(
  "value",
  "BES::Billing::AccountsAddonsStaff",
  { idx => "value" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dIEAIVW0xIpeLprjnNNRbQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddonsVals.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
