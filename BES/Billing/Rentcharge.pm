package BES::Billing::Rentcharge;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rentcharge");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "period",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "dateofcharge",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "block",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mul",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
);
__PACKAGE__->add_unique_constraint("period", ["period", "vg_id"]);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2iKdzOJR1spSY20GQNMYHg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Rentcharge.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Rentcharge;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rentcharge");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "period",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "dateofcharge",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "block",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mul",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
);
__PACKAGE__->add_unique_constraint("period", ["period", "vg_id"]);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GY9DCV49F4fSnXE5s7ucew


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Rentcharge.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
