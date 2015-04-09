package BES::Billing::TarifsRasp;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_rasp");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "change_time",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "tar_id_new",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "request_by",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to(
  "request_by",
  "BES::Billing::Managers",
  { person_id => "request_by" },
);
__PACKAGE__->belongs_to(
  "tar_id_new",
  "BES::Billing::Tarifs",
  { tar_id => "tar_id_new" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UG6EnOvnUXoHNymFkFAdbw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/TarifsRasp.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::TarifsRasp;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tarifs_rasp");
__PACKAGE__->add_columns(
  "record_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "vg_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "group_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "tar_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "change_time",
  {
    data_type => "DATETIME",
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
    size => 19,
  },
  "tar_id_new",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "request_by",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->belongs_to("vg_id", "BES::Billing::Vgroups", { vg_id => "vg_id" });
__PACKAGE__->belongs_to("group_id", "BES::Billing::Groups", { group_id => "group_id" });
__PACKAGE__->belongs_to("id", "BES::Billing::Settings", { id => "id" });
__PACKAGE__->belongs_to("tar_id", "BES::Billing::Tarifs", { tar_id => "tar_id" });
__PACKAGE__->belongs_to(
  "request_by",
  "BES::Billing::Managers",
  { person_id => "request_by" },
);
__PACKAGE__->belongs_to(
  "tar_id_new",
  "BES::Billing::Tarifs",
  { tar_id => "tar_id_new" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:je3XS3LeVJKsjvWEtq0A5w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/TarifsRasp.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
