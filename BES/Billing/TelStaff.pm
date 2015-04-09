package BES::Billing::TelStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tel_staff");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "phone_number",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "comment",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "device",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "ldservice",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "route_weights",
  "BES::Billing::RouteWeights",
  { "foreign.route_id" => "self.record_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yG9Lj8TRTPzlwgLYsppp/Q
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TelStaff.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TelStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tel_staff");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "phone_number",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "comment",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "device",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "ldservice",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "route_weights",
  "BES::Billing::RouteWeights",
  { "foreign.route_id" => "self.record_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ilPDiAt27QBpMlUJKtSZGQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TelStaff.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
