package BES::Billing::UserReportsFiles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user_reports_files");
__PACKAGE__->add_columns(
  "file_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "report_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "filename",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 50 },
  "is_main",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("file_id");
__PACKAGE__->belongs_to(
  "report_id",
  "BES::Billing::UserReports",
  { report_id => "report_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vpYtPE/AN18vLV8pSP0NVA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/UserReportsFiles.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::UserReportsFiles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user_reports_files");
__PACKAGE__->add_columns(
  "file_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "report_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "filename",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 50 },
  "is_main",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("file_id");
__PACKAGE__->belongs_to(
  "report_id",
  "BES::Billing::UserReports",
  { report_id => "report_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l9WYGS0Rxq7cU8A4fRKaWQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/UserReportsFiles.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
