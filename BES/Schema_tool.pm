package BES::Schema;
# для генерации схемы
# perl -MDBIx::Class::Schema::Loader=dump_to_dir:BES -MBES::Schema -e "BES::Schema->connection()"
use strict;
use warnings;
  
use base qw/DBIx::Class::Schema::Loader/;
    
 __PACKAGE__->loader_options(
            debug         => 1,
            really_erase_my_files => 1,
              );
__PACKAGE__->connection('dbi:mysql:host:193.164.132.203;database=Invertica', 'user_api','devdev');
                
1;