package BES::Billing::PayCards;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("pay_cards");
__PACKAGE__->add_columns(
  "ser_no",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "card_key",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "sum",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "date_create",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "act_til",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "activated",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "used",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "agrm_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "mod_pers",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "card_set",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("ser_no");
__PACKAGE__->add_unique_constraint("card_key", ["card_key"]);
__PACKAGE__->belongs_to("card_set", "BES::Billing::CardSet", { set_id => "card_set" });
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7pu3BCjPsKXp6Q9flAu+cg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/PayCards.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::PayCards;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("pay_cards");
__PACKAGE__->add_columns(
  "ser_no",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "card_key",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "sum",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "date_create",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "act_til",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "activated",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "used",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "agrm_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "mod_pers",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "card_set",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("ser_no");
__PACKAGE__->add_unique_constraint("card_key", ["card_key"]);
__PACKAGE__->belongs_to("card_set", "BES::Billing::CardSet", { set_id => "card_set" });
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cKc+FxsjOsJ1imchvpGAZQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/PayCards.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
