package BES::Billing::AsCatIdx;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("as_cat_idx");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "zone_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("zone_id", "tar_id");
__PACKAGE__->belongs_to("zone_id", "BES::Billing::AsCat", { zone_id => "zone_id" });
__PACKAGE__->belongs_to(
  "category",
  "BES::Billing::Categories",
  { cat_idx => "cat_idx", tar_id => "tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4pWl0lH8ZetwMnvAeTcVdQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AsCatIdx.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AsCatIdx;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("as_cat_idx");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "zone_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("zone_id", "tar_id");
__PACKAGE__->belongs_to("zone_id", "BES::Billing::AsCat", { zone_id => "zone_id" });
__PACKAGE__->belongs_to(
  "category",
  "BES::Billing::Categories",
  { cat_idx => "cat_idx", tar_id => "tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xVr90o0B172XZI9z4mW9cA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AsCatIdx.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
