package BES::Billing::Catalog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("catalog");
__PACKAGE__->add_columns(
  "cat_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "cat_name",
  { data_type => "CHAR", default_value => "", is_nullable => 0, size => 64 },
  "cat_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("cat_id");
__PACKAGE__->has_many(
  "as_cats",
  "BES::Billing::AsCat",
  { "foreign.cat_id" => "self.cat_id" },
);
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });
__PACKAGE__->has_many(
  "ip_cats",
  "BES::Billing::IpCat",
  { "foreign.cat_id" => "self.cat_id" },
);
__PACKAGE__->has_many(
  "tarifs_cats",
  "BES::Billing::TarifsCat",
  { "foreign.cat_id" => "self.cat_id" },
);
__PACKAGE__->has_many(
  "tel_cats",
  "BES::Billing::TelCat",
  { "foreign.cat_id" => "self.cat_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PV4hVAhEscHVeo4NRVzmxQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Catalog.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Catalog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("catalog");
__PACKAGE__->add_columns(
  "cat_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "cat_name",
  { data_type => "CHAR", default_value => "", is_nullable => 0, size => 64 },
  "cat_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("cat_id");
__PACKAGE__->has_many(
  "as_cats",
  "BES::Billing::AsCat",
  { "foreign.cat_id" => "self.cat_id" },
);
__PACKAGE__->belongs_to("oper_id", "BES::Billing::Accounts", { uid => "oper_id" });
__PACKAGE__->has_many(
  "ip_cats",
  "BES::Billing::IpCat",
  { "foreign.cat_id" => "self.cat_id" },
);
__PACKAGE__->has_many(
  "tarifs_cats",
  "BES::Billing::TarifsCat",
  { "foreign.cat_id" => "self.cat_id" },
);
__PACKAGE__->has_many(
  "tel_cats",
  "BES::Billing::TelCat",
  { "foreign.cat_id" => "self.cat_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A2/aBensdJ+ipjdG8UQKxw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Catalog.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
