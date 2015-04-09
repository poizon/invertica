package BES::Billing::AvdeskSubscribers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("avdesk_subscribers");
__PACKAGE__->add_columns(
  "av_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "serv_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "avdesk_id",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "avdesk_pass",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "avdesk_url",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "prolong",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "expire",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
);
__PACKAGE__->set_primary_key("av_id");
__PACKAGE__->belongs_to(
  "usbox_service",
  "BES::Billing::UsboxServices",
  { serv_id => "serv_id", vg_id => "vg_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DAbDrmwx+RF1RLuZheCeGA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/AvdeskSubscribers.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::AvdeskSubscribers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("avdesk_subscribers");
__PACKAGE__->add_columns(
  "av_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "serv_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "avdesk_id",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "avdesk_pass",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "avdesk_url",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 255 },
  "prolong",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "expire",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
);
__PACKAGE__->set_primary_key("av_id");
__PACKAGE__->belongs_to(
  "usbox_service",
  "BES::Billing::UsboxServices",
  { serv_id => "serv_id", vg_id => "vg_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NPEBMUmPAP+yp7FGKZu+mw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/AvdeskSubscribers.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
