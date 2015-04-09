package BES::Billing::TelClasses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tel_classes");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "extern_code",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "color",
  { data_type => "INT", default_value => 16777215, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "tel_cats",
  "BES::Billing::TelCat",
  { "foreign.class" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lsLaH+3pRUx9c38E/02b6Q
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TelClasses.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TelClasses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tel_classes");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "extern_code",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "color",
  { data_type => "INT", default_value => 16777215, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "tel_cats",
  "BES::Billing::TelCat",
  { "foreign.class" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yeX9A4X4YRRbdXLDyHdDYA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TelClasses.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
