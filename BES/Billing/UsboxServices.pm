package BES::Billing::UsboxServices;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("usbox_services");
__PACKAGE__->add_columns(
  "serv_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mul",
  { data_type => "DOUBLE", default_value => 1, is_nullable => 0, size => 64 },
  "person_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "comment",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "created",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "timeto",
  {
    data_type => "DATETIME",
    default_value => "9999-12-31 23:59:59",
    is_nullable => 0,
    size => 19,
  },
  "need_calc",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("serv_id");
__PACKAGE__->has_many(
  "avdesk_subscribers",
  "BES::Billing::AvdeskSubscribers",
  {
    "foreign.serv_id" => "self.serv_id",
    "foreign.vg_id"   => "self.vg_id",
  },
);
__PACKAGE__->has_many(
  "usbox_charges",
  "BES::Billing::UsboxCharge",
  { "foreign.serv_id" => "self.serv_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "category",
  "BES::Billing::Categories",
  { cat_idx => "cat_idx", tar_id => "tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:j8nOHyIKKb+pg0KBWaX+fw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/UsboxServices.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::UsboxServices;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("usbox_services");
__PACKAGE__->add_columns(
  "serv_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mul",
  { data_type => "DOUBLE", default_value => 1, is_nullable => 0, size => 64 },
  "person_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "comment",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "created",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "timeto",
  {
    data_type => "DATETIME",
    default_value => "9999-12-31 23:59:59",
    is_nullable => 0,
    size => 19,
  },
  "need_calc",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("serv_id");
__PACKAGE__->has_many(
  "avdesk_subscribers",
  "BES::Billing::AvdeskSubscribers",
  {
    "foreign.serv_id" => "self.serv_id",
    "foreign.vg_id"   => "self.vg_id",
  },
);
__PACKAGE__->has_many(
  "usbox_charges",
  "BES::Billing::UsboxCharge",
  { "foreign.serv_id" => "self.serv_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "category",
  "BES::Billing::Categories",
  { cat_idx => "cat_idx", tar_id => "tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lzvHpqcEyRGeAptiIQT5zA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/UsboxServices.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
