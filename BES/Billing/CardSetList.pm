package BES::Billing::CardSetList;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("card_set_list");
__PACKAGE__->add_columns(
  "set_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_tpl",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "common",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->belongs_to("set_id", "BES::Billing::CardSet", { set_id => "set_id" });
__PACKAGE__->belongs_to("vg_tpl", "BES::Billing::Vgroups", { vg_id => "vg_tpl" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uTs/wu3edJU4d7B5L3/4YA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/CardSetList.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::CardSetList;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("card_set_list");
__PACKAGE__->add_columns(
  "set_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_tpl",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "common",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->belongs_to("set_id", "BES::Billing::CardSet", { set_id => "set_id" });
__PACKAGE__->belongs_to("vg_tpl", "BES::Billing::Vgroups", { vg_id => "vg_tpl" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:caprJ41oWP8rRkYI+yFPEg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/CardSetList.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
