package BES::Billing::Sessionsradius;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sessionsradius");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "assigned_ip",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
  "session_id",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 36 },
  "start_time",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "sess_ani",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "sess_dnis",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "stop_req",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "authmoment",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "nas",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "direction",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 4 },
  "updatetime",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "shape",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->add_unique_constraint("session", ["session_id", "nas"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RIR34tULCKDxYnaxiscijA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Sessionsradius.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Sessionsradius;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sessionsradius");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "assigned_ip",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 10 },
  "session_id",
  { data_type => "CHAR", default_value => undef, is_nullable => 1, size => 36 },
  "start_time",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "sess_ani",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "sess_dnis",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "stop_req",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "authmoment",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "nas",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "direction",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 4 },
  "updatetime",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "shape",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->add_unique_constraint("session", ["session_id", "nas"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NlUC58DnHsO/9wKdFYJr/w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Sessionsradius.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
