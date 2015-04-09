package BES::Billing::SearchTemplate;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("search_template");
__PACKAGE__->add_columns(
  "tpl_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "table_name",
  {
    data_type => "SET",
    default_value => "accounts",
    is_nullable => 1,
    size => 71,
  },
  "field",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "condition",
  { data_type => "SET", default_value => "=", is_nullable => 1, size => 21 },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "logic",
  { data_type => "SET", default_value => "AND", is_nullable => 1, size => 6 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:d+QWQ4nwmsHvEm5tWte0jQ
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SearchTemplate.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SearchTemplate;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("search_template");
__PACKAGE__->add_columns(
  "tpl_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "table_name",
  {
    data_type => "SET",
    default_value => "accounts",
    is_nullable => 1,
    size => 71,
  },
  "field",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "condition",
  { data_type => "SET", default_value => "=", is_nullable => 1, size => 21 },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "logic",
  { data_type => "SET", default_value => "AND", is_nullable => 1, size => 6 },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zvpmVga6rbLICCurrcs4nQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SearchTemplate.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
