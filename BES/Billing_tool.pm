package BES::Schema;
# для генерации схемы
# perl -MDBIx::Class::Schema::Loader=dump_to_dir:BES -MBES::Billing -e "BES::Billing->connection()"
use strict;
use warnings;
  
use base qw/DBIx::Class::Schema::Loader/;
    
 __PACKAGE__->loader_options(
            debug         => 1,
            really_erase_my_files => 1,
              );
__PACKAGE__->connection('dbi:mysql:host:localhost;database=billing', 'user_api','devdev');
                
1;