package API::STB;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status show_user_playlist
                    show_user_balance show_user_friends add_movie_rate
                    add_movie_comment add_movie_to_playlist add_movie_tag
                    add_movie_pay show_user_recomends add_movie_favor
                    show_menu show_content
                    );
                    
                    
our %EXPORT_TAGS = (FILM => [qw (show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status show_user_playlist
                    show_user_balance show_user_friends add_movie_rate
                    add_movie_comment add_movie_to_playlist add_movie_tag
                    add_movie_pay show_user_recomends add_movie_favor
                    )],
                    MENU => [qw(show_menu show_content)]
                    );                    

# модуль обрабатывающий интерфейс согласно стр. 8
# документа интерфейс STB.pdf
# так как данные возвращаем в формате JSON
use JSON;

#####################
# GLOBALS настройки
# объект для JSON
my $json=JSON->new();

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
# !!!! ПЕРЕНЕСТИ В PersoanlArea.pm!
sub show_user_playlist {
    my $user_id = shift;
    my $user_playlist = _get_from_db_playlist($user_id);
    my $json_text = $json->encode($user_playlist);
    # возвращаем строку в формате JSON
    return $json_text;
}

# показывает баланс пользователя в рублях
# округленный до 2-х знаков после запятой
sub show_user_balance {
    my $user_id = shift;
    my $user_balance = _get_from_db_balance($user_id);
    my $json_text = $json->encode($user_balance);
    # возвращаем строку в формате JSON
    return $json_text;
}
# по кнопке предложить другу  выводит список друзей
# возвращает ссылку на массив с именами друзей
sub show_user_friends {
    my $user_id = shift;
    my $user_friend_list = _get_from_db_friendlist($user_id);
    my $json_text = $json->encode($user_friend_list);
    # возвращаем строку в формате JSON
    return $json_text;
}

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

##################################################
################# MENU ###########################
# данные функции реализованы для демонстрации
# работы с меню в STB
##################################################
# отображаем меню пользователя
# возвращает список объектов меню в виде html
sub show_menu {
    my $in = shift;
    return _get_from_db_menu_objects();
}

sub show_content {
    my $in = shift;
    return _get_from_db_content_objects();
}

1;
