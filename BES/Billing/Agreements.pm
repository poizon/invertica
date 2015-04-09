package BES::Billing::Agreements;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("agreements");
__PACKAGE__->add_columns(
  "agrm_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "number",
  { data_type => "VARCHAR", default_value => "-", is_nullable => 0, size => 64 },
  "date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "balance",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "credit",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "cur_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "code",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 40,
  },
  "b_limit",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "b_notify",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "b_check",
  { data_type => "DATE", default_value => undef, is_nullable => 1, size => 10 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("agrm_id");
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });
__PACKAGE__->has_many(
  "balances",
  "BES::Billing::Balances",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "orders",
  "BES::Billing::Orders",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "pay_cards",
  "BES::Billing::PayCards",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "payments",
  "BES::Billing::Payments",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "promise_payments",
  "BES::Billing::PromisePayments",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "rentcharges",
  "BES::Billing::Rentcharge",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.agrm_id" => "self.agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4mbqiKRfG3qz5ehF9qJB1g
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Agreements.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Agreements;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("agreements");
__PACKAGE__->add_columns(
  "agrm_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "number",
  { data_type => "VARCHAR", default_value => "-", is_nullable => 0, size => 64 },
  "date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "balance",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "credit",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "cur_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "code",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 40,
  },
  "b_limit",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "b_notify",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "b_check",
  { data_type => "DATE", default_value => undef, is_nullable => 1, size => 10 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("agrm_id");
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });
__PACKAGE__->belongs_to("uid", "BES::Billing::Accounts", { uid => "uid" });
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });
__PACKAGE__->has_many(
  "balances",
  "BES::Billing::Balances",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "orders",
  "BES::Billing::Orders",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "pay_cards",
  "BES::Billing::PayCards",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "payments",
  "BES::Billing::Payments",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "promise_payments",
  "BES::Billing::PromisePayments",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "rentcharges",
  "BES::Billing::Rentcharge",
  { "foreign.agrm_id" => "self.agrm_id" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.agrm_id" => "self.agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qp3TYerW0XHpY4Y66k9nlA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Agreements.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
