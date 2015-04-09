package BES::Billing::Reportyyyymm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("reportYYYYmm");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "volume",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yhbpKw920XyQLdVsmvAPAg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Reportyyyymm.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Reportyyyymm;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("reportYYYYmm");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "uid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "oper_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_idx",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "time_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size_discount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rent",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "volume",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "amount",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kvUNt9E0yDOgzFfVeoHtWg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Reportyyyymm.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
