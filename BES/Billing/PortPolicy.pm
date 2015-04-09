package BES::Billing::PortPolicy;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("port_policy");
__PACKAGE__->add_columns(
  "policy_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "script",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("policy_id");
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.policy_id" => "self.policy_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aEdyTgYpDjJwOORde4s7aw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/PortPolicy.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::PortPolicy;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("port_policy");
__PACKAGE__->add_columns(
  "policy_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 64 },
  "desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "script",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("policy_id");
__PACKAGE__->has_many(
  "ports",
  "BES::Billing::Ports",
  { "foreign.policy_id" => "self.policy_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:njE4aHHkdSF0CSYBwZekXA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/PortPolicy.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
