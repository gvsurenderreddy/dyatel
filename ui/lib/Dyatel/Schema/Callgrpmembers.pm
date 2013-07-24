package Dyatel::Schema::Callgrpmembers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::Serializer", "Core");
__PACKAGE__->table("callgrpmembers");
__PACKAGE__->add_columns(
  "grp",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "ord",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "num",
  {
    data_type => "phone",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->belongs_to("grp", "Dyatel::Schema::Callgroups", { id => "grp" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2013-07-24 15:44:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:udpuB05XZ3us/7Sx/S22jQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
