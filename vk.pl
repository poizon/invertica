#!/usr/bin/perl -w
use strict;
use BES::VK;

# опция json позволяет определять тип возвращаемых данных
# либо в json, либо в perl-структуре (декодированный json)
my $vk = BES::VK->new(json => 0);

# вывести список друзей с 0 по 4-й
my $list = $vk->friends_list(0,5);
#print $list;

# вывести входящие сообщения с 0 по 9
my $msg = $vk->msg_inbox(0,10);
# текст сообщения (если json => 0)
print $msg->{d}->[0]->{2}->[0],"\n";
#print $msg;