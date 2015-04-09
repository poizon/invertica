package BES::Billing::Balances;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("balances");
__PACKAGE__->add_columns(
  "date",
  { data_type => "DATE", default_value => undef, is_nullable => 0, size => 10 },
  "balance",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("agrm_id", "date");
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jql2zpdr80rQUynS4xly6Q
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Balances.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Balances;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("balances");
__PACKAGE__->add_columns(
  "date",
  { data_type => "DATE", default_value => undef, is_nullable => 0, size => 10 },
  "balance",
  { data_type => "DOUBLE", default_value => 0, is_nullable => 0, size => 64 },
  "agrm_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("agrm_id", "date");
__PACKAGE__->belongs_to(
  "agrm_id",
  "BES::Billing::Agreements",
  { agrm_id => "agrm_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZemRMNqCe+RnPujray0kDg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Balances.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
