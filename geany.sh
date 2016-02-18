#!/bin/bash


#Создать файл - список java файлов, которые необходимо собрать ( файл ./tmp/make_list )
function __makeBuildListFile()
{
	find * -type f -iname *.php | while read phpfile; do
		file_summ=$( md5sum $phpfile );
		
		if grep -q $file_summ ./tmp/correct_summ; then
			:
		else
			echo $phpfile >> src_files;
		fi
	done
}


#Перерасчет хеш сумм всех файлов
function __refreshSumms()
{
	cat /dev/null > ./tmp/correct_summ;
	
	find * -type f -iname *.php | while read phpfile; do
		echo $( md5sum $phpfile ) >> ./tmp/correct_summ;
	done
}


#main
function __make()
{
	__makeBuildListFile;
	result=0;
	
	if [ -f src_files ]; then
		while read line; do
			php -q -l $line;
			err_code=$?;
			if [ $err_code -ne 0 ]; then
				result=$err_code;
			fi
		done < src_files
	fi
	
	if [ $result -ne 0 ]; then
		:;
	else
		__refreshSumms;
	fi
	
	rm -f ./src_files;
}


#Перестраиваем проджект ( пересоздаем ссылки на скрипт запуска )
function __project
{
	cat /dev/null > ./tmp/correct_summ;
	script_path=$( realpath geany.sh );
	
	cd php;
	ln -f -s $script_path;
	
	find * -type d | while read j; do
		copy_dir=`pwd`"/"$j;
		ln -f -s $script_path $copy_dir;
	done

	cd ..;
}


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
function __run
{
	#Запускаем xterm с выхлопом текущих логов
	cur_log_path="./log/"$( date +%Y )"/"$( date +%m )"_"$( date +%b )"/"$( date +%d )".log";
	$( xterm -sb -T "php errors" -fa 'Terminus' -fs 10 -e "grc tail -n 0 -f $cur_log_path" ) &
	xterm_pid=$?;
	
	#Меняем заголовок текущего терминала
	NAME="php out"; 
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


#commit
function __commit
{
	id_string=$( date +%Y%m%d%k%M%S );
	
	git pull;
	git add . ;
	git status ;
	
	read commit_text;
	
	commit_text="$id_string $commit_text";
	echo $commit_text;
	
	git commit -m "$commit_text";
	git push;
}


function __main
{
	#переходим к реальному объекту
	cd $( dirname $( realpath geany.sh ) );
	
	#Определяем цель вызова
	if [ $1 = "project" ]; then
		__project;
	elif [ $1 = "make" ]; then
		__make;
	elif [ $1 = "run" ]; then
		__run;
	elif [ $1 = "commit" ]; then
		__commit;
	fi
}


__main $1;
