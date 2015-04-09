package BES::Billing::SbssKnowledgePosts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_knowledge_posts");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "knowledge_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
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
  "text",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "spec",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "sbss_knowledge_files",
  "BES::Billing::SbssKnowledgeFiles",
  { "foreign.post_id" => "self.id" },
);
__PACKAGE__->belongs_to(
  "knowledge_id",
  "BES::Billing::SbssKnowledge",
  { id => "knowledge_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 16:22:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gD0YSUYOfsMh91T6m9jQXA
# These lines were loaded from '/home/nikk/Invertica/BES/Billing/SbssKnowledgePosts.pm' found in @INC.# They are now part of the custom portion of this file# for you to hand-edit.  If you do not either delete# this section or remove that file from @INC, this section# will be repeated redundantly when you re-create this# file again via Loader!
package BES::Billing::SbssKnowledgePosts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("sbss_knowledge_posts");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "knowledge_id",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
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
  "text",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "spec",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "sbss_knowledge_files",
  "BES::Billing::SbssKnowledgeFiles",
  { "foreign.post_id" => "self.id" },
);
__PACKAGE__->belongs_to(
  "knowledge_id",
  "BES::Billing::SbssKnowledge",
  { id => "knowledge_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-25 09:59:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s+vcQPRD3w4UI08pgfmHLg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/nikk/Invertica/BES/Billing/SbssKnowledgePosts.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
