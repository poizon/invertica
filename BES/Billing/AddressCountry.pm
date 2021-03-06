package BES::Billing::AddressCountry;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_country");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 3 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "address_regions",
  "BES::Billing::AddressRegion",
  { "foreign.country" => "self.record_id" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.country_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RwxxtfyGd8E/ZVzMz+ENuA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AddressCountry.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AddressCountry;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_country");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 3 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "address_regions",
  "BES::Billing::AddressRegion",
  { "foreign.country" => "self.record_id" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.country_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6hsMzSnUJnM+t9Cf7OoxBw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AddressCountry.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
