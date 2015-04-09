package BES::LB;

use strict;
use warnings;
#use DBI;
use BES::DB;  
use SOAP::Lite 'trace', 'debug'; # don't forget delete for production
use Time::localtime;
#use JSON;
use utf8;
use Time::Local;

################################################# 
################ Lan Billing module ############# 
#################################################

#our @EXPORT_OK = qw(getAccount getNextAgreement isAccountsExist addAccount addAccService addTariff addTarCategory delVgroup delAccount getBalance putPayment delAccService); 
                
# - конструктор класса
sub new {
    my ($class, $config) = @_;
    my $self = bless {}, $class;
    # коннект к БД
    $self->{dbh} = BES::DB->connect(
        host => $config->{db_b}{hostname},
        db   => $config->{db_b}{database},
        user => $config->{db_b}{username},
        pass => $config->{db_b}{password},
    );      

    # коннект к SOAP    
    $self->{lb} = SOAP::Lite->uri('urn:api3')->proxy("$config->{soap}{url}", keep_alive => 1, timeout => 30);
    $self->{lb}->proxy->http_request->headers->header('User-Agent' => 'LBpm');
    my $xml_content = "<login>$config->{soap}{username}</login><pass>$config->{soap}{password}</pass>";    
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $self->{lb}->Login($arg);
    my $cookie = $self->{lb}->proxy->http_response->headers->header('Set-Cookie');
    my $session = $1 if defined($cookie) && $cookie =~ /sessnum=(\w+);/;
    $self->{lb}->proxy->http_request->headers->header('Cookie' => "sessnum=$session;") if defined $session;

    return $self;
}

#############################################################################
## Авторизуемся на SOAP
#############################################################################                                                                                                                                                  
### перед вызовом каждого метода необходима обазательная авторизация
sub Auth() {
    my $lb = SOAP::Lite->uri('urn:api3')->proxy("http://127.0.0.1:34012", keep_alive => 1, timeout => 30);
    $lb->proxy->http_request->headers->header('User-Agent' => 'LBpm');
    my $xml_content = "<login>admin</login><pass></pass>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $lb->Login($arg);
    my $cookie = $lb->proxy->http_response->headers->header('Set-Cookie');
    my $session = $1 if defined($cookie) && $cookie =~ /sessnum=(\w+);/;
    $lb->proxy->http_request->headers->header('Cookie' => "sessnum=$session;") if defined $session;
    return $lb;
}
#################################################################     



my $tarid = 1;


#############################################################################
# Возвращает следующий свободный номер договора для нового пользователя
#############################################################################
## 12345467 - договора из 7-ми цифр
## inv12345467 - логины в ЛК
sub getNextAgreement () {
    ## MYSQL CONNECTION ####
    my $driver = "mysql";
    my $db="billing";
    my $db_host="127.0.0.1";
    my $db_user="user_api";
    my $db_password='devdev';
    my $dbh = DBI->connect("DBI:mysql:database=$db;host=$db_host",$db_user, $db_password)  ||die print "Can't connect";
    my $db_query ="";
    my $db_query_handle = "";
    $db_query = "SELECT max(number) FROM `agreements`";
    $db_query_handle = $dbh->prepare($db_query);
    $db_query_handle->execute();
    my $result = $db_query_handle->fetchrow_array();
    if ((!(defined $result))||($result eq "-"))	{
	return 5500000000;
	
    } 
    
    return $result+1;    
#    return encode_json $result;
}

#############################################################################
## NEW 10 DIGITS PASSWORD GENERATION SUB 
#############################################################################
sub genPass ($) {
    my $digits = $_[0];
    #$digits = int( rand(4)) + 5;
    my @pass_chars = ("A".."H", "J".."Z", "a".."h", "m".."z", 2..9);
    srand();
    my $LBPass = join("", @pass_chars[map {rand @pass_chars}(1..$digits)]);
    return $LBPass;
}
###############################################################


#############################################################################
# Проверяет есть ли учетная запись с таким договором 
#############################################################################
## договор может быть присвоен пользователю, но у него может не быть учетной записи с этим догвоором, т.е. нет услуг
sub isAccountsExist ($) {
    my ($class, $in, $config) = @_;
    ## входные параметры	
    my $agr = $_[0]; #номер договора
    my $result = 0;
    
    ## ищем учетную запись по новмеру договора
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->getVgroups($arg);
    my $exist = $ret->valueof('//ret/vgid');
    if (defined $exist )  {
        $result = 1;
    }
    else {
        $result = 0;
    }
    return $result;
}
#############################################################################


#############################################################################
# Удаляет пользователя по номеру договора 
#############################################################################
sub delAccount ($) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $agr = $_[0]; # номер договора
    my $result = 0;

    ## ищем аккаунт по номеру договора
    my $xml_content3 = "<flt><agrmnum>$agr</agrmnum></flt>";                                                                                                  
    my $arg3 = SOAP::Data->type('xml' => $xml_content3);                                                                                                       
    my $ret3 = $class->{lb}->getAccounts($arg3);       
    my $userid = $ret3->valueof('//ret/account/uid'); 
    if (!(defined $userid))  {
	return 0;
    }

    ## удаляем аккаунт
    my $xml_content4 = "<id>$userid</id>";
    my $arg4 = SOAP::Data->type('xml' => $xml_content4);
    my $ret4 = $class->{lb}->delAccount($arg4);
    $result = $ret4->valueof('//ret/');
    if (!(defined $result))  {
        return 0;
    }
    return 1;
}
#############################################################################

#############################################################################
# Добавляет пользователя в систему и создает ему учетную запись с выбранным ТП
#############################################################################
sub addAccount ($$$$$$) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $agr = $_[0]; # номер договора
    my $type = $_[1]; # 2- физическое лицо
    my $user_name = $_[2]; # имя аккаунта
    my $tarid = $_[3]; # ID тарифа 
    my $email = $_[4]; # email
    my $birthdate = $_[5]; # дата рождения yyyy-mm-dd 
    
    my $my_time = localtime;
    my $my_date = sprintf("%04d-%02d-%02d",($my_time->year+1900), ($my_time->mon+1), ($my_time->mday));
    my $result = 0;
    my $userPass = genPass(10);
    my $accPass = genPass(10);
    
	
	#create user
    my $xml_content = "<isInsert>1</isInsert><val><account><uid></uid><ipaccess>0</ipaccess><billdelivery>0</billdelivery><category>0</category><type>2</type><oksm>0</oksm><templ>0</templ><wrongactive>0</wrongactive><archive>0</archive><login>inv$agr</login><pass>$userPass</pass><descr></descr><name>$user_name</name><phone></phone><fax></fax><email>$email</email><bankname></bankname><branchbankname></branchbankname><treasuryname></treasuryname><treasuryaccount></treasuryaccount><bik></bik><settl></settl><corr></corr><kpp></kpp><inn></inn><ogrn></ogrn><okpo></okpo><okved></okved><gendiru></gendiru><glbuhgu></glbuhgu><kontperson></kontperson><actonwhat></actonwhat><passsernum></passsernum><passno></passno><passissuedate></passissuedate><passissuedep></passissuedep><passissueplace></passissueplace><birthdate>$birthdate</birthdate><birthplace></birthplace><lastmoddate></lastmoddate><wrongdate></wrongdate><okato></okato></account><usergroups><usergroup><groupid>0</groupid><promiseallow>0</promiseallow><promiserent>0</promiserent><promisetill>0</promisetill><promisemax>0.0</promisemax><promisemin>0.0</promisemin><promiselimit>0.0</promiselimit><name></name><description></description></usergroup><usercnt>0</usercnt><fread>0</fread><fwrite>0</fwrite></usergroups><addresses><type>0</type><code></code><address></address></addresses><agreements><agrmid></agrmid><uid>0</uid><operid>0</operid><curid>1</curid><bnotify>0</bnotify><archive>0</archive><vgroups>0</vgroups><balance>0.0</balance><balancecurr>0.0</balancecurr><credit>0.0</credit><blimit>0.0</blimit><number>$agr</number><code></code><date>$my_date</date><bcheck></bcheck><symbol></symbol></agreements></val>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->insupdAccount($arg);
    my $userid = $ret->valueof('//ret/');
    if (!(defined $userid))  {
        $result = 0;
        return $result;
    }

    #get user info by ID
    my $xml_content2 = "<id>$userid</id>";
    my $arg2 = SOAP::Data->type('xml' => $xml_content2);
    my $ret2 = $class->{lb}->getAccount($arg2);
    my $agrmid = $ret2->valueof('//ret/agreements/agrmid/');
    if (!(defined $agrmid))  {
        $result = 0;
        return $result;
    }
    
    
    #create account for user
    my $xml_content3 = "<isInsert>1</isInsert><val><vgroup><vgid></vgid><cuid>0</cuid><tarid>$tarid</tarid><agrmid>$agrmid</agrmid><id>1</id><shape>0</shape><currentshape>0</currentshape><maxsessions>1</maxsessions><blkreq>0</blkreq><blocked>0</blocked><changed>0</changed><templ>0</templ><ipdet>0</ipdet><portdet>0</portdet><archive>0</archive><dlimit>0</dlimit><amount>0.0</amount><creationdate></creationdate><accondate>$my_date</accondate><accoffdate></accoffdate><blockdate></blockdate><cdate></cdate><dclear></dclear><descr></descr><login>a$agr</login><pass>$accPass</pass></vgroup><tarrasp><recordid>0</recordid><vgid>0</vgid><agrmid>$agrmid</agrmid><groupid>0</groupid><uid>0</uid><id>0</id><taridnew>$tarid</taridnew><taridold></taridold><requestby></requestby><changetime>$my_date</changetime><vglogin></vglogin><agrmnum>$agr</agrmnum><code></code><accname>AccName</accname><agentname>Invertica</agentname><tarnewname></tarnewname><taroldname></taroldname><mgrname></mgrname></tarrasp></val>";
    my $arg3 = SOAP::Data->type('xml' => $xml_content3);
    my $ret3 = $class->{lb}->insupdVgroup($arg3);
    my $vgid = $ret3->valueof('//ret/'); 
    if (!(defined $vgid))  {
        $result = 0;
        return $result;
    }    
    
    $result = $agr;
    return $result;  
}    
    
#############################################################################
# Выдает информацию о клиенте 
#############################################################################
sub getAccount($) {
    my ($class, $in, $config) = @_;
    ## входные параметры        
    my $agr = $_[0]; #номер договора
    my $result = 0;
    
    ## на выходе
    my ($out, $balance,$tarifdescr) = ""; # из учетной записи
    my ($login,$pass,$name,$email,$birthdate,$number,$date,$symbol) = ""; # из аккаунта 

    ## ищем учетную запись по номеру договора
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->getVgroups($arg);
    my $uid = $ret->valueof('//ret/uid');
    $out = $uid;
    if (!(defined $uid ))  {
        return 0;
    } else {
	$balance = $ret->valueof('//ret/balance');
	$tarifdescr = $ret->valueof('//ret/tarifdescr');
    
	## ищем учетную запись по номеру договора
        my $xml_content2 = "<id>$uid</id>";
        my $arg2 = SOAP::Data->type('xml' => $xml_content2);
        my $ret2 = $class->{lb}->getAccount($arg2);
        my $uid = $ret2->valueof('//ret/account/uid');
        if (!(defined $uid ))  {
            return 0;
        } 
       $login = $ret2->valueof('//ret/account/login'); 	           
       $pass = $ret2->valueof('//ret/account/pass');
       $name = $ret2->valueof('//ret/account/name');  
       $email = $ret2->valueof('//ret/account/email');
       $birthdate = $ret2->valueof('//ret/account/birthdate');
       $number = $ret2->valueof('//ret/agreements/number');  
       $date = $ret2->valueof('//ret/agreements/date');  
       $symbol = $ret2->valueof('//ret/agreements/symbol');  
       $out =  { balance => $balance,tarifdescr => $tarifdescr, login => $login, pass => $pass, name => $name, number => $number, date => $date, symbol => $symbol, email => $email, birthdate => $birthdate};
    }
    return $out; #encode_json $out;
#    return [$agr];
}
#############################################################################

    
#############################################################################
# Добавляет услугу на аккаунт
#############################################################################
sub addAccService ($$$$) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $agr= $_[0]; # ID учетной записи
    my $tarid = $_[1]; # ID тарифа 
    my $catid = $_[2]; # ID категории внутри тарифа 
    my $count = $_[3]; # количество приобретаемых услуг
    
    my $my_time = localtime;
    my $my_date = sprintf("%04d-%02d-%02d",($my_time->year+1900), ($my_time->mon+1), ($my_time->mday));
    my $result = 0;
 

    ## ищем учетную запись по номеру договора
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->getVgroups($arg);
    my $exist = $ret->valueof('//ret/vgid');
    if (defined $exist)  {
	my $xml_content = "<val><servid></servid><vgid>$exist</vgid><tarid>$tarid</tarid><catidx>$catid</catidx><needcalc>1</needcalc><mul>$count</mul><personid></personid><comment></comment><created></created><timefrom>$my_date</timefrom><timeto></timeto></val>";
	    my $arg = SOAP::Data->type('xml' => $xml_content); 
	    my $ret = $class->{lb}->insUsboxService($arg);
	    $result = $ret->valueof('//ret');
	    if (!(defined $result))  {
	        return 0;
	    } else {
		$result = 1;
	    }
    }	else {
        return 0;
    }
#    $result = $ret;
    return $result;
  	
}

#############################################################################                                                                               
# Показывает услуги для аккаунта по ID учетной записи
#############################################################################                                                                                
sub getAccServices ($) {
    my ($class, $in, $config) = @_;
    ## входные параметры                                                                                                                                 
    my $vgid = $_[0]; # ID учетной записи                                                                                                                    
    my $result = 0;


    #get services
    my $xml_content = "<flt><vgid>$vgid</vgid></flt>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->getUsboxServices($arg);
    if (!(defined $ret))  {
        $result = 0;
        return $result;
    }
}


#############################################################################                                                                                
# Удаляет услугу с аккаунта                                                                                                                                
#############################################################################                                                                                
sub delAccService ($) {                                                                                                                                     
    my ($class, $in, $config) = @_;
    ## входные параметры                                                                                                                                 
    my $id = ""; # ID учетной записи                                                                                                                    
    my $result = 0;                                                                                                                                                         
                                                                                                                                                             
    #del service                                                                                                                                         
    my $xml_content = "<id>$id</id>";
    my $arg = SOAP::Data->type('xml' => $xml_content);                                                                                                       
    my $ret = $class->{lb}->delUsboxService($arg);                                                                                                                    
    if (!(defined $ret))  {                                                                                                                                  
        $result = 0;                                                                                                                                         
        return $result;                                                                                                                                      
    }                                                                                                                                                        
}

#############################################################################
# Добавляет тариф в биллинг
#############################################################################
sub addTariff ($) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $descr = $_[0]; # название тарифа
    my $type = 5; # 5 - Периодические и разовые услуги
    my $act_block = 1; #Применять автоматическую блокировку услуги: 0-нет, 1-да, 2-применять активную блокировку
    
    #Tariff creating
    my $xml_content = "<isInsert>1</isInsert><val><tarif><tarid></tarid><shape>0</shape><trafflimit>0</trafflimit><trafflimitper>0</trafflimitper><type>$type</type><actblock>$act_block</actblock><archive>0</archive><priceplan>0</priceplan><trafftype>0</trafftype><dailyrent>0</dailyrent><dynamicrent>0</dynamicrent><shapeprior>0</shapeprior><unavaliable>0</unavaliable><rentmultiply>0</rentmultiply><chargeincoming>0</chargeincoming><curid>1</curid><used>0</used><dynroute>0</dynroute><rent>0.0</rent><blockrent>0.0</blockrent><descr>$descr</descr><symbol></symbol></tarif></val>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $result = $class->{lb}->insupdTarif($arg); 
    return $result;
}

#############################################################################
# Добавляет категорию в тариф
#############################################################################
sub addTarCategory ($$$$) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $descr = $_[0]; # название категории
    my $tarid = $_[1]; # ID тарифа      
    my $above = $_[2]; # Стоимость услуги в данной категории (в валюте тарифа)
    my $common = $_[3]; # тип услуги: 0-разовая,1-переодич. с ежемесяч. списанием,2-ежеднев.,3-ежеднев. равными долями  
    my $permabove =0; #  цена услуги для уч. записи в заблокированном состоянии. 
    
	#Category creating
    my $xml_content = "<isInsert>1</isInsert><val><tarcategory><tarid>$tarid</tarid><catid></catid><catidx></catidx><includes>0</includes><common>$common</common><disprior>0</disprior><archive>0</archive><operid>1</operid><freeseconds>0</freeseconds><minchargedur>0</minchargedur><roundseconds>0</roundseconds><permabove>$permabove</permabove><above>$above</above><descr>$descr</descr></tarcategory></val>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $result = $class->{lb}->insupdTarCategory($arg);
    return $result;
}
###############################################





#############################################################################
# Возвращает баланс в валюте тарифа по номеру договора 
#############################################################################
sub getBalance ($) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $client_agr = $in->{user_id};

    my $xml_content = "<flt><agrmnum>$client_agr</agrmnum></ftl>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->getVgroups($arg);
    
    my $clientBalance = $ret->valueof('//ret/balance');
    $clientBalance = sprintf("%.2f", $clientBalance);
    my $symbol = $ret->valueof('//ret/symbol'); 

    if (!(defined $clientBalance))  {
	return 0;
    }
    utf8::encode($symbol);
    my $out =  { balance => $clientBalance, symbol => $symbol};
    return  $out;
    
}    

#############################################################################
# Зачисляет деньги на счет клиента (по номеру договора)
#############################################################################
sub putPayment ($$$) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $agr = $_[0];  #номер договора
    my $comment = $_[1]; #коммен
    my $amount = $_[2]; #сумма платежа
    my $receipt = ""; #идентификатор платежа/номер платежного поручения
 
    
    my $my_time = localtime;
    my $my_date = sprintf("%04d-%02d-%02d",($my_time->year+1900), ($my_time->mon+1), ($my_time->mday));
    
    ## ищем ID договора по номеру договора
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";
    my $arg = SOAP::Data->type('xml' => $xml_content);
    my $ret = $class->{lb}->getVgroups($arg);
    my $agrmid = $ret->valueof('//ret/agrmd');
    if (!$agrmid) {	return 0;  }
    ## зачисление платежа
    $xml_content = "<val><recordid></recordid><agrmid>$agrmid</agrmid><modperson>0</modperson><currid>0</currid><orderid>0</orderid><status>0</status><amount>$amount</amount><paydate>$my_date</paydate><localdate>$my_date</localdate><canceldate>0000-00-00</canceldate><receipt>$receipt</receipt><comment>$comment</comment></val>";
    $arg = SOAP::Data->type('xml' => $xml_content);
    $ret  = $class->{lb}->Payment($arg);
    my $pay = $ret->valueof('//ret');
    return $pay;
}


#############################################################################
# Показывает платежи клиента (по номеру договора)
#############################################################################
sub getPayments ($$$) {
    my ($class, $in, $config) = @_;
    ## входные параметры
    my $agr = $in->{user_id};  #номер договора
    my $dtfrom = $in->{dtfrom};
    my $dtto = $in->{dtto};
    
    ## ищем учетную запись по номеру договора                                                                                                                
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";                                                                                                  
    my $arg = SOAP::Data->type('xml' => $xml_content);                                                                                                       
    my $ret = $class->{lb}->getVgroups($arg);                                                                                                                
    my $agrmd = $ret->valueof('//ret/agrmd');                                                                                                                
    if ((defined $agrmd ))  {                                                                 

    # ищем платжи по ID договора
    $xml_content = "<flt><agrmid>$agrmd</agrmid><dtfrom>$dtfrom</dtfrom><dtto>$dtto</dtto></flt>";
    $arg = SOAP::Data->type('xml' => $xml_content);
    $ret = $class->{lb}->getPayments($arg);
    }

    # кладем в массив последовательно данные из SOAP ответа
    my @pays = ();
    for my $t ($ret->valueof('//ret/')) {
       utf8::encode($t->{currsymb});
       utf8::encode($t->{pay}->{comment});
       push(@pays,$t->{pay}->{paydate},sprintf("%.2f", $t->{pay}->{amount}),$t->{currsymb}, $t->{pay}->{comment}); 
    }
    
    # делаем массив хешей по платежам и возвращаем его
    my @pays_real = ();
    my $i = 0;
    for (my $index = 0; $index < @pays; $index = $index + 4) {
        $pays_real[$i]{date} = $pays[$index];
        $pays_real[$i]{oper} = "Зачисление";
        utf8::encode($pays_real[$i]{oper});
        $pays_real[$i]{amount} = "+".$pays[$index+1];
        $pays_real[$i]{cur} = $pays[$index+2];
        $pays_real[$i]{comments} = $pays[$index+3];
        $i++;
    }
    
    # сортируем по дате
    my @pays_real_sorted = sort {_timec($a->{date}) <=> _timec($b->{date})} @pays_real;
        
    return @pays_real_sorted;
}


sub getStats ($$$) {
    my ($class, $in, $config) = @_;
    my $agr = $in->{user_id};  #номер договора
    my $dtfrom = $in->{dtfrom};
    my $dtto = $in->{dtto};
    
    ## ищем учетную запись по номеру договора                                                                                                                
    my $xml_content = "<flt><agrmnum>$agr</agrmnum></flt>";                                                                                                  
    my $arg = SOAP::Data->type('xml' => $xml_content);                                                                                                       
    my $ret = $class->{lb}->getVgroups($arg);                                                                                                                
    my $agrmd = $ret->valueof('//ret/agrmd');     
    if ((defined $agrmd ))  { 
    
    
    ## ищем ID договора по номеру договора                                                                                                                   
    $xml_content = "<flt><repnum>6</repnum><agentid>1</agentid><agrmid>$agrmd</agrmid><dtfrom>$dtfrom</dtfrom><dtto>$dtto</dtto><showdefault>1</showdefault></flt>";               
#    $xml_content = "<flt><repnum>6</repnum><agrmid>5</agrmid><dtfrom>20091203000000</dtfrom></flt>";
    $arg = SOAP::Data->type('xml' => $xml_content);                                                                                                       
    $ret = $class->{lb}->getStat($arg);
    }
    my @stat = ();
    for my $t ($ret->valueof('//ret/data')) {
	utf8::encode($t->{val}[6]);
	utf8::encode($t->{val}[7]);
	utf8::encode($t->{val}[8]);
	push(@stat,$t->{val}[0],sprintf("%.2f",$t->{val}[16]),$t->{val}[8],$t->{val}[7]);
#	push(@stat,$t->{data}[1]->{val});
    }

    # делаем массив хешей по списаниям и возвращаем его 
    my @stat_real = ();
    my $i = 0;
    for (my $index = 0; $index < @stat; $index = $index + 4) {
        $stat_real[$i]{date} = $stat[$index];
        $stat_real[$i]{oper} = "Списание";
        utf8::encode($stat_real[$i]{oper}); # конвертация юникода, обяхательно
        $stat_real[$i]{amount} = "-".$stat[$index+1];
        $stat_real[$i]{cur} = $stat[$index+2];
        $stat_real[$i]{comments} = $stat[$index+3];
        $i++;
    }
    
    # сортируем по дате
    my @stat_real_sorted = sort {_timec($a->{date}) <=> _timec($b->{date})} @stat_real;
    
    return @stat_real_sorted;
}

sub _timec ($){                                                                                                                                              
    $_[0] =~ /^(\d+)-(\d+)-(\d+)\s(\d+):(\d+):(\d+)$/;                                                                                                       
    my $numeric_time = timelocal ($6, $5, $4, $3, $2-1, $1-1900);                                                                                            
    return $numeric_time;                                                                                                                                    
}

1;
