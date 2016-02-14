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


#Чистим за собой мусор
function __clearAll()
{
	rm -f ./src_files;
}


#main
function __main()
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
	
	__clearAll;
}


__main;
