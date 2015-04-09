package BES::Billing::Managers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("managers");
__PACKAGE__->add_columns(
  "person_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
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
    size => 41,
  },
  "fio",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 240,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "descr",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "office",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "openpass",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "accounts",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "agents",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "broadcast",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "calendar",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "cards",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "cardsets",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "cashonhand",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "catalog",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "currency",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "hdsettings",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "helpdesk",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "inv_devices",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "ipstat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "logs",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "managers",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "operators",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "options",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "orders",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "payments",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "rad_attr",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "recount",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "reports",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "services",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "tarifs",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "timestat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "unions",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "usboxstat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "users",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "users_doc_allow",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "users_pre_orders",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "usergroups",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("person_id");
__PACKAGE__->add_unique_constraint("login", ["login", "pass"]);
__PACKAGE__->has_many(
  "crm_mails",
  "BES::Billing::CrmMail",
  { "foreign.orig_manager" => "self.person_id" },
);
__PACKAGE__->has_many(
  "man_staffs",
  "BES::Billing::ManStaff",
  { "foreign.person_id" => "self.person_id" },
);
__PACKAGE__->has_many(
  "sbss_crm_files",
  "BES::Billing::SbssCrmFiles",
  { "foreign.author_id" => "self.person_id" },
);
__PACKAGE__->has_many(
  "shared_posts",
  "BES::Billing::SharedPosts",
  { "foreign.postby" => "self.person_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasps",
  "BES::Billing::TarifsRasp",
  { "foreign.request_by" => "self.person_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HtwkH+6ij0+Jo1P7uUI9gA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Managers.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Managers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("managers");
__PACKAGE__->add_columns(
  "person_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
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
    size => 41,
  },
  "fio",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 240,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "descr",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "office",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "openpass",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "accounts",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "agents",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "broadcast",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "calendar",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "cards",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "cardsets",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "cashonhand",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "catalog",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "currency",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "hdsettings",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "helpdesk",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "inv_devices",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "ipstat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "logs",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "managers",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "operators",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "options",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "orders",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "payments",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "rad_attr",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "recount",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "reports",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "services",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "tarifs",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "timestat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "unions",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "usboxstat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "users",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "users_doc_allow",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "users_pre_orders",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "usergroups",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("person_id");
__PACKAGE__->add_unique_constraint("login", ["login", "pass"]);
__PACKAGE__->has_many(
  "crm_mails",
  "BES::Billing::CrmMail",
  { "foreign.orig_manager" => "self.person_id" },
);
__PACKAGE__->has_many(
  "man_staffs",
  "BES::Billing::ManStaff",
  { "foreign.person_id" => "self.person_id" },
);
__PACKAGE__->has_many(
  "sbss_crm_files",
  "BES::Billing::SbssCrmFiles",
  { "foreign.author_id" => "self.person_id" },
);
__PACKAGE__->has_many(
  "shared_posts",
  "BES::Billing::SharedPosts",
  { "foreign.postby" => "self.person_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasps",
  "BES::Billing::TarifsRasp",
  { "foreign.request_by" => "self.person_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VuoFcNy32aYNdULz3hzn4w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Managers.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
