#!/bin/bash


#удаление временных файлов, переинициализация нужных файлов
function __clearAll()
{
	rm -f geany.make;
	rm -f geany.run;
	rm -f geany.commit;
	
	rm -f *.jar;
	#обнулить файл хеш-сумм
	cat /dev/null > ./tmp/correct_summ;
	
	rm -rf ./tmp/_build/*;
}


#Обходим все директории с ресурсами, и добавляем в них make run и commit файлы
function __createServiceFiles()
{
	echo "cd " `pwd` >> geany.make;
	echo "bash make.sh" >> geany.make;

	echo "cd " `pwd` >> geany.run;
	echo "bash run.sh" >> geany.run;
	
	echo "cd " `pwd` >> geany.commit;
	echo "lxterminal -e \"./commit.sh\"" >> geany.commit;
	
	cp geany.make ./php;
	cp geany.run ./php;
	cp geany.commit ./php;
	
	cd php;

	find * -type d | while read j; do
		copy_dir=`pwd`"/"$j;
		cp geany.make $copy_dir;
		cp geany.run $copy_dir;
		cp geany.commit $copy_dir;
	done

	cd ..;
}


__createServiceFiles;
__clearAll;
