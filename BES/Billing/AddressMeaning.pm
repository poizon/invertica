package BES::Billing::AddressMeaning;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_meaning");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "short",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 32,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "level_1",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_2",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_3",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_4",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_5",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_6",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_7",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint("short", ["short"]);
__PACKAGE__->has_many(
  "address_areas",
  "BES::Billing::AddressArea",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_buildings",
  "BES::Billing::AddressBuilding",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_cities",
  "BES::Billing::AddressCity",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_flats",
  "BES::Billing::AddressFlat",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_regions",
  "BES::Billing::AddressRegion",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_settls",
  "BES::Billing::AddressSettl",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_streets",
  "BES::Billing::AddressStreet",
  { "foreign.short" => "self.short" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BFubu/LWboAG7yf9XSJvvA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AddressMeaning.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AddressMeaning;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_meaning");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "short",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 32,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "level_1",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_2",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_3",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_4",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_5",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_6",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "level_7",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint("short", ["short"]);
__PACKAGE__->has_many(
  "address_areas",
  "BES::Billing::AddressArea",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_buildings",
  "BES::Billing::AddressBuilding",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_cities",
  "BES::Billing::AddressCity",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_flats",
  "BES::Billing::AddressFlat",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_regions",
  "BES::Billing::AddressRegion",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_settls",
  "BES::Billing::AddressSettl",
  { "foreign.short" => "self.short" },
);
__PACKAGE__->has_many(
  "address_streets",
  "BES::Billing::AddressStreet",
  { "foreign.short" => "self.short" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2sIe/aQkGgUyRRb0i+GS8Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AddressMeaning.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
