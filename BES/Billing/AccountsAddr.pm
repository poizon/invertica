package BES::Billing::AccountsAddr;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addr");
__PACKAGE__->add_columns(
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "country",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 3 },
  "region",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "area",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "city",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "settl",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "street",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "building",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "flat",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "address",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("uid", "type");
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lNq2YYAgSiLqUWfEKPixHg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddr.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AccountsAddr;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts_addr");
__PACKAGE__->add_columns(
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "country",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 3 },
  "region",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "area",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "city",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "settl",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "street",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "building",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "flat",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "address",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("uid", "type");
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8ycf/ePMzINpW4IE8lPgbA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AccountsAddr.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
