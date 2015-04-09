package BES::Billing::Radblacklog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("radblacklog");
__PACKAGE__->add_columns(
  "ani_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "nas_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ani",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "ani_descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "created",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "created_by",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("ani_id");
__PACKAGE__->belongs_to("nas_id", "BES::Billing::Rnas", { nas_id => "nas_id" });
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sDdfWwL5xSia9US/qwKFHQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Radblacklog.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Radblacklog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("radblacklog");
__PACKAGE__->add_columns(
  "ani_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "nas_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ani",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "ani_descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "created",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "created_by",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("ani_id");
__PACKAGE__->belongs_to("nas_id", "BES::Billing::Rnas", { nas_id => "nas_id" });
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:toXyr7DWizltEiM4in23SA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Radblacklog.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
