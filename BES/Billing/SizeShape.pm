package BES::Billing::SizeShape;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("size_shape");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "shape_rate",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("amount", ["amount", "tar_id"]);
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O1w2xc9hVSKYv4EsiRe/9A
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SizeShape.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SizeShape;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("size_shape");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "shape_rate",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 10 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("amount", ["amount", "tar_id"]);
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zJXqHUH2Z7HHONboFBqWCw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SizeShape.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
