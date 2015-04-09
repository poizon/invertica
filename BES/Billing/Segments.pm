package BES::Billing::Segments;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("segments");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "segment",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "nas_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "guest",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "ignorelocal",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "nat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint("segment", ["segment", "mask", "id"]);
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->has_many(
  "staffs",
  "BES::Billing::Staff",
  { "foreign.segment_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6uAgzdu0JJn9Mf9Yd7JdUA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Segments.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Segments;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("segments");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "segment",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "nas_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "guest",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "ignorelocal",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "nat",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint("segment", ["segment", "mask", "id"]);
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->has_many(
  "staffs",
  "BES::Billing::Staff",
  { "foreign.segment_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WSPMoQ/LiRO4LbIJqvdimA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Segments.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
