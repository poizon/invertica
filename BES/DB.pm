package BES::DB;

use strict;
use warnings;

use lib qw(..);
use BES::Schema;
use base 'BES::Schema';
use Cache::Memcached;
use DBIx::Class::ResultClass::HashRefInflator;

=head1
main class for works with DB.
=cut
=head2
only shared methods
=cut

sub connect {
    my $class = shift;
    my %args = (
                host     => 'localhost',
                db       => '',
                user     => '',
                pass     => '',
                @_,
                );
    my $self = bless {}, $class;#
    $self->{connect} = BES::Schema->connect("dbi:mysql:host=$args{host};database=$args{db}",$args{user},$args{pass});
    $self->{cache} =  Cache::Memcached->new({servers  => ["127.0.0.1:11211"], debug => 0, compress_threshold => 10000});
    return $self;
}

#sub disconnect {
#    my $class = shift;
#    $class->{connect}->disconnect;
#}

1;

# /usr/bin/memcached -m 64 -p 11211 -u nobody -l 127.0.0.1
# для удобного сохранения ссылок на хэши в кэше
# см. http://search.cpan.org/~frew/DBIx-Class-0.08113/lib/DBIx/Class/Manual/Cookbook.pod#Want_to_know_if_find_or_create_found_or_created_a_row?