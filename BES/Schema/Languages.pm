package BES::Schema::Languages;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("Languages");
__PACKAGE__->add_columns(
  "lang_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 10 },
  "lang",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("lang_id");
__PACKAGE__->has_many(
  "mediaobjects",
  "BES::Schema::Mediaobjects",
  { "foreign.originallangid" => "self.lang_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2010-01-07 22:55:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9oLZr9KTRgtXHX8I5OspzQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
