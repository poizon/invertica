package BES::Billing::Documents;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("documents");
__PACKAGE__->add_columns(
  "doc_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "cur_id",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "nds_above",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "template",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "save_path",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "usergroup_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "payable",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "client_allowed",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "upload_ext",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "hidden",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "onfly",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "detail",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("doc_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SnL5cA+Kq1aHSKoxYyP7UA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/Documents.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::Documents;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("documents");
__PACKAGE__->add_columns(
  "doc_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "cur_id",
  { data_type => "INT", default_value => 1, is_nullable => 0, size => 11 },
  "nds_above",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "template",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "save_path",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "usergroup_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "payable",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "client_allowed",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 4 },
  "upload_ext",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "hidden",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "onfly",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "detail",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("doc_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V/iTxlpmTSmPcp6CUP9vpQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/Documents.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
