package BES::Billing::DevicesOptions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("devices_options");
__PACKAGE__->add_columns(
  "option_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "value",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("option_id");
__PACKAGE__->add_unique_constraint("name", ["name", "device_id"]);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ud6MUu42Jf+UzsM1cxXxLg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/DevicesOptions.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::DevicesOptions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("devices_options");
__PACKAGE__->add_columns(
  "option_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "device_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "value",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("option_id");
__PACKAGE__->add_unique_constraint("name", ["name", "device_id"]);
__PACKAGE__->belongs_to(
  "device_id",
  "BES::Billing::Devices",
  { device_id => "device_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PqbUzDnj1/93ZvvZLbYFRQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/DevicesOptions.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
