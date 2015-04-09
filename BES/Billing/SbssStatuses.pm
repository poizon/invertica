package BES::Billing::SbssStatuses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_statuses");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 4 },
  "type",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 1 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "color",
  {
    data_type => "VARCHAR",
    default_value => "000000",
    is_nullable => 0,
    size => 6,
  },
  "active",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
  "display_default",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "client_modify_allow",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
  "default_new",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
  "default_answer",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K11zkBFZJuxadG1QJGkW5A
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssStatuses.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssStatuses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_statuses");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 4 },
  "type",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 1 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "color",
  {
    data_type => "VARCHAR",
    default_value => "000000",
    is_nullable => 0,
    size => 6,
  },
  "active",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
  "display_default",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "client_modify_allow",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
  "default_new",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
  "default_answer",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7z8wGrH+//66QGVU/74UwA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssStatuses.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
