#!/bin/bash


#Проверка всех php файлов на ошибки
function __checkAllPhpFiles
{
	find * -type f -iname *.php | while read phpfile; do
		php -l $phpfile;
	done
}


#main
function __main
{
	__checkAllPhpFiles;
}


__main;
