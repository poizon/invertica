package BES::Billing::Weekends;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("weekends");
__PACKAGE__->add_columns(
  "date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "we_flag",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "mod_person",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("date");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:j91RrG4q70waPQSilwVoRA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Weekends.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Weekends;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("weekends");
__PACKAGE__->add_columns(
  "date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "we_flag",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "mod_person",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("date");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Mv1u9iLMxuL8qhfl404OVg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Weekends.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
