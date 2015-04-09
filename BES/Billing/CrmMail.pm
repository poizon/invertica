package BES::Billing::CrmMail;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("crm_mail");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "filename",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "filesize",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
  "msg_id",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "msg_from",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "msg_to",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "attachment",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 4 },
  "subject",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "msg_date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "orig_manager",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "client_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("mail", ["client_id", "filename"]);
__PACKAGE__->belongs_to("client_id", "BES::Billing::Accounts", { uid => "client_id" });
__PACKAGE__->belongs_to(
  "orig_manager",
  "BES::Billing::Managers",
  { person_id => "orig_manager" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1NhJVJSiSQ1NDmXvqspumw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/CrmMail.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::CrmMail;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("crm_mail");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "filename",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "filesize",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
  "msg_id",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "msg_from",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "msg_to",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "attachment",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 4 },
  "subject",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "msg_date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "orig_manager",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "client_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("mail", ["client_id", "filename"]);
__PACKAGE__->belongs_to("client_id", "BES::Billing::Accounts", { uid => "client_id" });
__PACKAGE__->belongs_to(
  "orig_manager",
  "BES::Billing::Managers",
  { person_id => "orig_manager" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ox0gAireNobQTxnSVRs1Lw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/CrmMail.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
