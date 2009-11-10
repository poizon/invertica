package API::SOAP;
# все функции для работы с ланбиллингом предлагаю вынести в отдельный модуль
#
use strict;
use warnings;

use SOAP::Lite;
# черновик
my $lb = SOAP::Lite->uri('urn:api3')->proxy("http://127.0.0.1:34012", keep_alive => 1, timeout => 30);
$lb->proxy->http_request->headers->header('User-Agent' => 'LBpm');
my $xml_content = "<login>admin</login><pass></pass>";

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

# проверяем баланс
sub checkClientBlance {
    my $self = shift;
    return 1;
}

1;
