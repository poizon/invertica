package BES::Billing::AddressCity;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_city");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "region",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "area",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
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
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("short", "BES::Billing::AddressMeaning", { short => "short" });
__PACKAGE__->belongs_to(
  "region",
  "BES::Billing::AddressRegion",
  { record_id => "region" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.city_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K+pqotuQlpAmnXgEpinVUQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AddressCity.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AddressCity;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("address_city");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "region",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "area",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
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
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("short", "BES::Billing::AddressMeaning", { short => "short" });
__PACKAGE__->belongs_to(
  "region",
  "BES::Billing::AddressRegion",
  { record_id => "region" },
);
__PACKAGE__->has_many(
  "devices",
  "BES::Billing::Devices",
  { "foreign.city_id" => "self.record_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+PmwuAdMOh883N8BPAG0OA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AddressCity.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
