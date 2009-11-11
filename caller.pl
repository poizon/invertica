#!/usr/bin/perl -w
#
$|=1;

use strict;

use lib qw(.);
use API::STB qw (:FILM :LK);
use CGI qw(header param);

print header(-charset => 'utf8');
print qq(<title>Интерфейс  STB</title>);
my $mode = param('mode') || 'error';
my $id = param('id') || 0;

my %hash = ( 'showMovieTitles'   => \&show_movie_titles,
             'showMovieTags'     => \&show_movie_tags,
             'showMovieComments' => \&show_movie_comments,
             'showMovieStatus'   => \&show_movie_status,
             'showUserBalance'   => \&show_user_balance,
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
             'showUserWatched' => \&show_user_watched,
             'showMovieFriends' => \&show_movie_friends,
             'showUserTags' => \&show_user_tags,
             'orderMovie' => \&order_movie,
             'editMovieTags' => \&edit_movie_tags,
             'showUserLib' => \&show_user_lib,
             'showFileDetails' => \&show_file_details,
             'addFileComment' => \&add_file_comment,
             'shareFileFriends' => \&share_file_friends,
             'showGroupList' => \&show_group_list,
             'joinGroup' => \&join_group,
             'searchGroup' => \&search_group,
             'showGroupDetails' => \&show_group_details,
             'showTopMovieGroup' => \&show_top_movie_group,
             'offerMovieToTop' => \&offer_movie_to_top,
             'showGroupComments' => \&show_group_comments,
             'voteGroupMovie' => \&vote_group_movie,
             'addGroupComment' => \&add_group_comment,
             'addGroupContent' => \&add_group_content,
             'showGroupMembers' => \&show_group_members,
             'showUserAbout' => \&show_user_about,
             'showUserMessages' => \&show_user_messages,
             'showUserGroup' => \&show_user_group,
             'showUserPlaylist' => \&show_user_playlist,
             'addPlaylist' => \&add_playlist,
             'addMoviePlaylist' => \&add_movie_playlist,
             'rmMoviePlaylist' => \&rm_movie_playlist,
             'configVisibility' => \&config_visibility,
             'showUserFriends' => \&show_user_friends,
             'showFriendShort' => \&show_friend_short,
             'showFriendDetails' => \&show_friend_details,
             'inviteFriends' => \&invite_friends,
             'searchVidimax' => \&search_vidimax,
             'addFromFacebook' => \&add_from_facebook,
             'addFromGmail' => \&add_from_gmail,
             'addFromTwitter' => \&add_from_twitter,
             'addFromVkontakte' => \&add_from_vkontakte,
             'changePassword' => \&change_password,
             'showUserProfiles' => \&show_user_profiles,
             'showWatchedStatistic' => \&show_watched_statistic,
             'addProfile' => \&add_profile,
             'rmProfile' => \&rm_profile,
             'saveProfileChanges' => \&save_profile_changes,
             'showPaidStatistic' => \&show_paid_statistic,
             'showUserBalance' => \&show_user_balance,
             'payYandex' => \&pay_yandex,
             'payRapid' => \&pay_rapid,
             'addTopBox' => \&add_top_box,
             'rmTopBox' => \&rm_top_box,
             'changeTopBox' => \&change_top_box,
             'requestSupport' => \&request_support,
             'showKb' => \&show_kb,
            );

if(!param) {
    print $hash{error}->($id);
} else {
    print $hash{$mode}->($id);
}

#
# переписать с шаблоном
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
    
    <tr> 
    <td colspan="2"><h2 align="center">Личный кабинет</h2></td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserWatched&id=100" target="_self">я смотрел</a></td>
    <td>Показать что смотрел пользователь. аргументы: user_id, page_num (default =1)
    где page_num - номер страницы для листинга
    возвращает ссылку на хэш (пример):
    обложка => url, Название => Терминатор,
    В плейлистах_моих_друзей => \%hashref</td>
  </tr>
  <tr> 
    <td><a href="?mode=showMovieFriends&id=100" target="_self">Получить совпадения с плейлистами
 друзей по фильму.</a></td>
    <td> Функция используется для вызова внутри show_user_watched
        аргументы: user_id, movie_id</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserTags&id=100" target="_self">Показать все тэги польователя</a></td>
    <td>аргументы: user_id, возвращает ссылку на массив</td>
  </tr>
  <tr> 
    <td><a href="?mode=orderMovie&id=100" target="_self">Заказать фильм</a></td>
    <td> аргументы: user_id, movie_id
 возвращает 0 - ошибка, 1 - успех
 в процессе заказа - проверяем баланс пользователя и стоимость фильма
 стоимость фильма в БД(?), баланс через ЛБ</td>
  </tr>
  <tr> 
    <td><a href="?mode=editMovieTags&id=100" target="_self">редактировать тэги</a></td>
    <td> аргументы movie_id, user_id, tags (ссылка на массив). возвращает 0 - ошибка, 1 - успех</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserLib&id=100" target="_self">показывает файлы на приставке пользователя</a></td>
    <td>аргументы: user_id, возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=showFileDetails&id=100" target="_self">показывает информацию о файле детально
    <td> аргументы: file_id,
 возвращает сылку на хэш</a></td>
</td>
  </tr>
  <tr> 
    <td><a href="?mode=addFileComment&id=100" target="_self">добавить отзыв к файлу.</a></td>
    <td>Возможно пересечение с STB::add_movie_comment
 все зависит от структуры БД
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=shareFileFriends&id=100" target="_self"> открыть доступ друзьям</a></td>
    <td> аргументы user_id, film_id
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showGroupList&id=100" target="_self">показыает список групп.</a></td>
    <td>аргументы - user_id - для идентификации групп в которых уже участвует пользователь
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=joinGroup&id=100" target="_self">присоединиться к группе/отсоединиться от группы</a></td>
    <td>аргументы: user_id, group_id, flag (0 - отсоединиться, 1 - присоединиться)
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=searchGroup&id=100" target="_self">поиск группы</a></td>
    <td>аргументы: keywords (поисковая фраза)
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=showGroupDetails&id=100" target="_self">показывает информацию о группе детально</a></td>
    <td>аргумент: group_id
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=showTopMovieGroup&id=100" target="_self">показать лучшие фильмы о мнению группы</a></td>
    <td>аргумент: group_id
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=offerMovieToTop&id=100" target="_self">предожить лучший фильм</a></td>
    <td>аргументы: user_id,group_id, movie_id
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showGroupComments&id=100" target="_self">показать трэд группы (комментарии в группе)</a></td>
    <td>вопрос о многостраничности или архиве(?)
 аргументы group_id, page_id (для многостраничности)
 возвращает ссылку на хэш (хэш хэшей или smth) </td>
  </tr>
  <tr> 
    <td><a href="?mode=voteGroupMovie&id=100" target="_self">голосовать за ролик (за и против в одной функции)</a></td>
    <td>аргументы: user_id, movie_id, group_id, vote ([1] - за, [-1] - против)
 возвращает рейтинг с учетом голоса если удачно или 0 - если неудачна операция</td>
  </tr>
  <tr> 
    <td><a href="?mode=addGroupComment&id=100" target="_self">ответить в трэд группы</a></td>
    <td>аргументы: user_id, group_id, текст_сообщения
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=addGroupContent&id=100" target="_self">добавить свой контент</a></td>
    <td>насчет аргументов.. пока такие: user_id, group_id, film_id
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showGroupMembers&id=100" target="_self">показывает членов группы.</a></td>
    <td>можно использовать для показа членов "онлайн", "офлайн", "всех"
 аргументы: group_id, status (0 - оффлайн,1 - онлайн,2 - все)
 возвращает ссылку на хэш (user_id => имя)</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserAbout&id=100" target="_self">показывает общую инфорамцию о пользователе</a></td>
    <td>аргументы: user_id
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserMessages&id=100" target="_self">показать личные сообщения</a></td>
    <td>аргументы: user_id
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserGroup&id=100" target="_self">показать группы пользователя/все группы,</a></td>
    <td> в том числе в которых он состоит и созданные им лично.
 А также вывести флаг о новых сообщениях в группах
 аргументы: user_id, flag (если 0 - все группы, если 1 - группы пользователя)
 возвращает хэш, который будет иметь флаги для идентификации группы:
 group_flag:
 1 - состоит в группе, 0 - моя группа,
 message_flag:
 0 - нет новостей, 1 - есть новости</td>
  </tr>
  <!-- <tr> 
    <td><a href="?mode=showUserPlaylist&id=100" target="_self">Название</a></td>
    <td>Описание</td>
  </tr> -->
  <tr> 
    <td><a href="?mode=addPlaylist&id=100" target="_self">новый плейлист</a></td>
    <td>аргументы: user_id, playlist_name (название плейлиста)
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=addMoviePlaylist&id=100" target="_self">добавить кино в плейлист</a></td>
    <td>аргументы: playlist_id, movie_id (при условии что плейлисты уникальны для БД)
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=rmMoviePlaylist&id=100" target="_self">удалить фильм из плейлиста</a></td>
    <td>аргументы: playlist_id, movie_id (при условии что плейлисты уникальны для БД)
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=configVisibility&id=100" target="_self">настройка видимости</a></td>
    <td>аргументы: user_id,\%hash, где хэш имеет примерно ткую структуру:
 \$hash{показывать историю моих просмотров} => 1|0
 \$hash{показывать историю просмотров категории XXX} => 1|0
 \$hash{показывать информацию обо мне} => 1|0
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserFriends&id=100" target="_self">выводит список друзей/всех</a></td>
    <td>аргументы: user_id, flag (0 - друзья, 1 - все)
 возвращает ссылку на хэш, в хэше присутствует атрибут
 идентифицирующий общих друзей</td>
  </tr>
  <tr> 
    <td><a href="?mode=showFriendShort&id=100" target="_self">показыает краткую информацию о друге</a></td>
    <td>аргументы: user_id, friend_id
 user_id необходим для проверки прав на просмотр информации о пользователе
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=showFriendDetails&id=100" target="_self">показывает детальную информаицю о друге</a></td>
    <td>аргументы: user_id, friend_id
 user_id необходим для проверки прав на просмотр информации о пользователе
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=inviteFriends&id=100" target="_self">по кнопке Стать другом</a></td>
    <td>аргументы: user_id, friend_id
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=searchVidimax&id=100" target="_self">искать в vidimax</a></td>
    <td>аргументы: фраза для поиска
 возвращает набор данных, возможно в виде ссылки на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=addFromFacebook&id=100" target="_self">Facebook. добавлять друзей из других систем.</a></td>
    <td>аргументы: ident (login, email ? в зависимости от системы)  возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=addFromGmail&id=100" target="_self">Gmail</a></td>
    <td>Описание</td>
  </tr>
  <tr> 
    <td><a href="?mode=addFromTwitter&id=100" target="_self">Twitter</a></td>
    <td>Описание</td>
  </tr>
  <tr> 
    <td><a href="?mode=addFromVkontakte&id=100" target="_self">vKontakte</a></td>
    <td>Описание</td>
  </tr>
  <tr> 
    <td><a href="?mode=changePassword&id=100" target="_self">изменить пароль</a></td>
    <td> аргументы: user_id, old_password, new_password
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showUserProfiles&id=100" target="_self">показать список профайлов</a></td>
    <td>аргуенты user_id
 возвращает ссылку на хэш, в котором
 содержится вся информация о всех профайлах пользователя</td>
  </tr>
  <tr> 
    <td><a href="?mode=showWatchedStatistic&id=100" target="_self">показывает статистику потребления по просмотрам
 за период</a></td>
    <td> аргументы: user_id, start_date, end_date
 возвращает ссылку на хэш</td>
  </tr>
  <tr> 
    <td><a href="?mode=addProfile&id=100" target="_self">добавить профайл</a></td>
    <td>аргументы: user_id, profile_name
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=rmProfile&id=100" target="_self">удалить профайл</a></td>
    <td>аргументы: user_id, profile_name
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=saveProfileChanges&id=100" target="_self">сохранить изменения в профайле</a></td>
    <td>аргументы: user_id, profile_name
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showPaidStatistic&id=100" target="_self">показывает статистику потребления по платежам
 за период</a></td>
    <td>аргументы: user_id, start_date, end_date
 возвращает ссылку на хэш</td>
  </tr>
<!--  <tr> 
    <td><a href="?mode=showUserBalance&id=100" target="_self">Название</a></td>
    <td>Описание</td>
   --></tr>
  <tr> 
    <td><a href="?mode=payYandex&id=100" target="_self">платеж с яндекса</a></td>
    <td>Описание</td>
  </tr>
  <tr> 
    <td><a href="?mode=payRapid&id=100" target="_self">платеж с рапиды</a></td>
    <td>Описание</td>
  </tr>
  <tr> 
    <td><a href="?mode=addTopBox&id=100" target="_self">добавить приставку</a></td>
    <td>аргументы: user_id, \%hash (входные данные)
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=rmTopBox&id=100" target="_self">удалить приставку</a></td>
    <td>аргументы: user_id, sn_topbox (?) - s/n приставки</td>
  </tr>
  <tr> 
    <td><a href="?mode=changeTopBox&id=100" target="_self">изменить параметры приставки</a></td>
    <td>аргументы: user_id, \%hash (входные данные)
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=requestSupport&id=100" target="_self">написать в тэх.поддержку</a></td>
    <td>аргументы: user_id, \%hash (входные данные)
 \$hash{subject} => ''; $hash{message}=>''
 возвращает 1-  успех, 0 - ошибка</td>
  </tr>
  <tr> 
    <td><a href="?mode=showKb&id=100" target="_self">отобразить данные из базы знаний, разделы, статьи</a></td>
    <td>аргументы: keywords (по умолчанию выводим все разделы)
 возвращаем ссылку на хэш, примерно такой:
 \$hash{section}=>[article1, article2, ... , articlen]</td>
  </tr>
    </table>
    
    );
}