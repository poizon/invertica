package BES::Billing::AccountsAddonsSet;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addons_set");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 16,
  },
  "descr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "type",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("name");
__PACKAGE__->has_many(
  "accounts_addons_staffs",
  "BES::Billing::AccountsAddonsStaff",
  { "foreign.name" => "self.name" },
);
__PACKAGE__->has_many(
  "accounts_addons_vals",
  "BES::Billing::AccountsAddonsVals",
  { "foreign.name" => "self.name" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5r6/h0dVauR7emE6IbD+pQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddonsSet.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AccountsAddonsSet;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addons_set");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 16,
  },
  "descr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "type",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("name");
__PACKAGE__->has_many(
  "accounts_addons_staffs",
  "BES::Billing::AccountsAddonsStaff",
  { "foreign.name" => "self.name" },
);
__PACKAGE__->has_many(
  "accounts_addons_vals",
  "BES::Billing::AccountsAddonsVals",
  { "foreign.name" => "self.name" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XR9zTaaT/kVo3o2mQOuUZA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddonsSet.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
