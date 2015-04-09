package BES::Billing::TarifsStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_staff");
__PACKAGE__->add_columns(
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_module_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to(
  "group_tar_id",
  "BES::Billing::Tarifs",
  { tar_id => "group_tar_id" },
);
__PACKAGE__->belongs_to(
  "group_module_id",
  "BES::Billing::Settings",
  { id => "group_module_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CDTZELfouNJx64eLSbaIoA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TarifsStaff.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TarifsStaff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_staff");
__PACKAGE__->add_columns(
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_module_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to(
  "group_tar_id",
  "BES::Billing::Tarifs",
  { tar_id => "group_tar_id" },
);
__PACKAGE__->belongs_to(
  "group_module_id",
  "BES::Billing::Settings",
  { id => "group_module_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/jpcLFNqEEn7EDs2rk4bYg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TarifsStaff.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
