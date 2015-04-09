package BES::VK;
use strict;
use warnings;

use LWP::UserAgent;
use JSON;

# конструктор
sub new {
    my $class = shift;
    my $self = bless {}, $class;
    # свойства объекта
       $self->{data} = {
        url_data  => 'http://userapi.com/data?act',
        url_login => 'http://login.userapi.com/auth?login',
        sid       => '19412ed3d9cba30bbd70da3161a644ab',
        user_id   => 19358849,
        site_id   => 2,
        email     => '',
        passwd    => '',
        json      => 1,
        @_,
    };
    # готовим UserAgent
    $self->{connect} = LWP::UserAgent->new(timeout => 20, agent => 'Mozilla/5.0' );
    $self->{json} = JSON->new->utf8(0);
    return $self;
}

##
#Показать список друзей пользователя
# аргументы from, to  -показать друзей от и до (не включительно)
sub friends_list {
    my ( $self, $from, $to ) = @_;
    # собираем урл для обращения
    my $url = $self->{data}->{url_data}.'=friends&from='.$from.'&to='.$to.
                '&id='.$self->{data}->{user_id}.'&sid='.$self->{data}->{sid};
    return _request($self,$url);

}

# показать все входящие сообщения сообщения
sub msg_inbox {
    my ( $self, $from, $to ) = @_;
    # собираем урл для обращения
    my $url = $self->{data}->{url_data}.'=inbox&from='.$from.'&to='.$to.
                '&sid='.$self->{data}->{sid};
                
    return _request($self,$url);            
}
###################
# PRIVATE SUBS

sub _request {
    my ($class, $url) = @_;
    ## отсылаем запрос
    my $response = $class->{connect}->get($url);
    
    if ($response->is_success) {
        # получаем в двух форматах данные
        # JSON
        my $encode = $response->content;
        $encode =~ s/(\d):/"$1":/g;
        # раскодируем в perl структуру
        my $decode = $class->{json}->decode($encode);
        #if(exists $check{ok} && $check{ok}==-1); нужен перелогин(!)
        # переводим в JSON, если указана опция
        return $class->{data}->{json} ? $encode : $decode;
    }
    else {
        return $response->status_line;
        }
}

1;

#'"' expected, at character offset 14 ["0:"151248861",1:"125..."] at BES/VK.pm line 68.
#unexpected end of string while parsing JSON string, at character offset 15
# (before ":"151248861",1:"1255...") at BES/VK.pm line 64

# Логин, или как-то надо получать sid ?
# Логаут, а также рефреш sid'a
#Показать список друзей пользователя	+
#показать личные сообщения	VK
#выводит список друзей/всех (не всех, а поиск по людям)	VK
#показыает краткую информацию о друге	VK
#показывает детальную информаицю о друге	VK
