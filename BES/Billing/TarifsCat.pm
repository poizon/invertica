package BES::Billing::TarifsCat;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_cat");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("tar_id", "cat_id");
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to("cat_id", "BES::Billing::Catalog", { cat_id => "cat_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rom7CFy1DWUya0T51ZR7Lw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TarifsCat.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TarifsCat;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_cat");
__PACKAGE__->add_columns(
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "cat_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("tar_id", "cat_id");
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to("cat_id", "BES::Billing::Catalog", { cat_id => "cat_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XgXPlvPpW1Pbx19qIfGGlQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TarifsCat.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
