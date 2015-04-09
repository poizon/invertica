package BES::Billing::MacStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("mac_staff");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mac",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "record_id",
  "BES::Billing::Staff",
  { record_id => "record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum://JeBSZf0wdPDRiD8pnDyg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/MacStaff.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::MacStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("mac_staff");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mac",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "record_id",
  "BES::Billing::Staff",
  { record_id => "record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3iMy2NJxkobHvGxz13fu8w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/MacStaff.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
