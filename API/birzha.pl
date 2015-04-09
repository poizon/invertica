#!/usr/bin/perl -w

use strict;

use lib qw(.);
use API::BIRZHA qw (:ALL);
use CGI qw(header param);

print header(-charset => 'utf8');
print qq(<title>Интерфейс правообладателя (WEB)</title>);
my $mode = param('mode') || 'error';
my $id = param('id') || 0;

my %hash = ( 'getMediaObjects'   => \&get_media_objects,
			 'addMediaObject'   => \&add_media_object,
			 'getMediaObject'   => \&get_media_object,
			 'getMediaObjectFile'   => \&get_media_object_file,
			 'addMediaObjectFile'   => \&add_media_object_file,
			 'changeMediaObjectFile'   => \&change_media_object_file,
			 'delMediaObjectFile'   => \&del_media_object_file,
			 'getMediaObjectFileStatus'   => \&get_media_object_file_status,
			 'loadMediaObjectFile'   => \&load_media_object_file,
			 'checkRemoteSourceConnection'   => \&check_remote_source_connection,
			 'getLoadMediaObjectFileStatus'   => \&get_load_media_object_file_status,
			 'getMyOffers'   => \&get_my_offers,
			 'getMyOffer'   => \&get_my_offer,
			 'addMyOffer'   => \&add_my_offer,
			 'changeMyOffer'   => \&change_my_offer,
			 'getOtherOffers'   => \&get_other_offers,
			 'getStats'   => \&get_stats,
			 'getMyProfile'   => \&get_my_profile,
			 'changeMyProfile'   => \&change_my_profile,
			 'getFinance'   => \&get_finance,
			 'getCrewAccounts'   => \&get_crew_accounts,
			 'getCrewAccount'   => \&get_crew_account,
			 'addCrewAccount'   => \&add_crew_account,
			 'changeCrewAccount'   => \&change_crew_account,
			 'delCrewAccount'   => \&del_crew_account,

			 'getOperResources'   => \&get_oper_resources,
			 'addAudResource'   => \&add_aud_resource,
			 'changeAudResource'   => \&change_aud_resource,
			 'getAudResource'   => \&get_aud_resource,
			 'addAdsResource'   => \&add_ads_resource,
			 'changeAdsResource'   => \&change_ads_resource,
			 'getAdsResource'   => \&get_ads_resource,
			 'getOperOffers'   => \&get_oper_offers,
			 'getOperOffer'   => \&get_oper_offer,
			 'addOperOffer'   => \&add_oper_offer,
			 'changeOperOffer'   => \&change_oper_offer,			 
			 'getOtherOperOffers'   => \&get_other_oper_offers,
			 'getOperStats'   => \&get_oper_stats,
			 'getOperProfile'   => \&get_oper_profile,
			 'changOperProfile'   => \&change_oper_profile,
			 'getOperFinance'   => \&get_oper_finance,
			 'getOperCrewAccounts'   => \&get_oper_crew_accounts,
			 'getOperCrewAccount'   => \&get_oper_crew_account,
			 'addOperCrewAccount'   => \&add_oper_crew_account,
			 'changeOperCrewAccount'   => \&change_oper_crew_account,
			 'delOperCrewAccount'   => \&del_oper_crew_account,
             'error'             => \&web_error,
            );

if(!param) {
    print $hash{error}->($id);
} else {
    print $hash{$mode}->($id);
}

#
# заглушка для ошибки
sub web_error {
    return qq(
    <hr width=100%>
    <h3>Все функции возвращают данные в формате JSON</h3>
    Модуль: <a href="http://193.164.132.203/WEB.pm">WEB.pm</a> (42 кб)<br><br>
    <table border=1>
    <tr>
    <td><a href="?mode=getMediaObjects&id=100" target="_self">Получить ID всех фильмов</a></td>
    <td> Возвращает: ссылку на массив списка ID медиаобъектов (фильмов) <br> Аргументы: ID правообладателя  
    </td></tr>
    <tr>
    <td><a href="?mode=addMediaObject&id=100" target="_self">Добавить фильм</a></td>
    <td> Возвращает: ID-медиаобъекта -  успех, 0 - ошибка <br> Аргументы:   ID правообладателя и ссылка на хеш с данными медиаобъекта
    <tr>
    <td><a href="?mode=getMediaObject&id=100" target="_self">Показать информацию о фильме</a></td>
    <td> Возвращает: ссылку на хэш данных по медиаобъекту (фильму)   <br> Аргументы: ID правообладателя и ID медиаобъекта  
    </td></tr>
     <tr>
    <td><a href="?mode=getMediaObjectFile&id=100" target="_self">Показать информацию о файле данных</a></td>
    <td> Возвращает:  ссылку на хэш со свойствами файла данных медиаобъекта (фильма)  <br> Аргументы:  ID медиаобъекта и ID медиафайла
    </td></tr>
        <tr>
    <td> <a href="?mode=addMediaObjectFile&id=100" target="_self">Добавить файл данных</a></td>
    <td> Возвращает: ID файла данных  -  успех, 0 - ошибка <br> Аргументы: ID медиаобъекта и хеш с данными по файлу данных
    </td></tr>
        <tr>
    <td> <a href="?mode=changeMediaObjectFile&id=100" target="_self">Изменить файл данных</a></td>
    <td> Возвращает: ID файла данных  -  успех, 0 - ошибка <br> Аргументы: ID медиаобъекта, ID файла данных и хеш с данными по файлу данных
    </td></tr>
        <tr>
    <td><a href="?mode=delMediaObjectFile&id=100" target="_self">Удалить файл данных</a></td>
    <td> Возвращает:   1 -  успех, 0 - ошибка  <br> Аргументы: ID медиаобъекта и ID файла данных
    </td></tr>
        <tr>
    <td><a href="?mode=getMediaObjectFileStatus&id=100" target="_self">Показать статус файла данных</a></td>
    <td> Возвращает:  ссылку на хэш со статусом файла данных <br> Аргументы:  ID медиаобъекта и ID файла данных
    </td></tr>
        <tr>
    <td><a href="?mode=loadMediaObjectFile&id=100" target="_self">Зарузить файл данных</a></td>
    <td> Возвращает:  ID файла данных -  успех, 0 - ошибка <br> Аргументы:  передаем ID правообладателя, ID медиаобъекта, ID файла данных и  ссылку на хеш данных для загрузки с удаленного источника
    </td></tr>
        <tr>
    <td><a href="?mode=checkRemoteSourceConnection&id=100" target="_self">Показать статус удаленного источника файла данных</a></td>
    <td> Возвращает:  1 -  успех, 0 - ошибка  <br> Аргументы: ссылку на хеш данных, которые характеризуют источник загрузки
    </td></tr>
        <tr>
    <td><a href="?mode=getLoadMediaObjectFileStatus&id=100" target="_self">Показать статус файла при offline-зарузке</a></td>
    <td> Возвращает: оставшееся время загрузки и процент от загруженного файла   <br> Аргументы: передаем ID медиаобъекта, ID файла данных
    </td></tr>
        <tr>
    <td  colspan="2" > &nbsp; </td>
</tr>
        <tr>
    <td><a href="?mode=getMyOffers&id=100" target="_self">Показать ID всех моих предожений</a></td>
    <td> Возвращает: ссылку на массив со списком ID предложений сделанных самим пользователем <br> Аргументы:  ID правообладателя
    </td></tr>
        <tr>
    <td><a href="?mode=getMyOffer&id=100" target="_self">Показать предложение</a></td>
    <td> Возвращает: ссылку на хеш параметров предложения сделанного самим пользователем <br> Аргументы:  ID правообладателя и ID предложения
    </td></tr>
        <tr>
    <td><a href="?mode=addMyOffer&id=100" target="_self">Добавить предложение</a></td>
    <td> Возвращает: ID предложения если удача, 0 если ошибка.  <br> Аргументы: ID правообладателя и хеш данных по предложению
    </td></tr>
        <tr>
    <td><a href="?mode=changeMyOffer&id=100" target="_self">Изменить мое предложение</a></td>
    <td> Возвращает: ID предложения если удача, 0 - если ошибка <br> Аргументы:  ID правообладателя, ID предложения и хеш данных по предложению
    </td></tr>
    <tr>
    <td><a href="?mode=getOtherOffers&id=100" target="_self">Показать ID всех сторонних предложений</a></td>
    <td> Возвращает: ссылку на массив со списком ID предложений сделанных друими пользователями  <br> Аргументы: ID правообладателя
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
    </tr>
         <tr>
    <td><a href="?mode=getStats&id=100" target="_self">Показать статистику правообладателя</a></td>
    <td> Возвращает: ссылку на хэш со cтатистической информацией по действиям пользователя пользователя <br> Аргументы: ID правообладателя, период за который необходимо получить статистику и хеш других данных для выборки
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
	</tr>
    <tr>
    <td><a href="?mode=getMyProfile&id=100" target="_self">Показать профиль правообладателя</a></td>
    <td> Возвращает: ссылку на хэш с информацией по профайлу правообладателя <br> Аргументы: ID правообладателя
    </td></tr>
    <tr>
    <td><a href="?mode=changeMyProfile&id=100" target="_self">Изменить профиль правообладателя</a></td>
    <td> Возвращает:  1 -  успех, 0 - ошибка <br> Аргументы: передаем ID правообладателя и хеш профиля правообладателя
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
	</tr>
         <tr>
    <td><a href="?mode=getFinance&id=100" target="_self">Показать финансовую статистику</a></td>
    <td> Возвращает: ссылку на хэш с финансовой информацией по правообладателю <br> Аргументы: ID правообладателя и интересующий период
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
	</tr>
    <tr>
    <td><a href="?mode=getCrewAccounts&id=100" target="_self">Показать аккаунты правообладателя</a></td>
    <td> Возвращает: ссылку на массив со списом ID аккаунтов правообладателя  <br> Аргументы: ID правообладателя
    </td></tr>
         <tr>
    <td><a href="?mode=getCrewAccount&id=100" target="_self">Показать аккаунт правообладателя</a></td>
    <td> Возвращает: ссылку на хэш перечнем настроек аккаунта правообладателя <br> Аргументы: ID правообладателя и ID аккаунта правообладателя
    </td></tr>
    <tr>
    <td><a href="?mode=addCrewAccount&id=100" target="_self">Добавить аккаунт правообладателя</a></td>
    <td> Возвращает: ID аккаунта -  успех, 0 - ошибка  <br> Аргументы: ID правообладателя и хеш с данными по аккаунту правообладателя
    </td></tr>
         <tr>
    <td><a href="?mode=changeCrewAccount&id=100" target="_self">Изменить аккаунт правообладателя</a></td>
    <td> Возвращает: ID аккаунта -  успех, 0 - ошибка   <br> Аргументы: передаем ID правообладателя, ID аккаунта и хеш с данными по аккаунту правообладателя
    </td></tr>
          <tr>
    <td><a href="?mode=delCrewAccount&id=100" target="_self">Удалить аккаунт правообладателя</a></td>
    <td> Возвращает 1-  успех, 0 - ошибка. <br> Аргументы:  ID правообладателя и ID аккаунта
    </td></tr> 
        <tr>
    <td  colspan="2" > <h3>Интерфейс оператора (витрина)</h3></td>
	</tr>       
	<tr>
    <td><a href="?mode=getOperResources&id=100" target="_self">Получить ID всех русурсов для оператора</a></td>
    <td> Возвращает ссылку на массив списка ID ресурсов данного оператора <br> Аргументы: ID оператора 
    </td></tr>  
	<tr>
    <td><a href="?mode=addAudResource&id=100" target="_self">Добавить ресурс аудитории </a></td>
    <td> Возвращает ID-ресурса -  успех, 0 - ошибка <br> Аргументы:  ID оператора и ссылка на хеш с данными ресурса
    </td></tr> 
	<tr>
    <td><a href="?mode=changeAudResource&id=100" target="_self">Изменить ресурс аудитории</a></td>
    <td> Возвращает 1 -  успех, 0 - ошибка <br> Аргументы: ID оператора и ссылка на хеш с данными ресурса 
    </td></tr> 
	<tr>
    <td><a href="?mode=getAudResource&id=100" target="_self">Получить информацию о ресурсе аудитории</a></td>
    <td>  Возвращает ссылку на хэш данных по ресурсу аудитории оператора  <br> Аргументы: ID оператора и ID ресурса 
    </td></tr> 
	<tr>
    <td><a href="?mode=addAdsResource&id=100" target="_self">Добавить ресурс рекламной площадки</a></td>
    <td> Возвращает 1 -  успех, 0 - ошибка <br> Аргументы: ID оператора и ссылка на хеш с данными ресурса
    </td></tr> 
	<tr>
    <td><a href="?mode=changeAdsResource&id=100" target="_self">Изменить ресурс рекламной площадки</a></td>
    <td> Возвращает 1 -  успех, 0 - ошибка <br> Аргументы: D оператора и ссылка на хеш с данными ресурса рекламы
    </td></tr> 
	<tr>
    <td><a href="?mode=getAdsResource&id=100" target="_self">Получить информацию о ресурсе рекламной площадки</a></td>
    <td> Возвращает ссылку на хэш данных по ресурсу оператора  <br> Аргументы:  ID оператора и ID ресурса рекламы
    </td></tr> 
        <tr>
    <td><a href="?mode=getOperOffers&id=100" target="_self">Показать ID всех предложений оператора</a></td>
    <td> Возвращает: ссылку на массив со списком ID предложений сделанных самим оператором <br> Аргументы:  ID оператора
    </td></tr>
        <tr>
    <td><a href="?mode=getOperOffer&id=100" target="_self">Показать предложение</a></td>
    <td> Возвращает: ссылку на хеш параметров предложения сделанного самим оператом <br> Аргументы:  ID оператора и ID предложения
    </td></tr>
        <tr>
    <td><a href="?mode=addOperOffer&id=100" target="_self">Добавить предложение</a></td>
    <td> Возвращает: ID предложения если удача, 0 если ошибка.  <br> Аргументы: ID оператора и хеш данных по предложению
    </td></tr>
        <tr>
    <td><a href="?mode=changeOperOffer&id=100" target="_self">Изменить мое предложение</a></td>
    <td> Возвращает: ID предложения если удача, 0 - если ошибка <br> Аргументы:  ID оператора, ID предложения и хеш данных по предложению
    </td></tr>
    <tr>
    <td><a href="?mode=getOtherOperOffers&id=100" target="_self">Показать ID всех сторонних предложений</a></td>
    <td> Возвращает: ссылку на массив со списком ID предложений сделанных другими операторами <br> Аргументы: ID оператора
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
    </tr>
         <tr>
    <td><a href="?mode=getOperStats&id=100" target="_self">Показать статистику оператора</a></td>
    <td> Возвращает: ссылку на хэш со cтатистической информацией по действиям оператора <br> Аргументы: ID оператора, период за который необходимо получить статистику и хеш других данных для выборки
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
	</tr>
    <tr>
    <td><a href="?mode=getOperProfile&id=100" target="_self">Показать профиль оператора</a></td>
    <td> Возвращает: ссылку на хэш с информацией по профайлу оператора <br> Аргументы: ID оператора
    </td></tr>
    <tr>
    <td><a href="?mode=changeOperProfile&id=100" target="_self">Изменить профиль оператора</a></td>
    <td> Возвращает:  1 -  успех, 0 - ошибка <br> Аргументы: передаем ID оператора и хеш профиля оператора
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
	</tr>
         <tr>
    <td><a href="?mode=getOperFinance&id=100" target="_self">Показать финансовую статистику оператора</a></td>
    <td> Возвращает: ссылку на хэш с финансовой информацией по оператору <br> Аргументы: ID оператора и интересующий период
    </td></tr>
    <tr>
    <td  colspan="2" > &nbsp; </td>
	</tr>
    <tr>
    <td><a href="?mode=getOperCrewAccounts&id=100" target="_self">Показать аккаунты оператора</a></td>
    <td> Возвращает: ссылку на массив со списом ID аккаунтов оператора  <br> Аргументы: ID оператора
    </td></tr>
         <tr>
    <td><a href="?mode=getOperCrewAccount&id=100" target="_self">Показать аккаунт оператора</a></td>
    <td> Возвращает: ссылку на хэш перечнем настроек аккаунта оператора <br> Аргументы: ID оператора и ID аккаунта оператора
    </td></tr>
    <tr>
    <td><a href="?mode=addOperCrewAccount&id=100" target="_self">Добавить аккаунт правообладателя</a></td>
    <td> Возвращает: ID аккаунта -  успех, 0 - ошибка  <br> Аргументы: ID правообладателя и хеш с данными по аккаунту оператора
    </td></tr>
         <tr>
    <td><a href="?mode=changeOperCrewAccount&id=100" target="_self">Изменить аккаунт правообладателя</a></td>
    <td> Возвращает: ID аккаунта -  успех, 0 - ошибка   <br> Аргументы: передаем ID оператора, ID аккаунта и хеш с данными по аккаунту оператора
    </td></tr>
          <tr>
    <td><a href="?mode=delOperCrewAccount&id=100" target="_self">Удалить аккаунт оператора</a></td>
    <td> Возвращает 1-  успех, 0 - ошибка. <br> Аргументы:  ID оператора и ID аккаунта
    </td></tr> 

  

    </table>
    
    );
}