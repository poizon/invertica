package API::STB;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status show_user_playlist
                    show_user_balance show_user_friends add_movie_rate
                    add_movie_comment add_movie_to_playlist add_movie_tag
                    add_movie_pay show_user_recomends
                    stb_error);
                    
our %EXPORT_TAGS = (ALL => [qw (show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status show_user_playlist
                    show_user_balance show_user_friends add_movie_rate
                    add_movie_comment add_movie_to_playlist add_movie_tag
                    add_movie_pay show_user_recomends
                    stb_error)]);                    

# модуль обрабатывающий интерфейс согласно стр. 8
# документа интерфейс STB.pdf
# так как данные возвращаем в формате JSON
use JSON;

#####################
# GLOBALS настройки
# объект для JSON
my $json=JSON->new();

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

################################################################
# ЗАГЛУШКИ И ВРЕМЕННЫЕ ФУНКЦИИ
################################################################

# заглушка для ошибки
sub stb_error {
    return qq(
    <hr width=100%>
    <a href="?mode=showMovieTitles&id=100" target="_self">Получить информацию о фильме</a><br>
    <a href="?mode=showMovieTags&id=100" target="_self">Получить список тэгов</a><br>
    <a href="?mode=showMovieComments&id=100" target="_self">Показать комментарии</a><br>
    <a href="?mode=showMovieStatus&id=100" target="_self">Показать статус</a><br>
    <hr width=100%>
    <a href="?mode=showUserPlaylist&id=100" target="_self">Показать плейлисты пользователя</a><br>
    <a href="?mode=showUserBalance&id=100" target="_self">Показать баланс пользователя</a><br>
    <a href="?mode=showUserFriends&id=100" target="_self">Показать список друзей пользователя</a><br>
    <a href="?mode=showUserRecomends&id=100" target="_self">Показать рекомендации</a><br>
    <hr width=100%>
    <a href="?mode=addMovieRate&id=100" target="_self">Изменить рейтинг</a><br>
    <a href="?mode=addMovieComment&id=100" target="_self">Добавить отзыв</a><br>
    <a href="?mode=addMovieToPlaylist&id=100" target="_self">Добавить фильм в плейлист</a><br>
    <a href="?mode=addMovieTag&id=100" target="_self">Добавить тэг</a><br>
    <a href="?mode=addMoviePay&id=100" target="_self">Оплатить</a><br>
    <!-- <a href="?mode=..." target="_self">...</a><br> -->
    );
}
#
###########
# заглушки

sub _get_from_db_recomends {
    return [100,101,167,800];    
}

sub _get_from_db_playlist {
    return {1001 => 'Мой плейлист', 1002 => 'Плейлист 2', 1003 => 'Посмотреть потом'};
}

sub _get_from_db_balance {
       my $id = shift;
       return 7500.5;
}

sub _get_from_db_friendlist {
    my $id = shift;
    return ['greeen', 'zerocool','wolf99','kukara4a'];
}
sub _do_something {
    # заглушка на все случаи жизни :)
    return [1];
}

sub _get_from_db_status {
    my $id = shift;
    return {1, 0.33, 90 }; # 1 - скачивается, 0.30 = 30% скачано, 90 - минут
}

#
sub _get_from_db_comments {
    my $id = shift;
    my %hash = ('ivanovIvan' => 'Фильм что надо!',
                'kurk'  =>'Фильм хороший!!! Исторический,а кто говорит,что фильм фуфло не уважает Россию и ее историю!',
                'sergo7' => 'Классный фильм,нет слов.');
    return \%hash;
}
#
sub _get_from_db_tags {
    my $id = shift;
    my @array = ('Фантастика', 'Боевики', 'Драма');
    return \@array;
}
#
sub _get_from_db_titles {
    my $id = shift;
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

1;
