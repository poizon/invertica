package API::STB;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(show_movie_titles show_movie_tags
                    show_movie_comments show_movie_status stb_error);

# модуль обрабатывающий интерфейс согласно стр. 8
# документа интерфейс STB.pdf
# так как данные возвращаем в формате JSON
use JSON;

#####################
# GLOBALS настройки
# объект для JSON
my $json=JSON->new();
#$json->property(utf8 => 1);

# функции получения данных о фильме
# все они получают параметр movie_id,
# возвращают различные данные

# показать основные данные о фильме:
# жанр, название, название/год, режисер/актеры, ссылки на фото и трейлеры, рейтинг
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
    # {"m_foto":"foto.jpg","m_director":"МакДжи/Кристиан Бейл, Антон Ельчин, Сэм Уортингтон",
    # "m_name":"Терминатор 4","m_trailers":"1.mpg,2.mpg,3.mpg",
    # "m_year":"Colambia Pic/2009","m_genre":"Боевик"}
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
# и возвращает код статуса (0-3), и процент скачивания (0%,0-99%,100%)
# процент в десятичном виде (0.99 = 99%)
sub show_movie_status {
    my $movie_id = shift;
    # запрос к бд на выборку данных по статусу фильма
    my $movie_status = _get_from_db_status($movie_id);
    my $json_text = $json->encode($movie_status);
    # возвращаем строку в формате JSON
    return $json_text;
}

# заглушка для ошибки
sub stb_error {
    return qq(
    <a href="?mode=showMovieTitles&id=100" target="_self">Получить информацию о фильме</a><br>
    <a href="?mode=showMovieTags&id=100" target="_self">Получить список тэгов</a><br>
    <a href="?mode=showMovieComments&id=100" target="_self">Показать комментарии</a><br>
    <!-- <a href="?mode=..." target="_self">...</a><br> -->
    );
}
#
###########
# заглушки
sub _get_from_db_status {
    my $id = shift;
    return {1, 0.33}; # 1 - скачивается, 0.30 = 30% скачано
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
                );
    return \%hash;
}

1;
