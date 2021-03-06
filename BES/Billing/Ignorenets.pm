package BES::Billing::Ignorenets;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ignorenets");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "segment",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e+obYAnwYpcwIVES7rr8ZA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Ignorenets.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Ignorenets;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ignorenets");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "segment",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
  "mask",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8sDVUVOd5ZOaPFXH6vfIbA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Ignorenets.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
