package BES::Billing::SbssPostsFiles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_posts_files");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "ticket_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "post_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "author_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "author_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "edited_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "edited_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "edited_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "original_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "description",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "ticket_id",
  "BES::Billing::SbssTickets",
  { id => "ticket_id" },
);
__PACKAGE__->belongs_to("post_id", "BES::Billing::SbssPosts", { id => "post_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vHmIFWmGfASs2OOmxyGVuw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssPostsFiles.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssPostsFiles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_posts_files");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "ticket_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "post_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "author_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "author_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "edited_on",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "edited_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "edited_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "size",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "original_name",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "description",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "ticket_id",
  "BES::Billing::SbssTickets",
  { id => "ticket_id" },
);
__PACKAGE__->belongs_to("post_id", "BES::Billing::SbssPosts", { id => "post_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9QkSgIHP+9Vlt2sFG5W7JQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssPostsFiles.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
