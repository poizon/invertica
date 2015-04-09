package BES::Billing::Day;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("day");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "timefrom",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "cin",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cout",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8fDZ/WaheFyQIVuQxz/Sig
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Day.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Day;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("day");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "timefrom",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "cin",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "cout",
  { data_type => "BIGINT", default_value => 0, is_nullable => 0, size => 20 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J8uAK6j7yBkoc9ZvjTBDGQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Day.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
