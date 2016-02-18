#!/bin/bash

#Скрипт запуска проекта

#Создать каталог и файл для записи логов
function __makeLogDirAndFile
{
	#Создаем ( пересоздаем ) директорию для логов
	dirpath="./log/"$( date +%Y )"/"$( date +%m )"_"$( date +%b )"/";
	mkdir -p $dirpath;
	
	#Поверка наличия текущего файла логов
	dirpath="$dirpath$( date +%d ).log";
	if [ -f $dirpath ]; then
		:;
	else
		cat /dev/null > $dirpath;
	fi
}


#main
function main
{
	#Запускаем xterm с выхлопом текущих логов
	cur_log_path="./log/"$( date +%Y )"/"$( date +%m )"_"$( date +%b )"/"$( date +%d )".log";
	$( xterm -fa 'Terminus' -fs 10 -e "grc tail -n 0 -f $cur_log_path" ) &
	xterm_pid=$?;
	
	#Меняем заголовок текущего терминала
	NAME="$RANDOM$RANDOM"; 
	echo -en "\033]0;$NAME\a";
	winname=$NAME;
	
	#Возвращаем фокус в текущий терминал
	sleep 1s
	wmctrl -a "$winname";
	
	__makeLogDirAndFile;
	php ./php/main.php
	
	
	echo "";
	echo "";
	echo "-------------------";
	echo -n "Press ENTER for exit. "
	read
	kill $xterm_pid;
}


main;
