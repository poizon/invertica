package BES::Billing::Staff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("staff");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "segment",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "segment_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "mac_staffs",
  "BES::Billing::MacStaff",
  { "foreign.record_id" => "self.record_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "segment_id",
  "BES::Billing::Segments",
  { record_id => "segment_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dzGRk6nn1Lf5+zwXIHv9KA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Staff.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Staff;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("staff");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "segment",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "segment_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "mac_staffs",
  "BES::Billing::MacStaff",
  { "foreign.record_id" => "self.record_id" },
);
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to(
  "segment_id",
  "BES::Billing::Segments",
  { record_id => "segment_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xawjXs+bMgC41NrEa2uOZA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Staff.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
