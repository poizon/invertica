package BES::Billing::Rate;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rate");
__PACKAGE__->add_columns(
  "date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "rate",
  { data_type => "DOUBLE", default_value => 1, is_nullable => 0, size => 64 },
  "cur_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mod_person",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("date", "cur_id");
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fqRIUa54ASIBxom2YXbLXg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Rate.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Rate;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("rate");
__PACKAGE__->add_columns(
  "date",
  {
    data_type => "DATE",
    default_value => "0000-00-00",
    is_nullable => 0,
    size => 10,
  },
  "rate",
  { data_type => "DOUBLE", default_value => 1, is_nullable => 0, size => 64 },
  "cur_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "mod_person",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("date", "cur_id");
__PACKAGE__->belongs_to("cur_id", "BES::Billing::Currency", { id => "cur_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1Qk21oBB9tz+r7JnNFPQnw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Rate.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
