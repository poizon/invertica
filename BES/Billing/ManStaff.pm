package BES::Billing::ManStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("man_staff");
__PACKAGE__->add_columns(
  "person_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ug_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rw_flag",
  { data_type => "INT", default_value => 0, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("person_id", "ug_id");
__PACKAGE__->belongs_to(
  "person_id",
  "BES::Billing::Managers",
  { person_id => "person_id" },
);
__PACKAGE__->belongs_to("ug_id", "BES::Billing::Usergroups", { group_id => "ug_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:D91LJ+Klxpdkd25RMf0nyw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/ManStaff.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::ManStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("man_staff");
__PACKAGE__->add_columns(
  "person_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ug_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rw_flag",
  { data_type => "INT", default_value => 0, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("person_id", "ug_id");
__PACKAGE__->belongs_to(
  "person_id",
  "BES::Billing::Managers",
  { person_id => "person_id" },
);
__PACKAGE__->belongs_to("ug_id", "BES::Billing::Usergroups", { group_id => "ug_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P8JKs4VohViop5XtQ7jy8w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/ManStaff.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
