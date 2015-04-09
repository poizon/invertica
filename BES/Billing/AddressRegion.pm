package BES::Billing::AddressRegion;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_region");
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
  "short",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "country",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 3 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "address_areas",
  "BES::Billing::AddressArea",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_buildings",
  "BES::Billing::AddressBuilding",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_cities",
  "BES::Billing::AddressCity",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_flats",
  "BES::Billing::AddressFlat",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->belongs_to("short", "BES::Billing::AddressMeaning", { short => "short" });
__PACKAGE__->belongs_to(
  "country",
  "BES::Billing::AddressCountry",
  { record_id => "country" },
);
__PACKAGE__->has_many(
  "address_settls",
  "BES::Billing::AddressSettl",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_streets",
  "BES::Billing::AddressStreet",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.region_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IjsxdxBzdXDP2AYDP+9aRg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AddressRegion.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AddressRegion;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_region");
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
  "short",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "country",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 3 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->has_many(
  "address_areas",
  "BES::Billing::AddressArea",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_buildings",
  "BES::Billing::AddressBuilding",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_cities",
  "BES::Billing::AddressCity",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_flats",
  "BES::Billing::AddressFlat",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->belongs_to("short", "BES::Billing::AddressMeaning", { short => "short" });
__PACKAGE__->belongs_to(
  "country",
  "BES::Billing::AddressCountry",
  { record_id => "country" },
);
__PACKAGE__->has_many(
  "address_settls",
  "BES::Billing::AddressSettl",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "address_streets",
  "BES::Billing::AddressStreet",
  { "foreign.region" => "self.record_id" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.region_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YeGTKRrgsLiiHnB0oXmN4w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AddressRegion.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
