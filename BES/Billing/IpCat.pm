package BES::Billing::IpCat;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ip_cat");
__PACKAGE__->add_columns(
  "zone_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "zone_ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "zone_mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "proto",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 3 },
  "port",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "cat_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "descr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("zone_id");
__PACKAGE__->belongs_to("cat_id", "BES::Billing::Catalog", { cat_id => "cat_id" });
__PACKAGE__->has_many(
  "ip_cat_idxes",
  "BES::Billing::IpCatIdx",
  { "foreign.zone_id" => "self.zone_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dS98V13k8GVxSRLDlI1JLQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/IpCat.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::IpCat;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ip_cat");
__PACKAGE__->add_columns(
  "zone_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "zone_ip",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "zone_mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "proto",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 3 },
  "port",
  { data_type => "SMALLINT", default_value => 0, is_nullable => 0, size => 5 },
  "cat_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "descr",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("zone_id");
__PACKAGE__->belongs_to("cat_id", "BES::Billing::Catalog", { cat_id => "cat_id" });
__PACKAGE__->has_many(
  "ip_cat_idxes",
  "BES::Billing::IpCatIdx",
  { "foreign.zone_id" => "self.zone_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5AdhctmQuhW892NWL0qYSQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/IpCat.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
