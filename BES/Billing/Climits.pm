package BES::Billing::Climits;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("climits");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "c_limit_in",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "c_limit_out",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("vg_id", "cat_idx", "c_date");
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6k3Q6ZALKiVG/6v9CiWBmw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Climits.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Climits;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("climits");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "c_date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "c_limit_in",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "c_limit_out",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("vg_id", "cat_idx", "c_date");
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iiOnhRmAzFZIsnSzosWzuw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Climits.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
