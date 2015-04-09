package BES::Billing::Rnas;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rnas");
__PACKAGE__->add_columns(
  "nas_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rnas",
  {
    data_type => "INT",
    default_value => 2130706433,
    is_nullable => 1,
    size => 10,
  },
  "rsharedsec",
  {
    data_type => "VARCHAR",
    default_value => "secret",
    is_nullable => 1,
    size => 32,
  },
);
__PACKAGE__->set_primary_key("nas_id");
__PACKAGE__->has_many(
  "dictionaries",
  "BES::Billing::Dictionary",
  { "foreign.nas_id" => "self.nas_id" },
);
__PACKAGE__->has_many(
  "radblacklogs",
  "BES::Billing::Radblacklog",
  { "foreign.nas_id" => "self.nas_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.id" => "self.id", "foreign.nas_id" => "self.nas_id" },
);
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XfVrv3Nl3Zj08hSbmHPAcA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Rnas.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Rnas;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rnas");
__PACKAGE__->add_columns(
  "nas_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "rnas",
  {
    data_type => "INT",
    default_value => 2130706433,
    is_nullable => 1,
    size => 10,
  },
  "rsharedsec",
  {
    data_type => "VARCHAR",
    default_value => "secret",
    is_nullable => 1,
    size => 32,
  },
);
__PACKAGE__->set_primary_key("nas_id");
__PACKAGE__->has_many(
  "dictionaries",
  "BES::Billing::Dictionary",
  { "foreign.nas_id" => "self.nas_id" },
);
__PACKAGE__->has_many(
  "radblacklogs",
  "BES::Billing::Radblacklog",
  { "foreign.nas_id" => "self.nas_id" },
);
__PACKAGE__->has_many(
  "radius_attrs",
  "BES::Billing::RadiusAttrs",
  { "foreign.id" => "self.id", "foreign.nas_id" => "self.nas_id" },
);
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CrfMcw6/FC9aZwuzQezkpQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Rnas.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
