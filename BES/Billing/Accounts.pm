package BES::Billing::Accounts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts");
__PACKAGE__->add_columns(
  "uid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "uuid",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 40 },
  "login",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "pass",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "ipaccess",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
  "type",
  { data_type => "TINYINT", default_value => 2, is_nullable => 1, size => 4 },
  "descr",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "phone",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "fax",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "bill_delivery",
  { data_type => "TINYINT", default_value => 1, is_nullable => 1, size => 4 },
  "category",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "bank_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "branch_bank_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "treasury_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "treasury_account",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "bik",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "settl",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "corr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "kpp",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "inn",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 40,
  },
  "ogrn",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "okpo",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "okved",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "gen_dir_u",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 100 },
  "gl_buhg_u",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "kont_person",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "act_on_what",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "pass_sernum",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 20,
  },
  "pass_no",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "pass_issuedate",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 20,
  },
  "pass_issuedep",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 200,
  },
  "pass_issueplace",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 240,
  },
  "birthdate",
  { data_type => "DATE", default_value => undef, is_nullable => 1, size => 10 },
  "birthplace",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 240,
  },
  "last_mod_date",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "wrong_active",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "wrong_date",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "oksm",
  { data_type => "INT", default_value => 643, is_nullable => 0, size => 11 },
  "okato",
  { data_type => "VARCHAR", default_value => 0, is_nullable => 0, size => 32 },
  "template",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("uid");
__PACKAGE__->add_unique_constraint("uuid", ["uuid"]);
__PACKAGE__->has_many(
  "accounts_addons_vals",
  "BES::Billing::AccountsAddonsVals",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "accounts_addrs",
  "BES::Billing::AccountsAddr",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "agreements_uids",
  "BES::Billing::Agreements",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "agreements_oper_ids",
  "BES::Billing::Agreements",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "card_sets",
  "BES::Billing::CardSet",
  { "foreign.acc_tpl" => "self.uid" },
);
__PACKAGE__->has_many(
  "catalogs",
  "BES::Billing::Catalog",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "categories",
  "BES::Billing::Categories",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "crm_mails",
  "BES::Billing::CrmMail",
  { "foreign.client_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "orders",
  "BES::Billing::Orders",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "sbss_crm_files",
  "BES::Billing::SbssCrmFiles",
  { "foreign.client_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "usergroups_staffs",
  "BES::Billing::UsergroupsStaff",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.uid" => "self.uid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8hfVJGsaHVlwnQA36wKrgg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Accounts.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Accounts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("accounts");
__PACKAGE__->add_columns(
  "uid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "uuid",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 40 },
  "login",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "pass",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "ipaccess",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
  "type",
  { data_type => "TINYINT", default_value => 2, is_nullable => 1, size => 4 },
  "descr",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "phone",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "fax",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "bill_delivery",
  { data_type => "TINYINT", default_value => 1, is_nullable => 1, size => 4 },
  "category",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "bank_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "branch_bank_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "treasury_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "treasury_account",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "bik",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "settl",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "corr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "kpp",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "inn",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 40,
  },
  "ogrn",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "okpo",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "okved",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "gen_dir_u",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 100 },
  "gl_buhg_u",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "kont_person",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "act_on_what",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "pass_sernum",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 20,
  },
  "pass_no",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 30,
  },
  "pass_issuedate",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 20,
  },
  "pass_issuedep",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 200,
  },
  "pass_issueplace",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 240,
  },
  "birthdate",
  { data_type => "DATE", default_value => undef, is_nullable => 1, size => 10 },
  "birthplace",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 240,
  },
  "last_mod_date",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "wrong_active",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "wrong_date",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "oksm",
  { data_type => "INT", default_value => 643, is_nullable => 0, size => 11 },
  "okato",
  { data_type => "VARCHAR", default_value => 0, is_nullable => 0, size => 32 },
  "template",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("uid");
__PACKAGE__->add_unique_constraint("uuid", ["uuid"]);
__PACKAGE__->has_many(
  "accounts_addons_vals",
  "BES::Billing::AccountsAddonsVals",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "accounts_addrs",
  "BES::Billing::AccountsAddr",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "agreements_uids",
  "BES::Billing::Agreements",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "agreements_oper_ids",
  "BES::Billing::Agreements",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "card_sets",
  "BES::Billing::CardSet",
  { "foreign.acc_tpl" => "self.uid" },
);
__PACKAGE__->has_many(
  "catalogs",
  "BES::Billing::Catalog",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "categories",
  "BES::Billing::Categories",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "crm_mails",
  "BES::Billing::CrmMail",
  { "foreign.client_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "orders",
  "BES::Billing::Orders",
  { "foreign.oper_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "sbss_crm_files",
  "BES::Billing::SbssCrmFiles",
  { "foreign.client_id" => "self.uid" },
);
__PACKAGE__->has_many(
  "usergroups_staffs",
  "BES::Billing::UsergroupsStaff",
  { "foreign.uid" => "self.uid" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.uid" => "self.uid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wmx0K01skTX8kRF5vdWncw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Accounts.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
