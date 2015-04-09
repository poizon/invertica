package BES::Billing::Currency;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("currency");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "symbol",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 16 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 128 },
  "def",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("def", ["def"]);
__PACKAGE__->has_many(
  "agreements",
  "BES::Billing::Agreements",
  { "foreign.cur_id" => "self.id" },
);
__PACKAGE__->has_many(
  "card_sets",
  "BES::Billing::CardSet",
  { "foreign.cur_id" => "self.id" },
);
__PACKAGE__->has_many(
  "rates",
  "BES::Billing::Rate",
  { "foreign.cur_id" => "self.id" },
);
__PACKAGE__->has_many(
  "tarifs",
  "BES::Billing::Tarifs",
  { "foreign.cur_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:axseuDSlPLqTAswNqxnOYw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Currency.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Currency;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("currency");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "symbol",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 16 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 128 },
  "def",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("def", ["def"]);
__PACKAGE__->has_many(
  "agreements",
  "BES::Billing::Agreements",
  { "foreign.cur_id" => "self.id" },
);
__PACKAGE__->has_many(
  "card_sets",
  "BES::Billing::CardSet",
  { "foreign.cur_id" => "self.id" },
);
__PACKAGE__->has_many(
  "rates",
  "BES::Billing::Rate",
  { "foreign.cur_id" => "self.id" },
);
__PACKAGE__->has_many(
  "tarifs",
  "BES::Billing::Tarifs",
  { "foreign.cur_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fAtgDULLSlVZoUxfsJTISA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Currency.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
