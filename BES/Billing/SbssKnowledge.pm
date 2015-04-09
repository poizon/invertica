package BES::Billing::SbssKnowledge;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_knowledge");
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
  "class_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "replies",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "sbss_knowledge_files",
  "BES::Billing::SbssKnowledgeFiles",
  { "foreign.knowledge_id" => "self.id" },
);
__PACKAGE__->has_many(
  "sbss_knowledge_posts",
  "BES::Billing::SbssKnowledgePosts",
  { "foreign.knowledge_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lKARGzJxrQw8rakFrQ0HCw
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssKnowledge.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssKnowledge;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_knowledge");
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
  "class_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 5 },
  "replies",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "sbss_knowledge_files",
  "BES::Billing::SbssKnowledgeFiles",
  { "foreign.knowledge_id" => "self.id" },
);
__PACKAGE__->has_many(
  "sbss_knowledge_posts",
  "BES::Billing::SbssKnowledgePosts",
  { "foreign.knowledge_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nuSydPFLl3wg9dJd3QszEQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssKnowledge.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
