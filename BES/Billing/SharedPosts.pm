package BES::Billing::SharedPosts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("shared_posts");
__PACKAGE__->add_columns(
  "pid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "posttime",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "text",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "postby",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("pid");
__PACKAGE__->belongs_to("postby", "BES::Billing::Managers", { person_id => "postby" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LqGec5J05GJytrKfu9Pv2g
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SharedPosts.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SharedPosts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("shared_posts");
__PACKAGE__->add_columns(
  "pid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "posttime",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "text",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "postby",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("pid");
__PACKAGE__->belongs_to("postby", "BES::Billing::Managers", { person_id => "postby" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:g8pRYdq2UM0MsMLDtxR0RA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SharedPosts.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
