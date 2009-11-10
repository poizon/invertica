package API::STB::PersonalArea;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(show_user_watched show_movie_friends show_user_tags);

our %EXPORT_TAGS = (ALL => [qw(show_user_watched show_movie_friends show_user_tags)]
                    
                    );

# модуль для ЛК
# так как данные возвращаем в формате JSON
use JSON;

use lib qw(../..);
# в этот модуль вынести все функции по работе с ланбиллингом через SOAP
use API::SOAP;

#####################
# GLOBALS настройки
# объект для JSON
my $json = JSON->new();
my $soap = API::SOAP->new(); 

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
}

# Получить совпадения с плейлистами
# друзей по фильму. Функция используется для вызова внутри show_user_watched
# аргументы: user_id, movie_id
sub show_movie_friends {
    my ($user_id, $movie_id) = @_;
    #
}

# Показать все тэги польователя
# аргументы: user_id,
# возвращает ссылку на массив
sub show_user_tags {
    my $user_id = shift;
    #
}

# Заказатmь фильм
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
}

####
# МОЙ КОНТЕНТ

# показывает файлы на приставке пользователя
# аргументы: user_id, возвращает ссылку на хэш
sub show_user_lib {
    my $user_id = shift;
    #
}
# показывает информацию о файле детально
# аргументы: file_id,
# возвращает сылку на хэш
sub show_file_details {
   my $file_id = shift;
   #
}

# добавить отзыв к файлу. Возможно пересечение с STB::add_movie_comment
# все зависит от структуры БД
# возвращает 1-  успех, 0 - ошибка
sub add_file_comment {
    my $movie_id = shift;
    # вставлем информацию в БД
    my $result = _do_something($movie_id);
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
}

###
# ГРУППЫ

# показыает список групп.
# аргументы - user_id - для идентификации групп в которых уже участвует пользователь
# возвращает ссылку на хэш
sub show_group_list {
    my $user_id = shift;
    #
}

# присоединиться к группе/отсоединиться от группы
# аргументы: user_id, group_id, flag (0 - отсоединиться, 1 - присоединиться)
# возвращает 1-  успех, 0 - ошибка
sub join_group {
    my ($user_id, $group_id, $flag) = @_;
    #
}

# поиск группы
# аргументы: keywords (поисковая фраза)
# возвращает ссылку на хэш
sub search_group {
    my $keyword = shift;
    #
}

# показывает информацию о группе детально
# аргумент: group_id
# возвращает ссылку на хэш
sub show_group_details {
    my $group_id = shift;
    #
}

# показать лучшие фильмы о мнению группы
# аргумент: group_id
# возвращает ссылку на хэш
sub show_top_movie_group {
    my $group_id = shift;
    #
}

# предожить лучший фильм
# аргументы: user_id,group_id, movie_id
# возвращает 1-  успех, 0 - ошибка
sub offer_movie_to_top {
    my ($user_id, $group_id, $movie_id) = @_;
    #
}

# показать трэд группы (комментарии в группе)
# вопрос о многостраничности или архиве(?)
# аргументы group_id, page_id (для многостраничности)
# возвращает ссылку на хэш (хэш хэшей или smth) 
sub show_group_comments {
    my ($group_id, $page_id) = @_;
    #
}

# голосовать за ролик (за и против в одной функции)
# аргументы: user_id, movie_id, group_id, vote ([1] - за, [-1] - против)
# возвращает рейтинг с учетом голоса если удачно или 0 - если неудачна операция
sub vote_group_movie {
    my ($user_id, $group_id, $movie_id, $vote) = @_;
    #
}

# ответить в трэд группы
# аргументы: user_id, group_id, текст_сообщения
# возвращает 1-  успех, 0 - ошибка
sub add_group_comment {
    my ($user_id, $group_id, $message) = @_;
    #
}

# добавить свой контент
# насчет аргументов.. пока такие: user_id, group_id, film_id
# возвращает 1-  успех, 0 - ошибка
sub add_group_content {
    my ($user_id, $group_id, $film_id) = @_;
    #
}

# показывает членовы группы.
# можно использовать для показа членов "онлайн", "офлайн", "всех"
# аргументы: group_id, status (0 - оффлайн,1 - онлайн,2 - все)
# возвращает ссылку на хэш (user_id => имя)
sub show_group_members {
    my ($group_id, $status) = @_;
    #
}

###
# О СЕБЕ

# показывает общую инфорамцию о пользователе
# аргументы: user_id
# возвращает ссылку на хэш
sub show_user_about {
    my $user_id = shift;
    #
}

# показать личные сообщения
# аргументы: user_id
# возвращает ссылку на хэш
sub show_user_messages {
    my $user_id = shift;
    #
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
}

# пересекается с show_user_playlist из STB.pm,
# но необходимо расширить функциями,
# то есть возвращает не только имя плейлиста, но и состав плейлиста
sub show_user_playlist {
    my $user_id = shift;
    #
}

# новый плейлист
# аргументы: user_id, playlist_name (название плейлиста)
# возвращает 1-  успех, 0 - ошибка
sub add_playlist {
    my ($user_id, $playlist_name) = @_;
    #
}

# добавить кино в плейлист
# аргументы: playlist_id, movie_id (при условии что плейлисты уникальны для БД)
# возвращает 1-  успех, 0 - ошибка
sub add_movie_playlist {
    my ($playlist_id, $movie_id) = @_;
    #
}

# удалить фильм из плейлиста
# аргументы: playlist_id, movie_id (при условии что плейлисты уникальны для БД)
# возвращает 1-  успех, 0 - ошибка
sub rm_movie_playlist {
    my ($playlist_id, $movie_id) = @_;
    #
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
}

# показыает краткую информацию о друге
# аргументы: user_id, friend_id
# user_id необходим для проверки прав на просмотр информации о пользователе
# возвращает ссылку на хэш
sub show_friend_short {
    my ($user_id, $friend_id) = @_;
}

# показывает детальную информаицю о друге (Подробно)
# аргументы: user_id, friend_id
# user_id необходим для проверки прав на просмотр информации о пользователе
# возвращает ссылку на хэш
sub show_friend_details {
    my ($user_id, $friend_id) = @_;
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
}

sub add_from_gmail {
    my $ident = shift;
    #
}

sub add_from_twitter {
    my $ident = shift;
    #    
}

sub add_from_vkontakte {
    my $ident = shift;
    #    
}

#####
## ОФИС


1;
