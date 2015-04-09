package BES::Billing::CardSet;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("card_set");
__PACKAGE__->add_columns(
  "set_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "set_descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "created_by",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cur_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "acc_tpl",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "expire_period",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("set_id");
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });
__PACKAGE__->belongs_to("acc_tpl", "BES::Billing::Accounts", { uid => "acc_tpl" });
__PACKAGE__->has_many(
  "card_set_lists",
  "BES::Billing::CardSetList",
  { "foreign.set_id" => "self.set_id" },
);
__PACKAGE__->has_many(
  "pay_cards",
  "BES::Billing::PayCards",
  { "foreign.card_set" => "self.set_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kfhW7HGMVKScteNS1kDqmQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/CardSet.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::CardSet;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("card_set");
__PACKAGE__->add_columns(
  "set_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "set_descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "created_by",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cur_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "acc_tpl",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "expire_period",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("set_id");
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });
__PACKAGE__->belongs_to("acc_tpl", "BES::Billing::Accounts", { uid => "acc_tpl" });
__PACKAGE__->has_many(
  "card_set_lists",
  "BES::Billing::CardSetList",
  { "foreign.set_id" => "self.set_id" },
);
__PACKAGE__->has_many(
  "pay_cards",
  "BES::Billing::PayCards",
  { "foreign.card_set" => "self.set_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BOWncRVWFa4+WjxooOlD0Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/CardSet.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
