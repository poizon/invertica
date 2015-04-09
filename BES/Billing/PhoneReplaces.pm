package BES::Billing::PhoneReplaces;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phone_replaces");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "old_number",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "new_number",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "l_trim",
  { data_type => "INT", default_value => -1, is_nullable => 0, size => 11 },
  "replace_what",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kKypiYwwpdZU4MyT0X/nKg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/PhoneReplaces.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::PhoneReplaces;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phone_replaces");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "old_number",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "new_number",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "l_trim",
  { data_type => "INT", default_value => -1, is_nullable => 0, size => 11 },
  "replace_what",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wtGhUHF+5WPjcKwnUAEH5w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/PhoneReplaces.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
