package BES::Billing::TimeDiscounts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("time_discounts");
__PACKAGE__->add_columns(
  "dis_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "timefrom",
  {
    data_type => "TIME",
    default_value => "00:00:00",
    is_nullable => 1,
    size => 8,
  },
  "timeto",
  {
    data_type => "TIME",
    default_value => "00:00:00",
    is_nullable => 1,
    size => 8,
  },
  "week",
  { data_type => "TINYINT", default_value => 127, is_nullable => 0, size => 3 },
  "use_weekend",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "discount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("dis_id");
__PACKAGE__->belongs_to(
  "category",
  "BES::Billing::Categories",
  { cat_idx => "cat_idx", tar_id => "tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wr95KUiLy9aqdBu6A/Mpdw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TimeDiscounts.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TimeDiscounts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("time_discounts");
__PACKAGE__->add_columns(
  "dis_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "timefrom",
  {
    data_type => "TIME",
    default_value => "00:00:00",
    is_nullable => 1,
    size => 8,
  },
  "timeto",
  {
    data_type => "TIME",
    default_value => "00:00:00",
    is_nullable => 1,
    size => 8,
  },
  "week",
  { data_type => "TINYINT", default_value => 127, is_nullable => 0, size => 3 },
  "use_weekend",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "discount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("dis_id");
__PACKAGE__->belongs_to(
  "category",
  "BES::Billing::Categories",
  { cat_idx => "cat_idx", tar_id => "tar_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:trozBy5P5WadOxci9VP3Ow


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TimeDiscounts.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
