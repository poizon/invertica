package API::STB;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status
                    add_movie_rate
                    add_movie_comment add_movie_to_playlist add_movie_tag
                    add_movie_pay show_user_recomends add_movie_favor
                    show_user_watched show_movie_friends show_user_tags order_movie edit_movie_tags
                    show_user_lib show_file_details add_file_comment share_file_friends show_group_list join_group
                    search_group show_group_details show_top_movie_group offer_movie_to_top show_group_comments
                    vote_group_movie add_group_comment add_group_content show_group_members show_user_about
                    show_user_messages show_user_group show_user_playlist add_playlist add_movie_playlist rm_movie_playlist
                    config_visibility show_user_friends show_friend_short show_friend_details invite_friends
                    search_vidimax add_from_facebook add_from_gmail add_from_twitter add_from_vkontakte
                    change_password show_user_profiles show_watched_statistic add_profile rm_profile
                    save_profile_changes show_paid_statistic show_user_balance pay_yandex pay_rapid
                    add_top_box rm_top_box change_top_box request_support show_kb
                    );
                    
                    
our %EXPORT_TAGS = (
                    FILM => [qw (show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status
                    add_movie_rate
                    add_movie_comment add_movie_to_playlist add_movie_tag
                    add_movie_pay show_user_recomends add_movie_favor
                    )],
                    LK => [qw(show_user_watched show_movie_friends show_user_tags order_movie
                            edit_movie_tags show_user_lib show_file_details add_file_comment
                            share_file_friends show_group_list join_group search_group
                            show_group_details show_top_movie_group offer_movie_to_top
                            show_group_comments vote_group_movie add_group_comment add_group_content
                            show_group_members show_user_about show_user_messages show_user_group
                            show_user_playlist add_playlist add_movie_playlist rm_movie_playlist
                            config_visibility show_user_friends show_friend_short show_friend_details
                            invite_friends search_vidimax add_from_facebook add_from_gmail
                            add_from_twitter add_from_vkontakte change_password show_user_profiles
                            show_watched_statistic add_profile rm_profile save_profile_changes
                            show_paid_statistic show_user_balance pay_yandex pay_rapid add_top_box
                            rm_top_box change_top_box request_support show_kb)]
                    );                    

# так как данные возвращаем в формате JSON
use JSON;
use lib qw(..);
# в этот модуль вынести все функции по работе с ланбиллингом через SOAP
use API::SOAP;

#####################
# GLOBALS настройки
# объект для JSON
my $json=JSON->new();
my $soap = API::SOAP->new();

# заглушки вынесем в отдельные файлы
require 'API/temp_sub.pl';
require 'API/temp_sub2.pl';
###########################################################
################ FILMS ####################################
###########################################################
###########################################################
# Функции получения данных о фильме
# все они получают параметр movie_id,
# возвращают различные данные

# показать основные данные о фильме:
# жанр, название, название/год, режисер/актеры, ссылки на фото и трейлеры, рейтинг,
# стоимость, описание
sub show_movie_titles {
    my $movie_id = shift;
    # алгоритм следующий:
    # запрос к БД на выборку необходимых данных,
    # результат сохраняем в ... либо в ссылку на хэш, либо на хэш хэшей,
    # либо на хэш массивов. Зависит от структуры данных
    # предположим что в ссылку на хэш
    my $movie_titles = _get_from_db_titles($movie_id);
    my $json_text   = $json->encode($movie_titles);
    # возвращает данные в формате JSON:
    # {"m_director":"МакДжи/Кристиан Бейл, Антон Ельчин, Сэм Уортингтон",
    # "m_descr":"Действие фильма разворачивается в далеком...",
    # "m_trailers":"1.mpg,2.mpg,3.mpg","m_year":"Colambia Pic/2009",
    # "m_genre":"Боевик","m_foto":"foto.jpg","m_price":60,"m_name":"Терминатор 4"}
    return $json_text;
}

# возвращает ссылку на массив тэгов для данного кино
sub show_movie_tags {
    my $movie_id = shift;
    # запрос к бд на выборку тэгов по id
    # получаем ссылку на массив с тэгами
    my $movie_tags = _get_from_db_tags($movie_id);
    my $json_text   = $json->encode($movie_tags);
    # возвращаем строку в формате JSON
    return $json_text;
}

# возвращает ссылку на хэш с комментариями и авторами
sub show_movie_comments {
    my $movie_id = shift;
    # запрос к бд на выборку авторов и отзывов
    # возвращает ссылку на хэш хэш
    my $movie_comments = _get_from_db_comments($movie_id);
    my $json_text = $json->encode($movie_comments);
    # возвращаем строку в формате JSON
    return $json_text;
}

# проверить статус фильма (скачивается)
# и возвращает код статуса (0-3), процент скачивания (0%,0-99%,100%),
# и время до завершения (в минутах)
# процент в десятичном виде (0.99 = 99%)
sub show_movie_status {
    my $movie_id = shift;
    # запрос к бд на выборку данных по статусу фильма
    my $movie_status = _get_from_db_status($movie_id);
    my $json_text = $json->encode($movie_status);
    # возвращаем строку в формате JSON
    return $json_text;
}

####################################################################
# Функции получающие инфорамцию о пользователе.
# В качестве параметра принимают user_id, возвращают различные данные

# показывает список плейлистов пользователя
# возвращает ссылку на хэш: playlistid => "Название плейлиста"
# !!!! ПЕРЕНЕСТИ В PersoanlArea.pm! ПЕРСЕЧЕНИЕ!!!
#sub show_user_playlist {
#    my $user_id = shift;
#    my $user_playlist = _get_from_db_playlist($user_id);
#    my $json_text = $json->encode($user_playlist);
#    # возвращаем строку в формате JSON
#    return $json_text;
#}

# показывает баланс пользователя в рублях
# округленный до 2-х знаков после запятой
# !!!! ПЕРЕНЕСТИ В PersoanlArea.pm! ПЕРСЕЧЕНИЕ!!!
#sub show_user_balance {
#    my $user_id = shift;
#    my $user_balance = _get_from_db_balance($user_id);
#    my $json_text = $json->encode($user_balance);
#    # возвращаем строку в формате JSON
#    return $json_text;
#}

# по кнопке предложить другу  выводит список друзей
# возвращает ссылку на массив с именами друзей
# !!! ПЕРЕНЕСТИ В PersoanlArea.pm ПЕРСЕЧЕНИЕ!!!
#sub show_user_friends {
#    my $user_id = shift;
#    my $user_friend_list = _get_from_db_friendlist($user_id);
#    my $json_text = $json->encode($user_friend_list);
#    # возвращаем строку в формате JSON
#    return $json_text;
#}

# Показать рекомендации.
# Возвращает ссылку на массив c id фильмов
sub show_user_recomends {
    my $user_id = shift;
    my $_user_recomends = _get_from_db_recomends($user_id);
    my $json_text = $json->encode($_user_recomends);
    # возвращаем строку в формате JSON
    return $json_text;
}
##################################################################
# Функции добавления/редактирования/изменения информации о фильме
# получают в качетсве аргумента id фильма (movie_id) + в некоторых
# случаях доп. аргументы описанные отдельно
# возвращают ралличные данные в формате JSON

# изменить рейтинг фильма.
# возвращает измененный рейтинг
sub add_movie_rate {
    my $movie_id = shift;
    my $rate = _do_something($movie_id);
    my $json_text = $json->encode($rate);
    # возвращаем строку в формате JSON
    return $json_text;
}

# пометить как понравилось
# аргументы id фильма, id пользователя
# возвращает 1-  успех, 0 - ошибка
sub add_movie_favor {
    my ($movie_id, $user_id) = @_;
    # вставлем информацию в БД
    my $result = _do_something($movie_id, $user_id);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# добавить отзыв
# возвращает 1-  успех, 0 - ошибка
sub add_movie_comment {
    my $movie_id = shift;
    # вставлем информацию в БД
    my $result = _do_something($movie_id);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# добавить в playlist
# аргументы id фильма, id плейлиста (если id плейлиста уникально для всей таблицы)
# возвращает 1-  успех, 0 - ошибка
sub add_movie_to_playlist {
    my ($movie_id, $playlist_id) = @_;
    # вставлем информацию в БД
    my $result = _do_something($movie_id, $playlist_id);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# добавить тэг
# возвращает 1-  успех, 0 - ошибка
sub add_movie_tag {
    my $movie_id = shift;
    # вставлем информацию в БД
    my $result = _do_something($movie_id);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# оплатить фильм
# аргументы: id фильма, id пользователя
# возвращает 1-  успех, 0 - ошибка
sub add_movie_pay {
    my ($movie_id, $user_id) = @_;
    my $result = _do_something($movie_id);
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

###################################
# БИБЛИОТЕКА
###################################
# Я СМОТРЕЛ

###
# Показать что смотрел пользователь
# аргументы: user_id, page_num (default =1)
# де page_num - номер страницы для листинга
# возвращает ссылку на хэш:
# обложка => url, Название => Терминатор,
# В плейлистах_моих_друзей => \%hashref
sub show_user_watched {
    my $user_id = shift;
    my $page_num = shift || 1;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# Получить совпадения с плейлистами
# друзей по фильму. Функция используется для вызова внутри show_user_watched
# аргументы: user_id, movie_id
sub show_movie_friends {
    my ($user_id, $movie_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# Показать все тэги польователя
# аргументы: user_id,
# возвращает ссылку на массив
sub show_user_tags {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# Заказать фильм
# аргументы: user_id, movie_id
# 0 - ошибка, 1 - успех
# в процессе заказа - проверяем баланс пользователя и стоимость фильма
# стоимость фильма в БД(?), баланс через ЛБ
sub order_movie {
    my ($movie_id, $user_id) = @_;
    # обращаемся через модуль к ЛБ для проверки баланса
    if($soap->checkClientBlance(-user_id => $user_id)) {
        return $json->encode([1]);
    } else {
        return $json->encode([0]);
    }
}
# редактировать тэги. будет применяться в ЛК в разделе карточка фильма
# аргументы movie_id, user_id, $tags (ссылка на массив)
# 0 - ошибка, 1 - успех
sub edit_movie_tags {
    my ($movie_id, $user_id, $tags) = @_;
    # пишем измененные теги в БД
    # возвращаем код результата
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

####
# МОЙ КОНТЕНТ

# показывает файлы на приставке пользователя
# аргументы: user_id, возвращает ссылку на хэш
sub show_user_lib {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}
# показывает информацию о файле детально
# аргументы: file_id,
# возвращает сылку на хэш
sub show_file_details {
    my $file_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# добавить отзыв к файлу. Возможно пересечение с STB::add_movie_comment
# все зависит от структуры БД
# возвращает 1-  успех, 0 - ошибка
sub add_file_comment {
    my $movie_id = shift;
    # вставлем информацию в БД
    my $result = _do_something();
    my $json_text = $json->encode($result);
    # возвращаем строку в формате JSON
    return $json_text;
}

# открыть доступ друзьям
# аргументы user_id, film_id
# возвращает 1-  успех, 0 - ошибка
sub share_file_friends {
    my ($user_id, $film_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

###
# ГРУППЫ

# показыает список групп.
# аргументы - user_id - для идентификации групп в которых уже участвует пользователь
# возвращает ссылку на хэш
sub show_group_list {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# присоединиться к группе/отсоединиться от группы
# аргументы: user_id, group_id, flag (0 - отсоединиться, 1 - присоединиться)
# возвращает 1-  успех, 0 - ошибка
sub join_group {
    my ($user_id, $group_id, $flag) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# поиск группы
# аргументы: keywords (поисковая фраза)
# возвращает ссылку на хэш
sub search_group {
    my $keyword = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показывает информацию о группе детально
# аргумент: group_id
# возвращает ссылку на хэш
sub show_group_details {
    my $group_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показать лучшие фильмы о мнению группы
# аргумент: group_id
# возвращает ссылку на хэш
sub show_top_movie_group {
    my $group_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# предожить лучший фильм
# аргументы: user_id,group_id, movie_id
# возвращает 1-  успех, 0 - ошибка
sub offer_movie_to_top {
    my ($user_id, $group_id, $movie_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показать трэд группы (комментарии в группе)
# вопрос о многостраничности или архиве(?)
# аргументы group_id, page_id (для многостраничности)
# возвращает ссылку на хэш (хэш хэшей или smth) 
sub show_group_comments {
    my ($group_id, $page_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# голосовать за ролик (за и против в одной функции)
# аргументы: user_id, movie_id, group_id, vote ([1] - за, [-1] - против)
# возвращает рейтинг с учетом голоса если удачно или 0 - если неудачна операция
sub vote_group_movie {
    my ($user_id, $group_id, $movie_id, $vote) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# ответить в трэд группы
# аргументы: user_id, group_id, текст_сообщения
# возвращает 1-  успех, 0 - ошибка
sub add_group_comment {
    my ($user_id, $group_id, $message) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# добавить свой контент
# насчет аргументов.. пока такие: user_id, group_id, film_id
# возвращает 1-  успех, 0 - ошибка
sub add_group_content {
    my ($user_id, $group_id, $film_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показывает членовы группы.
# можно использовать для показа членов "онлайн", "офлайн", "всех"
# аргументы: group_id, status (0 - оффлайн,1 - онлайн,2 - все)
# возвращает ссылку на хэш (user_id => имя)
sub show_group_members {
    my ($group_id, $status) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

###
# О СЕБЕ

# показывает общую инфорамцию о пользователе
# аргументы: user_id
# возвращает ссылку на хэш
sub show_user_about {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показать личные сообщения
# аргументы: user_id
# возвращает ссылку на хэш
sub show_user_messages {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показать группы пользователя/все группы,
# в том числе в которых он состоит и созданные им лично.
# А также вывести флаг о новых сообщениях в группах
# аргументы: user_id, flag (если 0 - все группы, если 1 - группы пользователя)
# возвращает хэш, который будет иметь флаги для идентификации группы:
# group_flag:
# 1 - состоит в группе, 0 - моя группа,
# message_flag:
# 0 - нет новостей, 1 - есть новости
sub show_user_group {
    my ($user_id, $flag) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# пересекается с show_user_playlist из STB.pm,
# но необходимо расширить функциями,
# то есть возвращает не только имя плейлиста, но и состав плейлиста
sub show_user_playlist {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# новый плейлист
# аргументы: user_id, playlist_name (название плейлиста)
# возвращает 1-  успех, 0 - ошибка
sub add_playlist {
    my ($user_id, $playlist_name) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# добавить кино в плейлист
# аргументы: playlist_id, movie_id (при условии что плейлисты уникальны для БД)
# возвращает 1-  успех, 0 - ошибка
sub add_movie_playlist {
    my ($playlist_id, $movie_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# удалить фильм из плейлиста
# аргументы: playlist_id, movie_id (при условии что плейлисты уникальны для БД)
# возвращает 1-  успех, 0 - ошибка
sub rm_movie_playlist {
    my ($playlist_id, $movie_id) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# настройка видимости
# аргументы: user_id,\%hash, где хэш имеет примерно ткую структуру:
# $hash{показывать историю моих просмотров} => 1|0
# $hash{показывать историю просмотров категории XXX} => 1|0
# $hash{показывать информацию обо мне} => 1|0
# возвращает 1-  успех, 0 - ошибка
sub config_visibility {
    my ($user_id, $hash_ref) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

###
# ДРУЗЬЯ

# выводит список друзей/всех
# аргументы: user_id, flag (0 - друзья, 1 - все)
# возвращает ссылку на хэш, в хэше присутствует атрибут
# идентифицирующий общих друзей
sub show_user_friends {
    my ($user_id, $flag) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показыает краткую информацию о друге
# аргументы: user_id, friend_id
# user_id необходим для проверки прав на просмотр информации о пользователе
# возвращает ссылку на хэш
sub show_friend_short {
    my ($user_id, $friend_id) = @_;
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показывает детальную информаицю о друге (Подробно)
# аргументы: user_id, friend_id
# user_id необходим для проверки прав на просмотр информации о пользователе
# возвращает ссылку на хэш
sub show_friend_details {
    my ($user_id, $friend_id) = @_;
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}
###
# детальная информация о друге
# выводится дополнительными функциями помимо show_friend_details
# эти функции уже частично описаны:
# show_user_lib
# show_group_list
# show_user_playlist
# show_user_watched
# show_user_friends - список друзей друга,

# по кнопке Стать другом
#  аргументы: user_id, friend_id
# возвращает 1-  успех, 0 - ошибка
sub invite_friends {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# не совсем понятно - что искать в vidimax?
# аргументы: фраза для поиска
# возвращает набор данных, возможно в виде ссылки на хэш
sub search_vidimax {
    my $keywords = shift;
    #
}

# добавлять друзей из других систем.
# с аргументами тут пока неопределился..., но скорее всего:
# аргументы: ident (login, email ? в зависимости от системы)
# возвращает 1-  успех, 0 - ошибка

sub add_from_facebook {
    my $ident = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

sub add_from_gmail {
    my $ident = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

sub add_from_twitter {
    my $ident = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

sub add_from_vkontakte {
    my $ident = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

#####
## ОФИС

# изменить пароль
# аргументы: user_id, old_password, new_password
# возвращает 1-  успех, 0 - ошибка
sub change_password {
    my ($user_id, $old_password, $new_password) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показать список профайлов
# аргуенты user_id
# возвращает ссылку на хэш, в котором
# содержится вся информация о всех профайлах пользователя
sub show_user_profiles {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}


# показывает статистику потребления по просмотрам
# за период
# аргументы: user_id, start_date, end_date
# возвращает ссылку на хэш
sub show_watched_statistic {
    my ($user_id, $start_date, $end_date) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# добавить профайл
# аргументы: user_id, profile_name
# возвращает 1-  успех, 0 - ошибка
sub add_profile {
    my ($user_id, $profile_name) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# удалить профайл
# аргументы: user_id, profile_name
# возвращает 1-  успех, 0 - ошибка
sub rm_profile {
    my ($user_id, $profile_name) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# сохранить изменения в профайле
# аргументы: user_id, profile_name, \%hash_ref (входные данные от клиента)
# возвращает 1-  успех, 0 - ошибка
sub save_profile_changes {
    my ($user_id, $profile_name, $hash_ref) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показывает статистику потребления по платежам
# за период
# аргументы: user_id, start_date, end_date
# возвращает ссылку на хэш
sub show_paid_statistic {
    my ($user_id, $start_date, $end_date) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# показывает остаток на лицевом счете
# аргументы: user_id
# возвращает число: %.2f
# использует функцию из SOAP::LB.pm
sub show_user_balance {
    my $user_id = shift;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# платеж с яндекса
sub pay_yandex {
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# платеж с рапида
sub pay_rapid {
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# добавить приставку
# аргументы: user_id, \%hash (входные данные)
# возвращает 1-  успех, 0 - ошибка
sub add_top_box {
    my ($user_id, $hash_ref) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# удалить приставку
# аргументы: user_id, sn_topbox (?) - s/n приставки
sub rm_top_box {
    my ($user_id, $sn_topbox) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# изменить параметры приставки
# аргументы: user_id, \%hash (входные данные)
# возвращает 1-  успех, 0 - ошибка
sub change_top_box {
    my ($user_id, $hash_ref) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

##
# ПОДДЕРЖКА

# написать в тэх.поддержку
# аргументы: user_id, \%hash (входные данные)
# $hash{subject} => ''; $hash{message}=>''
# возвращает 1-  успех, 0 - ошибка
sub request_support {
    my ($user_id, $hash_ref) = @_;
    #
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

# отобразить данные из базы знаний, разделы, статьи
# аргументы: keywords (по умолчанию выводим все разделы)
# возвращаем ссылку на хэш, примерно такой:
# $hash{section}=>[article1, article2, ... , articlen]
sub show_kb {
    my $keywords = shift || undef;
    if(defined $keywords) {
        # show smth
        
    } else {
        # show all;
    }
    my $result = _do_something();
    my $json_text = $json->encode($result);
    return $json_text;
}

##################################################
################# MENU ###########################
# данные функции реализованы для демонстрации
# работы с меню в STB
##################################################
# отображаем меню пользователя
# возвращает список объектов меню в виде html
#sub show_menu {
#    my $in = shift;
#    return _get_from_db_menu_objects();
#}
#
#sub show_content {
#    my $in = shift;
#    return _get_from_db_content_objects();
#}

1;
