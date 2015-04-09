package BES::Billing::SbssTickets;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_tickets");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "CHAR", default_value => "", is_nullable => 1, size => 255 },
  "author_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "author_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "respondent_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "respondent_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "lastpost",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "responsible_man",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "class_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "replies",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "status_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "manager_lock",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "vgid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "sbss_posts",
  "BES::Billing::SbssPosts",
  { "foreign.ticket_id" => "self.id" },
);
__PACKAGE__->has_many(
  "sbss_posts_files",
  "BES::Billing::SbssPostsFiles",
  { "foreign.ticket_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qwj9SP2pacpd00UAKqyvNg
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssTickets.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssTickets;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_tickets");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  { data_type => "CHAR", default_value => "", is_nullable => 1, size => 255 },
  "author_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "author_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "created_on",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "respondent_type",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 4 },
  "respondent_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "lastpost",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "responsible_man",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "class_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "replies",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "status_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "manager_lock",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "vgid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "sbss_posts",
  "BES::Billing::SbssPosts",
  { "foreign.ticket_id" => "self.id" },
);
__PACKAGE__->has_many(
  "sbss_posts_files",
  "BES::Billing::SbssPostsFiles",
  { "foreign.ticket_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u8y7Euu+lRtVFiR6dJfm6w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssTickets.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
