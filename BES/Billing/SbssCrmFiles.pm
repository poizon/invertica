package BES::Billing::SbssCrmFiles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_crm_files");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "client_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "author_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "edited_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "edited_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "original_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "size",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "description",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to("client_id", "BES::Billing::Accounts", { uid => "client_id" });
__PACKAGE__->belongs_to(
  "author_id",
  "BES::Billing::Managers",
  { person_id => "author_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Iqk7Mfn9n0hZTE38qj18Ug
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssCrmFiles.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssCrmFiles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_crm_files");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "client_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "author_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "edited_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "edited_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "original_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "size",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "description",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to("client_id", "BES::Billing::Accounts", { uid => "client_id" });
__PACKAGE__->belongs_to(
  "author_id",
  "BES::Billing::Managers",
  { person_id => "author_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p1T1P90mAPrDSDpFXYbGrQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssCrmFiles.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
