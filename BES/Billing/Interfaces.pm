package BES::Billing::Interfaces;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("interfaces");
__PACKAGE__->add_columns(
  "devid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "devname",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("devid");
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rm6TUc1cx5QL5yYbd8nIFw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Interfaces.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Interfaces;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("interfaces");
__PACKAGE__->add_columns(
  "devid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "devname",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "archive",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("devid");
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+XO/bxeym1G3mDe0J5Rrow


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Interfaces.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
