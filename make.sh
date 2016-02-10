#!/bin/bash


#Директория веб-сервера
web_serv_dir="/var/www/html/";


#Копирование нужных файлов в директорию веб-сервера
function __copyToWeSDir()
{
	cp -R ./php $web_serv_dir;
	cp -R ./html $web_serv_dir;
	cp -R ./css $web_serv_dir;
	cp -R ./res $web_serv_dir;
	cp -R ./conf $web_serv_dir;
	cp -R ./sql $web_serv_dir;
	
	chmod 777 -R $web_serv_dir*;
}


#Удаляем все из директории веб-сервера
function __clearWSDir()
{
	rm -rf $web_serv_dir*;
}


#Удаляем сервисные файлы из директории веб-сервера
function __deleteServiceFilesFromWSDir()
{
	cd $web_serv_dir;
	find -name "*.make" -exec rm -rf {} +;
	find -name "*.run" -exec rm -rf {} +;
	find -name "*.commit" -exec rm -rf {} +;
}


__clearWSDir;
__copyToWeSDir;
__deleteServiceFilesFromWSDir;
