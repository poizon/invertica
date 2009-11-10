#!/usr/bin/perl -w
#
$|=1;

use strict;

use lib qw(.);
use API::STB qw (:FILM);
use CGI qw(header param);

print header(-charset => 'utf8');
print qq(<title>Интерфейс  STB</title>);
my $mode = param('mode') || 'error';
my $id = param('id') || 0;

my %hash = ( 'showMovieTitles'   => \&show_movie_titles,
             'showMovieTags'     => \&show_movie_tags,
             'showMovieComments' => \&show_movie_comments,
             'showMovieStatus'   => \&show_movie_status,
             'showUserPlaylist'  => \&show_user_playlist,
             'showUserBalance'   => \&show_user_balance,
             'showUserFriends'   => \&show_user_friends,
             'addMovieRate'      => \&add_movie_rate,
             'addMovieComment'   => \&add_movie_comment,
             'addMovieToPlaylist'=> \&add_movie_to_playlist,
             'addMovieTag'       => \&add_movie_tag,
             'addMoviePay'       => \&add_movie_pay,
             'showUserRecomends' => \&show_user_recomends,
             'addMovieFavor'     => \&add_movie_favor,
             'error'             => \&stb_error,
             #------------------------------------------
             # ЛИЧНЫЙ КАБИНЕТ ##########################
             
            );

if(!param) {
    print $hash{error}->($id);
} else {
    print $hash{$mode}->($id);
}

#
# заглушка для ошибки
sub stb_error {
    return qq(
    <hr width=100%>
    <h3>Все функции возвращают данные в формате JSON</h3>
    <table border=1>
    <tr>
    <td><a href="?mode=showMovieTitles&id=100" target="_self">Получить информацию о фильме</a></td>
    <td>- возвращает данные о фильме: жанр, название, название/год, режисер/актеры, ссылки на фото и трейлеры, рейтинг,
    стоимость, описание. Аргументы: movie_id.
    </td></tr>
    <tr>
    <td><a href="?mode=showMovieTags&id=100" target="_self">Получить список тэгов</a></td>
    <td> - возвращает список тегов для данного фильма. Аргументы: movie_id.s
    </td></tr>
    <tr>
    <td><a href="?mode=showMovieComments&id=100" target="_self">Показать комментарии</a></td>
    <td>- возвращает список авторов и комментариев (в виде хэша). Aргументы: movie_id.
    </td></tr>
    <tr>
    <td><a href="?mode=showMovieStatus&id=100" target="_self">Показать статус</a></td>
    <td> - возвращает код статуса (в очереди (0), скачивается(1), завершен(2), ошибка(3)),
    процент скачивания (99% = 0.99), и время до завершения (в минутах). Аргументы: movie_id.
    </td></tr>

    <tr>
    <td><a href="?mode=showUserPlaylist&id=100" target="_self">Показать плейлисты пользователя</a></td>
    <td> - показывает список плейлистов пользователя. Возвращает ссылку на хэш: playlistid => "Название плейлиста".
    Аргументы: user_id. 
    </td></tr>
    <tr>
    <td><a href="?mode=showUserBalance&id=100" target="_self">Показать баланс пользователя</a></td>
    <td> - показывает баланс пользователя в рублях округленный до 2-х знаков после запятой.
    Аргументы: user_id.
    </td></tr>
    <tr>
    <td><a href="?mode=showUserFriends&id=100" target="_self">Показать список друзей пользователя</a></td>
    <td> - возвращает ссылку на массив с именами друзей. Аргументы: user_id.
    </td></tr>
    <tr>
    <td><a href="?mode=showUserRecomends&id=100" target="_self">Показать рекомендации</a></td>
    <td> - возвращает ссылку на массив c id фильмов. Аргументы: user_id.
    </td></tr>
 
    <tr>
    <td><a href="?mode=addMovieRate&id=100" target="_self">Изменить рейтинг</a></td>
    <td> - возвращает измененный рейтинг. Аргументы: movie_id.
    </td></tr>
    <tr>
    <td><a href="?mode=addMovieFavor&id=100" target="_self">Пометить как понравилось</a></td>
    <td> - возвращает 1-  успех, 0 - ошибка. Аргументы: movie_id, user_id.
    </td></tr>
    
    <tr>
    <td><a href="?mode=addMovieComment&id=100" target="_self">Добавить отзыв</a></td>
    <td> - возвращает 1-  успех, 0 - ошибка.  Аргументы: movie_id.
    </td></tr>
    <tr>
    <td><a href="?mode=addMovieToPlaylist&id=100" target="_self">Добавить фильм в плейлист</a></td>
    <td> - возвращает 1-  успех, 0 - ошибка.  Аргументы: movie_id, playlist_id.
    </td></tr>
    <tr>
    <td><a href="?mode=addMovieTag&id=100" target="_self">Добавить тэг</a></td>
    <td> - возвращает 1-  успех, 0 - ошибка.  Аргументы: movie_id.
    </td></tr>
    <tr>
    <td><a href="?mode=addMoviePay&id=100" target="_self">Оплатить</a></td>
    <td> - возвращает 1-  успех, 0 - ошибка.  Аргументы: movie_id, user_id.
    </td></tr>
    </table>
    
    );
}