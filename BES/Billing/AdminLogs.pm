package BES::Billing::AdminLogs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("admin_logs");
__PACKAGE__->add_columns(
  "act",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "man_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "man_login",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "time",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "ip_address",
  { data_type => "CHAR", default_value => "", is_nullable => 1, size => 50 },
  "ext_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "ext_type",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HcwYM/E6kmKSC6NNRROwtA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AdminLogs.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AdminLogs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("admin_logs");
__PACKAGE__->add_columns(
  "act",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "man_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "man_login",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "time",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "ip_address",
  { data_type => "CHAR", default_value => "", is_nullable => 1, size => 50 },
  "ext_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "ext_type",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bUnxWaXnkNd0IprJ7bdTdw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AdminLogs.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
