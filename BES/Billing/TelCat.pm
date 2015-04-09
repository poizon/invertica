package BES::Billing::TelCat;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tel_cat");
__PACKAGE__->add_columns(
  "zone_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "zone_num",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "cat_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "class",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "descr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("zone_id");
__PACKAGE__->belongs_to("cat_id", "BES::Billing::Catalog", { cat_id => "cat_id" });
__PACKAGE__->belongs_to("class", "BES::Billing::TelClasses", { id => "class" });
__PACKAGE__->has_many(
  "tel_cat_idxes",
  "BES::Billing::TelCatIdx",
  { "foreign.zone_id" => "self.zone_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:26ZvvTKjxrX9DHouu2azcw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TelCat.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TelCat;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tel_cat");
__PACKAGE__->add_columns(
  "zone_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "zone_num",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "cat_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "class",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "descr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("zone_id");
__PACKAGE__->belongs_to("cat_id", "BES::Billing::Catalog", { cat_id => "cat_id" });
__PACKAGE__->belongs_to("class", "BES::Billing::TelClasses", { id => "class" });
__PACKAGE__->has_many(
  "tel_cat_idxes",
  "BES::Billing::TelCatIdx",
  { "foreign.zone_id" => "self.zone_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IgybVX5wTFyHwSDuTiQbng


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TelCat.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
