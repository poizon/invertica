package BES::Billing::Tarifs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "cur_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "block_rent",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 3 },
  "act_block",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "shape",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "used",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "unavaliable",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "price_plan",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "traff_type",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 3 },
  "traff_limit",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "traff_limit_per",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "daily_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "dynamic_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "shape_prior",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "rent_multiply",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "charge_incoming",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "dyn_route",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "voip_block_local",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("tar_id");
__PACKAGE__->has_many(
  "categories",
  "BES::Billing::Categories",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "radblacklogs",
  "BES::Billing::Radblacklog",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "rentcharges",
  "BES::Billing::Rentcharge",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "size_shapes",
  "BES::Billing::SizeShape",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });
__PACKAGE__->has_many(
  "tarifs_cats",
  "BES::Billing::TarifsCat",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_history_tar_id_olds",
  "BES::Billing::TarifsHistory",
  { "foreign.tar_id_old" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_history_tar_id_news",
  "BES::Billing::TarifsHistory",
  { "foreign.tar_id_new" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasp_tar_ids",
  "BES::Billing::TarifsRasp",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasp_tar_id_news",
  "BES::Billing::TarifsRasp",
  { "foreign.tar_id_new" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_staffs",
  "BES::Billing::TarifsStaff",
  { "foreign.group_tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "time_shapes",
  "BES::Billing::TimeShape",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.tar_id" => "self.tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+LLxlLS1oSjES1YfA4oy7w
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Tarifs.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Tarifs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "cur_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "block_rent",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 3 },
  "act_block",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "shape",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "used",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "unavaliable",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "price_plan",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "traff_type",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 3 },
  "traff_limit",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "traff_limit_per",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "daily_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "dynamic_rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "shape_prior",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "rent_multiply",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "charge_incoming",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "dyn_route",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "voip_block_local",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("tar_id");
__PACKAGE__->has_many(
  "categories",
  "BES::Billing::Categories",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "radblacklogs",
  "BES::Billing::Radblacklog",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "rentcharges",
  "BES::Billing::Rentcharge",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "size_shapes",
  "BES::Billing::SizeShape",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });
__PACKAGE__->has_many(
  "tarifs_cats",
  "BES::Billing::TarifsCat",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_history_tar_id_olds",
  "BES::Billing::TarifsHistory",
  { "foreign.tar_id_old" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_history_tar_id_news",
  "BES::Billing::TarifsHistory",
  { "foreign.tar_id_new" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasp_tar_ids",
  "BES::Billing::TarifsRasp",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_rasp_tar_id_news",
  "BES::Billing::TarifsRasp",
  { "foreign.tar_id_new" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "tarifs_staffs",
  "BES::Billing::TarifsStaff",
  { "foreign.group_tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "time_shapes",
  "BES::Billing::TimeShape",
  { "foreign.tar_id" => "self.tar_id" },
);
__PACKAGE__->has_many(
  "vgroups",
  "BES::Billing::Vgroups",
  { "foreign.tar_id" => "self.tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vnJcYfUvhuOKZ6WBpNcskw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Tarifs.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
