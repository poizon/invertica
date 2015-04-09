package BES::Billing::Trusted;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("trusted");
__PACKAGE__->add_columns(
  "trusted_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "trusted_mask",
  {
    data_type => "INT",
    default_value => 4294967295,
    is_nullable => 0,
    size => 10,
  },
  "trusted_ip",
  {
    data_type => "INT",
    default_value => 2130706433,
    is_nullable => 0,
    size => 10,
  },
  "trusted_descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("trusted_id");
__PACKAGE__->add_unique_constraint("trusted_ip", ["trusted_ip", "trusted_mask"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DS9XZSS1id+h6sLvQjg/UA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Trusted.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Trusted;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("trusted");
__PACKAGE__->add_columns(
  "trusted_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "trusted_mask",
  {
    data_type => "INT",
    default_value => 4294967295,
    is_nullable => 0,
    size => 10,
  },
  "trusted_ip",
  {
    data_type => "INT",
    default_value => 2130706433,
    is_nullable => 0,
    size => 10,
  },
  "trusted_descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("trusted_id");
__PACKAGE__->add_unique_constraint("trusted_ip", ["trusted_ip", "trusted_mask"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bArgDhIzmSQ2Y52N0PTIZQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Trusted.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
