################################################################
# ЗАГЛУШКИ И ВРЕМЕННЫЕ ФУНКЦИИ
################################################################
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
       return [7500.5];
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