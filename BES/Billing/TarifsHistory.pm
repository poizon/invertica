package BES::Billing::TarifsHistory;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_history");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id_old",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id_new",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "c_date_new",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "rasp_time",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "changed",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "request_by",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "tar_id_old",
  "BES::Billing::Tarifs",
  { tar_id => "tar_id_old" },
);
__PACKAGE__->belongs_to(
  "tar_id_new",
  "BES::Billing::Tarifs",
  { tar_id => "tar_id_new" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VKq6GUb1wyFeoOFAZcIGTw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TarifsHistory.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TarifsHistory;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_history");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "tar_id_old",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id_new",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "c_date_new",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "rasp_time",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "changed",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "request_by",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "tar_id_old",
  "BES::Billing::Tarifs",
  { tar_id => "tar_id_old" },
);
__PACKAGE__->belongs_to(
  "tar_id_new",
  "BES::Billing::Tarifs",
  { tar_id => "tar_id_new" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:531BUUSqEVHCeBnaZe2DtQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TarifsHistory.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
