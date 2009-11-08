################################################################
# ЗАГЛУШКИ И ВРЕМЕННЫЕ ФУНКЦИИ 2
################################################################
#
sub _get_from_db_menu_objects {
    return qq(
    <a href="?mode=content&user_id=100" target="_self">Мой контент</a></br>
    <a href="?mode=videoCatalog&user_id=100" target="_self">Видео каталог</a></br>
    <a href="?mode=friends&user_id=100" target="_self">Друзья</a></br>
    <a href="?mode=photo&user_id=100" target="_self">Фото</a></br>
    <a href="?mode=music&user_id=100" target="_self">Музыка</a></br>
    <a href="?mode=internet&user_id=100" target="_self">Интернет</a></br>
    <a href="?mode=settings&user_id=100" target="_self">Настройки</a></br>
    );
}

1;