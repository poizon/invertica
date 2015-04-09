package BES::Billing::RadiusAttrs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("radius_attrs");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "description",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "nas_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "shape",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "radius_code",
  { data_type => "TINYINT", default_value => 2, is_nullable => 0, size => 4 },
  "attr_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->belongs_to(
  "rna",
  "BES::Billing::Rnas",
  { id => "id", nas_id => "nas_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to(
  "attr_id",
  "BES::Billing::Dictionary",
  { record_id => "attr_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7p9JCRNZm8VZy7WCRvD8wg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/RadiusAttrs.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::RadiusAttrs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("radius_attrs");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "description",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "nas_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "shape",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "radius_code",
  { data_type => "TINYINT", default_value => 2, is_nullable => 0, size => 4 },
  "attr_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->belongs_to(
  "rna",
  "BES::Billing::Rnas",
  { id => "id", nas_id => "nas_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to(
  "attr_id",
  "BES::Billing::Dictionary",
  { record_id => "attr_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6Ymn4nP1kWJKeIs2yn6URw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/RadiusAttrs.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
