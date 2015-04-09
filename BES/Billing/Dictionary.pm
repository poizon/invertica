package BES::Billing::Dictionary;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("dictionary");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "nas_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "radius_type",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "vendor",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "value_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "replace_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint("repl", ["replace_id", "nas_id"]);
__PACKAGE__->add_unique_constraint("dict", ["nas_id", "name"]);
__PACKAGE__->belongs_to("nas_id", "BES::Billing::Rnas", { nas_id => "nas_id" });
__PACKAGE__->belongs_to(
  "replace_id",
  "BES::Billing::Dictionary",
  { record_id => "replace_id" },
);
__PACKAGE__->has_many(
  "dictionaries",
  "BES::Billing::Dictionary",
  { "foreign.replace_id" => "self.record_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.attr_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F1kGLVSYx3naYQPAj0C0mA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Dictionary.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Dictionary;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("dictionary");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "nas_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 32 },
  "radius_type",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "vendor",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "value_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "replace_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint("repl", ["replace_id", "nas_id"]);
__PACKAGE__->add_unique_constraint("dict", ["nas_id", "name"]);
__PACKAGE__->belongs_to("nas_id", "BES::Billing::Rnas", { nas_id => "nas_id" });
__PACKAGE__->belongs_to(
  "replace_id",
  "BES::Billing::Dictionary",
  { record_id => "replace_id" },
);
__PACKAGE__->has_many(
  "dictionaries",
  "BES::Billing::Dictionary",
  { "foreign.replace_id" => "self.record_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.attr_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:y90ttCMQHHI1i56YlYW9+Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Dictionary.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
