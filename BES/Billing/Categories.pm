package BES::Billing::Categories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("categories");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uuid",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 40 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "above",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "includes",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "common",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "dis_prior",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "free_seconds",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "round_seconds",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "perm_above",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "min_charge_dur",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("tar_id", "cat_idx");
__PACKAGE__->add_unique_constraint("tar_guid", ["uuid", "tar_id"]);
__PACKAGE__->has_many(
  "as_cat_idxes",
  "BES::Billing::AsCatIdx",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });
__PACKAGE__->has_many(
  "cerber_masks",
  "BES::Billing::CerberMask",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "ip_cat_idxes",
  "BES::Billing::IpCatIdx",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "route_weights",
  "BES::Billing::RouteWeights",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "size_discounts",
  "BES::Billing::SizeDiscounts",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "tel_cat_idxes",
  "BES::Billing::TelCatIdx",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "time_discounts",
  "BES::Billing::TimeDiscounts",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "usbox_services",
  "BES::Billing::UsboxServices",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:S1rOGKGH+yku0g+XrzJNIA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Categories.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Categories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("categories");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uuid",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 40 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "above",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "includes",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "common",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "dis_prior",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "free_seconds",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "round_seconds",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "perm_above",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "min_charge_dur",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("tar_id", "cat_idx");
__PACKAGE__->add_unique_constraint("tar_guid", ["uuid", "tar_id"]);
__PACKAGE__->has_many(
  "as_cat_idxes",
  "BES::Billing::AsCatIdx",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });
__PACKAGE__->has_many(
  "cerber_masks",
  "BES::Billing::CerberMask",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "ip_cat_idxes",
  "BES::Billing::IpCatIdx",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "route_weights",
  "BES::Billing::RouteWeights",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "size_discounts",
  "BES::Billing::SizeDiscounts",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "tel_cat_idxes",
  "BES::Billing::TelCatIdx",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "time_discounts",
  "BES::Billing::TimeDiscounts",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);
__PACKAGE__->has_many(
  "usbox_services",
  "BES::Billing::UsboxServices",
  {
    "foreign.cat_idx" => "self.cat_idx",
    "foreign.tar_id"  => "self.tar_id",
  },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p0UIC3wnsy/x89fHg7+YHQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Categories.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
