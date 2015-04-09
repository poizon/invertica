package BES::IMHO;
use strict;
use warnings;# don't forget remove this pragma in production!

use LWP::UserAgent;
use Digest::MD5;
#use XML::Bare;
use JSON;

# конструктор класса
sub new {
    my $class = shift;
    my $self = bless {}, $class;
    
       $self->{data} = {
        -cid  => 1259657676,
        -user => 'gogo',
        -pass => 'asd123456',
        @_,
    };
       
       $self->{url} = 'http://connector.imhonet.ru/distrib_api/';
       $self->{md5} = Digest::MD5->new();
       $self->{ua}  = LWP::UserAgent->new(timeout => 20, agent => 'Mozilla/5.0' );
       $self->{json} = JSON->new->utf8(0);
    return $self;
}

# Получить оценку по объекту
# Аргументы: ssid,soid
# возвращает оценку (скаляр)
sub get_rate {
    my ( $class, $ssid, $soid ) = @_;
    my $md5_chksum = _sign( $class, $ssid, $soid );
    # собираем url
    my $url = $class->{url} . $md5_chksum.'/'.$class->{data}->{-cid}.'/'.$ssid.'/'.$soid.'/get_rate.json';
    # если все ок - то возвращаем оценку
    if( my $hash_ref = _request($class, $url) ) {
        # упрощаем структуру (так как предполагается только 1 элемент в массиве)
        $hash_ref = $hash_ref->[0];
        return $hash_ref->{rate};
    }# значит что-то не так...
    else {
        return -1;
    }
    
}

# Поставить оценку объекту
# Аргументы: ssid (id субъекта (пользователя), soid (id объекта, фильма), rate - оценка (1-10)
# возвращает статус:
# Флаг изменения оценки по объекту (1 - оценка добавлена или изменена,
# 0 - оценка по объекту не изменилась)
sub edit_rate {
    my ( $class, $ssid, $soid, $rate ) = @_;
    my $md5_chksum = _sign( $class, $ssid, $soid );
    # собираем url
    my $url = $class->{url} . $md5_chksum.'/'.$class->{data}->{-cid}.'/'.$ssid.'/'.$soid.
            '/edit_rate.json?soids='.$soid.'&values='.$rate;
    # если все ок - то возвращаем оценку
    if( my $hash_ref = _request($class, $url) ) {
        return $hash_ref->{rates_updated};
    }# значит что-то не так...
    else {
        return -1;
    }
    
}
#################
# PRIVATE SUBS
sub _request {
    my ( $class, $url ) = @_;
    my $response = $class->{ua}->get($url);
    
    if ($response->is_success) {
        my $ref = $class->{json}->decode($response->content);
        return $ref;
    }
    else {
        return undef;
    }
}

# создаем подпись для md5_checksum    
sub _sign {
    my ($class, $ssid, $soid) = @_;
    # собираем строку для хэширования
    $class->{md5}->add(join ":",$class->{data}->{-cid}, $class->{data}->{-user}, 
                                              $class->{data}->{-pass}, $ssid,$soid);
    # хэшируем в md5_hex
    return $class->{md5}->hexdigest;
}

1;
