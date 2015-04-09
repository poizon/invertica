package BES::Billing::AdminSessions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("admin_sessions");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ip_address",
  { data_type => "CHAR", default_value => "", is_nullable => 0, size => 50 },
  "man_login",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "man_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "session_key",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "location",
  {
    data_type => "VARCHAR",
    default_value => "index",
    is_nullable => 1,
    size => 64,
  },
  "log_in_time",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 14,
  },
  "session_expire",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:brTjJJjFaIP8jfsLtT2zyg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AdminSessions.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AdminSessions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("admin_sessions");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ip_address",
  { data_type => "CHAR", default_value => "", is_nullable => 0, size => 50 },
  "man_login",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "man_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "session_key",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "location",
  {
    data_type => "VARCHAR",
    default_value => "index",
    is_nullable => 1,
    size => 64,
  },
  "log_in_time",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 14,
  },
  "session_expire",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9/StoUHWApj3YHvdhWZz1g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AdminSessions.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
