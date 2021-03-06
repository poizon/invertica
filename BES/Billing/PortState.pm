package BES::Billing::PortState;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("port_state");
__PACKAGE__->add_columns(
  "state_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "icon",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
);
__PACKAGE__->set_primary_key("state_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kGB8aKcalkBpkGky+UyCyA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/PortState.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::PortState;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("port_state");
__PACKAGE__->add_columns(
  "state_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "icon",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
);
__PACKAGE__->set_primary_key("state_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NCLR0oiz+DUvLYcOxaF9sQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/PortState.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
