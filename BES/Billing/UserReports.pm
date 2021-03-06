package BES::Billing::UserReports;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user_reports");
__PACKAGE__->add_columns(
  "report_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "report_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 50 },
  "report_desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 250 },
  "report_act",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("report_id");
__PACKAGE__->has_many(
  "user_reports_files",
  "BES::Billing::UserReportsFiles",
  { "foreign.report_id" => "self.report_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LQxjKYeuvHAmW/jObbD4TA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/UserReports.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::UserReports;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user_reports");
__PACKAGE__->add_columns(
  "report_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "report_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 50 },
  "report_desc",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 250 },
  "report_act",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("report_id");
__PACKAGE__->has_many(
  "user_reports_files",
  "BES::Billing::UserReportsFiles",
  { "foreign.report_id" => "self.report_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WlwZW/jcwWvIzbdgChd1og


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/UserReports.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
