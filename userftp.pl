#!/usr/bin/perl -w
$|=1;
use strict;
use warnings;
use CGI::Simple;
use Net::FTP;

my $q = CGI::Simple->new();
my %in = $q->Vars();
my $output = qq();

if($in{server} && $in{login} && $in{pass}) {
if($in{file}) {
    print $q->redirect(-charset => 'utf-8', -uri => "http://localhost/tv/rh.pl?act=offline&file=$in{file}&server=$in{server}&login=$in{login}&passwd=$in{pass}");
    #print qq(<h2>Файл к закачке: $in{file}</h2>);
    exit 0;
}
my $ftp = Net::FTP->new($in{server}) or $output.=qq(<h2>Cannot connect to $in{server}: $@</h2>);
# логин
$ftp->login($in{login},$in{pass}) or $output.=qq(<h2>Cannot login:). $ftp->message().qq(</h2>);
if($in{dir}) {# если передана папка, то переходим в нее
$ftp->cwd($in{dir}) or $output.=qq(<h2>Cannot change working directory on $in{dir}:). $ftp->message() .qq(</h2>);
} else {
    $in{dir} = ".";
}
my @files=$ftp->ls();
$output.=qq(<h1><a href ="?server=$in{server}&login=$in{login}&pass=$in{pass}&dir=$in{dir}">$in{dir}</a></h1>);
$output.=qq(<form name="upload" method="get">
    <input type="hidden" name="server" value="$in{server}">
    <input type="hidden" name="login" value="$in{login}">
    <input type="hidden" name="pass" value="$in{pass}">
);
foreach my $file(@files) {
    if($file=~/\.\S{3,}$/g) {
        $ftp->binary;
    my $size = $ftp->size($file);
    $output.=qq(<input type="radio" name="file" value="$in{dir}/$file|$size">$file<br>);
    } else {
    $output.=qq(<a href="?server=$in{server}&login=$in{login}&pass=$in{pass}&dir=$in{dir}/$file" target="_self">$file</a><br>);
    }
}
$output.=qq(<input type="submit" value="загрузить"></form>);
$ftp->quit;
}
#else {
#    $output = qq(
#    <body>
#    <form name="ftp" method="post">
#        Сервер: <input type="text" name="server"><br>
#        Пользователь: <input type="text" name="login"><br>
#        Пароль: <input type="password" name="pass"><br>
#        <input type="submit" name="submit" value="check">
#    </form>      
#</body>
#    );
#}

print $q->header(-charset => 'utf-8');
print $output;


