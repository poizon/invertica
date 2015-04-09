package BES::Billing::Radnnnyyyymmdd;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("radNNNYYYYmmdd");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cin",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cout",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "timeto",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "session_id",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 36 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "ani",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "dnis",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "nas",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->add_unique_constraint("session_id", ["session_id", "nas"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VrgbpHrJIXIoIj6e1SoN0A
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Radnnnyyyymmdd.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Radnnnyyyymmdd;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("radNNNYYYYmmdd");
__PACKAGE__->add_columns(
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cin",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cout",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "timefrom",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "timeto",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "session_id",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 36 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "ani",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "dnis",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "nas",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->add_unique_constraint("session_id", ["session_id", "nas"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qnElo9dSREpB08vSix+x+A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Radnnnyyyymmdd.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
