package BES::Billing::Orders;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("orders");
__PACKAGE__->add_columns(
  "order_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "doc_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "period",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "order_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "order_num",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "creation_date",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "re_summ",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "curr_summ",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tax_summ",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "pay_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
);
__PACKAGE__->set_primary_key("order_id");
__PACKAGE__->add_unique_constraint("document", ["period", "agrm_id", "oper_id", "doc_id"]);
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sH0/2ev444g939vG5nOlpA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Orders.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Orders;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("orders");
__PACKAGE__->add_columns(
  "order_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "doc_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "period",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "order_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "order_num",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "creation_date",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "re_summ",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "curr_summ",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tax_summ",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "pay_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
);
__PACKAGE__->set_primary_key("order_id");
__PACKAGE__->add_unique_constraint("document", ["period", "agrm_id", "oper_id", "doc_id"]);
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DfiFTXJuja0pyPIdEvEkKA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Orders.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
