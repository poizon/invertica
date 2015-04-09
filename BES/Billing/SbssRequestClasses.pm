package BES::Billing::SbssRequestClasses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_request_classes");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "color",
  {
    data_type => "VARCHAR",
    default_value => "000000",
    is_nullable => 1,
    size => 6,
  },
  "responsible_man",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cV0XJhqbITVEoBEV+Gvgpw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssRequestClasses.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssRequestClasses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_request_classes");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "descr",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "color",
  {
    data_type => "VARCHAR",
    default_value => "000000",
    is_nullable => 1,
    size => 6,
  },
  "responsible_man",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SiTlbUwstFCMSqY/cR3/yA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssRequestClasses.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
