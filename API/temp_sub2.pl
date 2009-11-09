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
##
# показываем контент
sub _get_from_db_content_objects {
    return qq(
         <a href="?mode=content&user_id=100&menu1=orders" target="_self">Заказы</a></br>
         <a href="?mode=content&user_id=100&menu1=videoLocal" target="_self">Видео Локальное</a></br>
         <a href="?mode=content&user_id=100&menu1=photoLocal" target="_self">Фото Локальное</a></br>
         <a href="?mode=content&user_id=100&menu1=myPlayLists" target="_self">Мои Плей Листы</a></br>
         <!-- формируем массив  по location -->
         <a href="?mode=content&user_id=100&menu1=location1" target="_self">Location 1</a></br>
         <a href="?mode=content&user_id=100&menu1=location2" target="_self">Location 2</a></br>
         <!-- end -->
         <a href="?mode=content&user_id=100&menu1=add_location" target="_self">Добавить Location</a></br>
         <a href="?mode=content&user_id=100&menu1=del_location" target="_self">Удалить Location</a></br>
         <a href="?mode=content&user_id=100&menu1=help" target="_self">Help</a></br>
    )
}
1;