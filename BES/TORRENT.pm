package BES::TORRENT;                                                                                                                                                    
use strict;                                                                                                                                                           
use warnings;            



our $VERSION = 0.1; 



## 10 digits name generation sub
sub genNew  {
	my $digits = 10;
	my @pass_chars = ("!",".","-","_","(",")","'",",","?","@","^","A".."H", "J".."Z", "a".."h", "m".."z", 2..9);
	srand();
	my $Name = "";
	$Name = join("", @pass_chars[map {rand @pass_chars}(1..$digits)]);
	return $Name;
}
######################################################################################################

# Метод создает torrent-файл                                                                                                                         
# возвращает 1 если удача, и 0 если ошибка                                                                                                                                 
sub createTorrentFile ($$) {
    # $OutputName - имя torrent-файла, рекомендую сделать его равным ID-медиаобъекта
    # $InputName - имя папки где леждит сам объект
    # $comment - комментарии к торрент файлу, возможно служебные (например дата и время создания) --comment $comment
    my $InputName = $_[0];
    my $OutputName = $_[1].".torrent";
    my $tempName = genNew();
    my $result= `createtorrent --announce http://193.164.132.203 --port 6969  /var/bt/downloads/$InputName /tmp/$tempName`;
    $result =~ s/\n//g;
	if ($result =~/adding/) {
		 my $result_mv = rename("/tmp/$tempName", "/var/bt/torrent/$OutputName");
			if ($result_mv == 1) {
				return 1;
			} else {
				return 0;
			}
			
    } else {
	return 0;
    }
}
######################################################################################################

# метод удаляет torrent-файл из папки
# тем самым прекращает раздачу
# возвращает 1 если удача, и 0 если ошибка
sub deleteTorrentFile ($){ 
    my $fileToDel = $_[0];
    my $do = unlink("/var/bt/torrent/$fileToDel"); 
    if ($do =="1") {
	return 1;
    } else {
	return 0;
    }
}
######################################################################################################
# for test only
#my $e = createTorrentFile("DB","123.torrent");
#my $e = deleteTorrentFile("123.torrent");
#print $e; 