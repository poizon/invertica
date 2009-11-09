package API::WEB;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(get_media_objects add_media_object get_media_object get_media_object_file 
		    add_media_object_file change_media_object_file del_media_object_file 
		    get_media_object_file_status  load_media_object_file check_remote_source_connection 
		    get_load_media_object_file_status get_my_offers get_my_offer add_my_offer 
		    change_my_offer get_other_offers get_stats get_my_profile change_my_profile 
		    get_finance get_crew_accounts get_crew_account add_crew_account 
		     change_crew_account del_crew_account web_error);
                    
our %EXPORT_TAGS = (ALL => [qw(get_media_objects add_media_object get_media_object get_media_object_file 
					 add_media_object_file change_media_object_file del_media_object_file 
					 get_media_object_file_status  load_media_object_file check_remote_source_connection 
					 get_load_media_object_file_status get_my_offers get_my_offer add_my_offer 
					 change_my_offer get_other_offers get_stats get_my_profile change_my_profile 
					 get_finance get_crew_accounts get_crew_account add_crew_account 
					 change_crew_account del_crew_account web_error)]);

# модуль описывающий интерфейс правобладателя
# так как данные возвращаем в формате JSON
use JSON;

#####################
# GLOBALS настройки
# объект для JSON
my $json=JSON->new();

###########################################################
# Практически все функции получают параметр rh_id,
# это ID правообладателя (right holder), возвращают различные данные
# $rh_id - ID правообладателя
# 
#
#
#


# Возвращает ссылку на массив списка ID медиаобъектов (фильмов) 
# доступных данному правообладателю
# на входе ID правообладателя 
sub get_media_objects {
    my $rh_id = shift;
    # запрос к БД на выборку необходимых данных
    my $rh_media_objects = _get_from_db_media_objects($rh_id);
    my $json_text   = $json->encode($rh_media_objects);
    return $json_text;
}

# Добавляет медиа-объект (фильм) 
# с описанием, датой,  авторами, режиссерами
# возвращает ID-медиаобъекта -  успех, 0 - ошибка
# на входе ID правообладателя и ссылка на хеш с данными медиаобъекта
sub add_media_object {
    my ($rh_id, $mo_hash) = @_;
    # вставляем информацию в БД
    my $result = _put_into_db_media_object($rh_id, $mo_hash);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# Возвращает ссылку на хэш данных по медиаобъекту (фильму) 
# с описанием, датой, авторами, режисерами, списком файлов данных
# (по сути аналог show_movie_titles из модуля STB.pm)
# на входе ID правообладателя и ID медиаобъекта
sub get_media_object {
    my ($rh_id, $mo_id) = @_;
    # запрос к БД на выборку необходимых данных
    my $mo_hash = _get_from_db_media_object($rh_id, $mo_id);
    my $json_text   = $json->encode($mo_hash);
    # возвращает данные в формате JSON:
    # {"m_director":"МакДжи/Кристиан Бейл, Антон Ельчин, Сэм Уортингтон",
    # "m_descr":"Действие фильма разворачивается в далеком...",
    # "m_trailers":"1.mpg,2.mpg,3.mpg","m_year":"Colambia Pic/2009",
    # "m_genre":"Боевик","m_foto":"foto.jpg","m_price":60,"m_name":"Терминатор 4"}    
    return $json_text;
}


# Возвращает ссылку на хэш со свойствами файла данных медиаобъекта (фильма)
# на входе передаем ID медиаобъекта и ID медиафайла
sub get_media_object_file {
	my ($mo_id, $mo_file_id) = @_;
    # алгоритм следующий:
    # запрос к БД на выборку необходимых данных
    my $mo_file_hash = _get_from_db_media_object_file($mo_id, $mo_file_id);
    my $json_text   = $json->encode($mo_file_hash);
    # возвращаем строку в формате JSON
    return $json_text;
}


# добавляет файл данных в медиаобъект (фильм)
# возвращает ID файла данных -  успех, 0 - ошибка
# на входе передаем ID медиаобъекта и хеш с данными по файлу данных
sub add_media_object_file {
    my ($mo_id, $mo_file_hash) = @_;
    # алгоритм следующий:
    # вставляем информацию в БД
    my $result = _put_into_db_media_object_file($mo_id, $mo_file_hash);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# изменяет файл данных в медиаобъекте (фильме)
# возвращает ID файла данных  -  успех, 0 - ошибка
# на входе передаем ID медиаобъекта, ID файла данных и хеш с данными по файлу данных
sub change_media_object_file {
    my ($mo_id,  $mo_file_id, $mo_file_hash) = @_;
    # алгоритм следующий:
    # вставляем информацию в БД (UPDATE)
    my $result = _put_into_db_media_object_file ($mo_id,  $mo_file_id, $mo_file_hash);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# удаляет файл данных из медиаобъекта (фильма)
# возвращает 1 -  успех, 0 - ошибка
# на входе передаем ID медиаобъекта и ID файла данных
sub del_media_object_file {
	my ($mo_id, $mo_file_id) = @_;
    # алгоритм следующий:
	# удаляем информацию из БД
    my $result = _del_into_db_media_object_file($mo_id, $mo_file_id);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# получает статус файла данных медиаобъекта (фильма)
# возвращает ссылку на хэш со статусом файла данных
# загружен он или нет, если offline-загрузка, сколько еще осталось
# на входе передаем ID медиаобъекта и ID файла данных
sub get_media_object_file_status {
	my ($mo_id, $mo_file_id) = @_;
    # алгоритм следующий:
    # запрос к БД на выборку необходимых данных
    my $mo_file_status_hash = _get_from_db_media_object_file_status($mo_id, $mo_file_id);
    my $json_text   = $json->encode($mo_file_status_hash);
    # возвращаем строку в формате JSON
    return $json_text;
}

# загружает файл данных в медиаобъект
# возвращает ID файла данных -  успех, 0 - ошибка
# на входе передаем ID правообладателя, ID медиаобъекта, ID файла данных
# и хеш данных для загрузки с удаленного источника
sub load_media_object_file {
	my ($rh_id, $mo_id, $mo_file_name, $load_hash) = @_;
    # алгоритм следующий:
	# вставляем информацию в БД 
	my $result = _put_into_db_load_media_object_file($rh_id, $mo_id, $mo_file_name, $load_hash);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# проверяет доступность источника файлов (FTP, FILE, HTTP, etc)
# возвращает 1 -  успех, 0 - ошибка
# на входе передаем $load_hash хеш данных, которые характеризуют источник загрузки
sub check_remote_source_connection {
	my $load_hash = shift;
    # запрос к БД на выборку необходимых данных
    my $result = _get_from_db_check_remote_source_connection($load_hash);
    my $json_text   = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# определяет статус загрузки файла медиаобъекта,  если выбрана offline загрузка
# если это FTP/HTTP, функция должна вернуть оставшееся время загрузки и процент от загруженного файла
# на входе передаем ID медиаобъекта, ID файла данных
sub get_load_media_object_file_status {
	my ($mo_id, $mo_file_id) = @_;
    # запрос к БД на выборку необходимых данных
    my $mo_file_load_hash = _get_from_db_load_media_object_file_status($mo_id, $mo_file_id);
    my $json_text   = $json->encode($mo_file_load_hash);
    # возвращаем строку в формате JSON
    return $json_text;
}


# возвращает ссылку на массив со списком ID предложений сделанных самим пользователем
# на входе передаем ID правообладателя
sub get_my_offers {
    my $rh_id = shift;
    # запрос к БД на выборку необходимых данных
    my $rh_offers = _get_from_db_rh_offers($rh_id);
    my $json_text   = $json->encode($rh_offers);
    return $json_text;
}

# возвращает ссылку на хеш параметров предложения сделанного самим пользователем
# на входе передаем ID правообладателя и ID предложения
sub get_my_offer { 
    my ($rh_id, $offer_id) = @_;
    # запрос к БД на выборку необходимых данных
    my $rh_offer_hash = _get_from_db_rh_offer($rh_id, $offer_id);
    my $json_text   = $json->encode($rh_offer_hash);
    return $json_text;
}

# добавляет предложение правообладателя в базу, 
# возвращает ID предложения если удача, 0 если ошибка.
# на входе передаем ID правообладателя и хеш данных по предложению
sub add_my_offer {
	my ($rh_id, $rh_offer_hash) = @_;
    # вставляем информацию в БД (INSERT)
    my $result = _put_into_db_my_offer($rh_id, $rh_offer_hash);
    my $json_text   = $json->encode($result);
    return $json_text;
}

# изменяет предлоние правообладателя в базе, 
# возвращает ID предложения если удача, 0 если ошибка
# на входе передаем ID правообладателя, ID предложения и хеш данных по предложению
sub change_my_offer {
	my ($rh_id, $offer_id, $rh_offer_hash) = @_;
    # вставляем информацию в БД (UPDATE)
    my $result = _put_into_db_my_offer($rh_id, $offer_id, $rh_offer_hash);
    my $json_text   = $json->encode($result);
    return $json_text;
}

# возвращает ссылку на массив со списком ID предложений сделанных друими пользователями
# на входе передаем ID правообладателя
sub get_other_offers {
	my $rh_id = shift;
    # запрос к БД на выборку необходимых данных
    my $rh_offers = _get_from_db_rh_other_offers($rh_id);
    my $json_text   = $json->encode($rh_offers);
    return $json_text;
}

# возвращает ссылку на хэш со cтатистической информацией по действиям пользователя пользователя
# на входе передаем ID правообладателя, период за который необходимо получить статистику и хеш других данных для выборки
sub get_stats {
	my ($rh_id, $period, $other_terms_hash) = @_;
    # запрос к БД на выборку необходимых данных
    my $rh_stats = _get_from_db_rh_stats($rh_id, $period, $other_terms_hash);
    my $json_text   = $json->encode($rh_stats);
    return $json_text;
}


# возвращает ссылку на хэш с информацией по профайлу правообладателя
# на входе передаем ID правообладателя
sub get_my_profile {
	my $rh_id = shift;
    # запрос к БД на выборку необходимых данных
    my $rh_profile = _get_from_db_rh_profile($rh_id);
    my $json_text   = $json->encode($rh_profile);
    return $json_text;
}

# меняет профайл правообладателя
# возвращает 1 -  успех, 0 - ошибка
# на входе передаем ID правообладателя и хеш профиля правообладателя
sub change_my_profile {
	my ($rh_id, $rh_profile_hash) = @_;
    # запрос к БД на выборку необходимых данных
    my $result = _put_into_db_rh_profile($rh_id, $rh_profile_hash);
    my $json_text   = $json->encode($result);
    return $json_text;
}

# возвращает ссылку на хэш с финансовой информацией по правообладателю
# функция обращается к локальной БД и Биллингу, и получает информацию о 
# балансе и совершенных ранее финансовых операциях за указанный период
# на входе передаем ID правообладателя и интересующий период
sub get_finance {
	my ($rh_id, $period) = @_;
    # запрос к БД на выборку необходимых данных
    my $rh_finance = _get_from_db_rh_finance($rh_id, $period);
    my $json_text   = $json->encode($rh_finance);
    return $json_text;
}

# возвращает ссылку на массив со списом ID аккаунтов правообладателя
# на входе передаем ID правообладателя
sub get_crew_accounts {
	my $rh_id = shift;
    # запрос к БД на выборку необходимых данных
    my $rh_crew_accounts_id = _get_from_db_rh_accounts($rh_id);
    my $json_text   = $json->encode($rh_crew_accounts_id);
    return $json_text;
}

# возвращает ссылку на хэш перечнем настроек аккаунта правообладателя
# на входе передаем ID правообладателя и ID аккаунта правообладателя
sub get_crew_account {
	my ($rh_id, $rh_crew_account_id) = @_;
    # запрос к БД на выборку необходимых данных
    my $rh_crew_accounts = _get_from_db_rh_account($rh_id, $rh_crew_account_id);
    my $json_text   = $json->encode($rh_crew_accounts);
    return $json_text;
}

# добавяет аккаунт для правообладателя
# возвращает ID аккаунта -  успех, 0 - ошибка
# на входе передаем ID правообладателя и хеш с данными по аккаунту правообладателя
sub add_crew_account {
	my ($rh_id, $rh_crew_account_hash) = @_;
    # вставляем информацию в БД (INSERT)
    my $result = _put_into_db_rh_crew_account ($rh_id, $rh_crew_account_hash);
    my $json_text   = $json->encode($result);
    return $json_text;
}


# изменяет аккаунт для правообладателя
# возвращает ID аккаунта -  успех, 0 - ошибка
# на входе передаем ID правообладателя, ID аккаунта и хеш с данными по аккаунту правообладателя
sub change_crew_account {
	my ($rh_id, $crew_account_id, $rh_crew_account_hash) = @_;
    # вставляем информацию в БД (UPDATE)
    my $result = _put_into_db_rh_crew_account ($rh_id, $crew_account_id, $rh_crew_account_hash);
    my $json_text   = $json->encode($result);
    return $json_text;
}

# удаляет аккаунт для правообладателя
# возвращает 1 -  успех, 0 - ошибка
# на входе передаем ID правообладателя и ID аккаунта
sub del_crew_account {
	my ($rh_id, $crew_account_id) = @_;
    # вставляем информацию в БД (UPDATE)
    my $result = _del_from_db_rh_crew_account ($rh_id, $crew_account_id);
    my $json_text   = $json->encode($result);
    return $json_text;
}






################################################################
# ЗАГЛУШКИ И ВРЕМЕННЫЕ ФУНКЦИИ
################################################################

# заглушка для ошибки
sub web_error {
    return qq(
    <hr width=100%>
    <a href="?mode=getMediaObjects&id=100" target="_self">Получить ID всех фильмов</a><br>
    <a href="?mode=addMediaObject&id=100" target="_self">Добавить фильм</a><br>
    <a href="?mode=getMediaObject&id=100" target="_self">Показать информацию о фильме</a><br>
    <a href="?mode=getMediaObjectFile&id=100" target="_self">Показать информацию о файле данных</a><br>
    <a href="?mode=changeMediaObjectFile&id=100" target="_self">Изменить файл данных</a><br>
    <a href="?mode=delMediaObjectFile&id=100" target="_self">Удалить фалй данных</a><br>
    <a href="?mode=getMediaObjectFileStatus&id=100" target="_self">Показать статус файла данных</a><br>
    <a href="?mode=loadMediaObjectFile&id=100" target="_self">Зарузить файл данных</a><br>
    <a href="?mode=checkRemoteSourceConnection&id=100" target="_self">Показать статус удаленного источника файла дыннах</a><br>
    <a href="?mode=getLoadMediaObjectFileStatus&id=100" target="_self">Показать статус файла при offline-зарузке</a><br>
    <hr width=100%>
    <a href="?mode=getMyOffers&id=100" target="_self">Показать ID всех моих предожений</a><br>
    <a href="?mode=getMyOffer&id=100" target="_self">Показать предложение</a><br>
    <a href="?mode=addMyOffer&id=100" target="_self">Добавить предложение</a><br>
    <a href="?mode=changeMyOffer&id=100" target="_self">Изменить мое предложение</a><br>
    <a href="?mode=getOtherOffers&id=100" target="_self">Показать ID всех сторонних предложений</a><br>
    <hr width=100%>
    <a href="?mode=getStats&id=100" target="_self">Показать статистику правообладателя</a><br>
    <hr width=100%>
    <a href="?mode=getMyProfile&id=100" target="_self">Показать профиль правообладателя</a><br>
    <a href="?mode=changeMyProfile&id=100" target="_self">Изменить профиль правообладателя</a><br>
    <hr width=100%>
    <a href="?mode=getFinance&id=100" target="_self">Показать финансовую статистику</a><br>
    <hr width=100%>
    <a href="?mode=getCrewAccounts&id=100" target="_self">Показать аккаунты правообладателя</a><br>
    <a href="?mode=getCrewAccount&id=100" target="_self">Показать аккаунт правообладателя</a><br>
    <a href="?mode=addCrewAccount&id=100" target="_self">Добавить аккаунт правообладателя</a><br>
    <a href="?mode=changeCrewAccount&id=100" target="_self">Изменить аккаунт правообладателя</a><br>
    <a href="?mode=delCrewAccount&id=100" target="_self">Удалить аккаунт правообладателя</a><br>
    <!-- <a href="?mode=..." target="_self">...</a><br> -->
    );
}
#
###########
# заглушки

sub _get_from_db_media_objects {
	my $rh_id = shift;
    return [100,101,167,800];    
}
sub _put_into_db_media_object {
	my ($rh_id, $mo_hash) = @_;
	return [1];
}

sub _get_from_db_media_object {
	my ($rh_id, $mo_id) = @_;
    my %hash = (m_name     => 'Терминатор 4',
                m_genre    => 'Боевик',
                m_year     => 'Colambia Pic/2009',
                m_director => 'МакДжи/Кристиан Бейл, Антон Ельчин, Сэм Уортингтон',
                m_trailers => '1.mpg,2.mpg,3.mpg',
                m_foto     => 'foto.jpg',
                m_price    => 60.0,
                m_descr    => 'Действие фильма разворачивается в далеком...',
                );
    return \%hash;
}

sub _get_from_db_media_object_file {
	my ($mo_id, $mo_file_id) = @_;
	my %hash = (f_name     => 'T3_rus.dcp',
                f_type    => 'титры',
                f_size     => '114200',
                f_lang => 'Русский',
                f_descr    => 'Русские титры для фильма Терминатор 3..',
                );
    return \%hash;
}

sub _put_into_db_media_object_file {
	my ($mo_id, $mo_file_hash) = @_;	
	return [1112];
}

sub _del_into_db_media_object_file {
	my ($mo_id, $mo_file_id) = @_;
	return [1];
}

sub _get_from_db_media_object_file_status {
	my ($mo_id, $mo_file_id) = @_;
	my %hash = (f_status   => 'не загружен',
                f_progress => '0.30',
                f_speed    => '768',
                f_time => '349',
                );
    return \%hash;
}


sub _put_into_db_load_media_object_file {
	my ($rh_id, $mo_id, $mo_file_name, $load_hash) = @_;
	return [12210];
}

sub _get_from_db_check_remote_source_connection {
	my $load_hash = shift;
	return [1];
}

sub _get_from_db_load_media_object_file_status {
	my ($mo_id, $mo_file_id) = @_;
	my %hash = (f_status   => 'не загружен',
				f_type => 'offline',
                f_progress => '0.30',
                f_speed    => '768',
                f_time => '90',
                );
    return \%hash;
}

sub _get_from_db_rh_offers {
	my $rh_id = shift;
	return  [1030,1021,1627,8400];
}

sub _get_from_db_rh_offer {
	my ($rh_id, $offer_id) = @_;
	my %hash = (o_name   => 'Новогодние фильмы',
				o_type   => 'Дистрибуция',
				o_period => '05112009-31122009',
                o_region => 'Москва',
                o_mediaobjects  => 'Ирония судьбы, Матрица',
                );
    return \%hash;	
}

sub _put_into_db_my_offer {
	my ($rh_id, $rh_offer_hash) = @_;
	return [14234];
}

sub _get_from_db_rh_other_offers {
	my $rh_id = shift;
	my %hash = (o_name   => 'Детские фильмы',
				o_type   => 'Дистрибуция',
				o_period => '01112009-10012010',
                o_region => 'Москва',
                o_mediaobjects  => 'Кортик, Гости из будущего',
                o_etc  => '...',
                );
    return \%hash;
}

sub _get_from_db_rh_stats {
	my ($rh_id, $period, $other_terms_hash) = @_;
	my %hash = (s_period   => '01112009-10012010',
				s_deals_per_day  => '1,4,2,0,3,1',
                s_etc  => '...',
                );
    return \%hash;
}

sub _get_from_db_rh_profile {
	my $rh_id = shift;
	my %hash = (p_name   => 'Rjyntyn дистрибушнс',
				p_address   => 'Дистрибуция',
				p_email => 'dsds\@contentinc.com',
                p_fax => '+74953325567',
                p_URL  => 'www.contecntinc.com',
                o_etc  => '...',
                );
    return \%hash;
}

sub _put_into_db_rh_profile {
	my ($rh_id, $rh_profile_hash) = @_;
	return [1];
}


sub _get_from_db_rh_finance {
	my ($rh_id, $period) = @_;
	my %hash = (f_balance   => '7456.00',
				f_currency   => 'руб',
				f_period => '01112009-10012010',
                f_operations => '05/11/2009 Зачисление 600.00 руб Покупка медиа данных Терминатор4  10 просмотров, 06/11/2009 Списание, -60.00 руб Конвертация Матрица,',
                f_etc  => '...',
                );
    return \%hash;
}

sub _get_from_db_rh_accounts {
	my $rh_id = shift;
	return [113,4565,77555,545345];
}

sub _get_from_db_rh_account {
	my %hash = (a_name   => 'Иванов Петр Васильевич',
				a_rights   => '[1,1,0,1,0]',
				a_email => '01112009-10012010',
                a_creationdate => '01062009',
                a_lastlogin => '01112009',
                a_etc  => '...',
                );
    return \%hash;
}

sub _del_from_db_rh_crew_account {
	my ($rh_id, $crew_account_id) = @_;
	return [1];
}

sub _put_into_db_rh_crew_account {
	my ($rh_id, $crew_account_id) = @_;
	return[12123];	
}


1;
