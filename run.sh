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
	__makeLogDirAndFile;
	php ./php/main.php
}


main;
