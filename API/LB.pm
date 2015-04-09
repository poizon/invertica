package API::LB;


################################################# 
################ Lan Billing module ############# 
#################################################

use strict;
use warnings;
use SOAP::Lite;
use Time::localtime;


# перед вызовом кадой функции необходима обазательная авторизация
########### LB AUTH ###########
my $lb = SOAP::Lite->uri('urn:api3')->proxy("http://127.0.0.1:34012", keep_alive => 1, timeout => 30);
$lb->proxy->http_request->headers->header('User-Agent' => 'LBpm');          
my $xml_content = "<login>admin</login><pass></pass>";                                                                                                       
my $arg = SOAP::Data->type('xml' => $xml_content);
my $ret = $lb->Login($arg);                                                                                                            
my $cookie = $lb->proxy->http_response->headers->header('Set-Cookie');                                                                                       
my $session = $1 if defined($cookie) && $cookie =~ /sessnum=(\w+);/;                                                                                         
$lb->proxy->http_request->headers->header('Cookie' => "sessnum=$session;") if defined $session;                                                              

################################################################# 



sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

######### проверка баланса (по номеру договора )
sub getBalance {
    my $client_agr = $_[0];
    my $clientBalance = 0;
    my $xml_content = "<flt><agrmnum>$client_agr</agrmnum></ftl>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $lb->getVgroups($arg);
    $clientBalance = $ret->valueof('//ret/balance');
    $clientBalance = 0 if (!$clientBalance);
    return  $clientBalance;
}


######### генерация нового пароля переменной длины
sub genPasswd  {
    my $digits = 10;
    $digits = int( rand(4)) + 5;
    my @pass_chars = ("A".."H", "J".."Z", "a".."h", "m".."z", 2..9);
    srand();
    my $LBPass = "";
    $LBPass = join("", @pass_chars[map {rand @pass_chars}(1..$digits)]);
    return $LBPass;
}

########### получение даты в формате LB
my $my_time = localtime;
my $my_date = sprintf("%04d-%02d-%02d",($my_time->year+1900), ($my_time->mon+1), ($my_time->mday));


########### проверка сущестования аккаунта (по номеру договора)
sub isAccountsExist ($) {
    my $agr = $_[0];
    my $result = 0;
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $lb->getVgroups($arg);
    my $exist = "";
    $exist = $ret->valueof('//ret/vgid');
    if ($exist ne "")  {
        $result = 1;
    }
    else {
        $result = 0;
    }
    return $result;
}

##############################################
sub addAccount ($) {
    my $phone_num = $_[0];
    my $result = 0;

    my $xml_content = "<isInsert>1</isInsert><val><account><uid></uid><ipaccess>0</ipaccess><billdelivery>0</billdelivery><category>0</category><type>2</type
><oksm>0</oksm><templ>0</templ><wrongactive>0</wrongactive><archive>0</archive><login>$phone_num</login><pass>$lk_pass</pass><descr></descr><name>$acc_name</
name><phone></phone><fax></fax><email></email><bankname></bankname><branchbankname></branchbankname><treasuryname></treasuryname><treasuryaccount></treasurya
ccount><bik></bik><settl></settl><corr></corr><kpp></kpp><inn></inn><ogrn></ogrn><okpo></okpo><okved></okved><gendiru></gendiru><glbuhgu></glbuhgu><kontperso
n></kontperson><actonwhat></actonwhat><passsernum></passsernum><passno></passno><passissuedate></passissuedate><passissuedep></passissuedep><passissueplace><
/passissueplace><birthdate></birthdate><birthplace></birthplace><lastmoddate></lastmoddate><wrongdate></wrongdate><okato></okato></account><usergroups><userg
roup><groupid>2</groupid><promiseallow>0</promiseallow><promiserent>0</promiserent><promisetill>0</promisetill><promisemax>0.0</promisemax><promisemin>0.0</p
romisemin><promiselimit>0.0</promiselimit><name></name><description></description></usergroup><usercnt>0</usercnt><fread>0</fread><fwrite>0</fwrite></usergro
ups><addresses><type>0</type><code></code><address></address></addresses><agreements><agrmid></agrmid><uid>0</uid><operid>0</operid><curid>1</curid><bnotify>
0</bnotify><archive>0</archive><vgroups>0</vgroups><balance>0.0</balance><balancecurr>0.0</balancecurr><credit>0.0</credit><blimit>0.0</blimit><number>$phone
_num</number><code></code><date>$my_date</date><bcheck></bcheck><symbol></symbol></agreements></val>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    $ret = $lb->insupdAccount($arg);
    my $id = $ret->valueof('//ret/');

    my $xml_content2 = "<id>$id</id>";
    my $arg2 = SOAP::Data->type('xml' => $xml_content2);
    my $ret2 = $lb->getAccount($arg2);
$e=Dumper($ret2);
$e =~ s/\n//g;
    my $agrmid = $ret2->valueof('//ret/agreements/agrmid/');
    if ($agrmid eq "") {
        my $err2mail="phone=".$phone_num." ret=".$e;
        `echo "$err2mail" | mail -iI -s LB_error nickolayr\@gmail.com`; ##FOR DEBUG
        $ret2 = $lb->getAccount($arg2);
        $agrmid = $ret2->valueof('//ret/agreements/agrmid/');
    }


    my $xml_content3 = "<isInsert>1</isInsert><val><vgroup><vgid>0</vgid><cuid>0</cuid><tarid>$tarid</tarid><agrmid>$agrmid</agrmid><id>1</id><shape>0</shape
><currentshape>0</currentshape><maxsessions>1</maxsessions><blkreq>0</blkreq><blocked>0</blocked><changed>0</changed><templ>0</templ><ipdet>0</ipdet><portdet
>0</portdet><archive>0</archive><dlimit>0</dlimit><amount>0.0</amount><creationdate></creationdate><accondate></accondate><accoffdate></accoffdate><blockdate
></blockdate><cdate></cdate><dclear></dclear><descr></descr><login>$phone_num</login><pass>$rad_pass</pass></vgroup><tarrasp><recordid>0</recordid><vgid>0</v
gid><agrmid>$agrmid</agrmid><groupid>0</groupid><uid>0</uid><id>0</id><taridnew>$tarid</taridnew><taridold>0</taridold><requestby></requestby><changetime>$my
_date</changetime><vglogin></vglogin><agrmnum>$phone_num</agrmnum><code></code><accname>AccName</accname><agentname>Telephony</agentname><tarnewname></tarnew
name><taroldname></taroldname><mgrname></mgrname></tarrasp><telstaff><vgid>0</vgid><device>0</device><ldservice>0</ldservice><phonenumber>$phone_num</phonenu
mber><comment>proverkaSOAP</comment></telstaff></val>";
    my $arg3 = SOAP::Data->type('xml' => $xml_content3);
    my $ret3 = $lb->insupdVgroup($arg3);


my $xml_content4 = "<val><recordid>0</recordid><agrmid>$agrmid</agrmid><modperson>0</modperson><currid>0</currid><orderid>0</orderid><status>0</status><amoun
t>0.5</amount><paydate>$my_date</paydate><localdate>$my_date</localdate><canceldate>0000-00-00</canceldate><receipt>A12345-50</receipt><comment>free 50 cents
</comment></val>";
my $arg4 = SOAP::Data->type('xml' => $xml_content4);
my $ret4 = $lb->Payment($arg4);

    return $result;
}



1;
