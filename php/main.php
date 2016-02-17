<?php
	ini_set( "display_errors", 0 );
	error_reporting( E_ALL );
	set_error_handler( "myErr" );
	
	require_once __DIR__ . "/util/MyLogWriter.php";
	
	
	/* Здесь можно писать код */
	
	
	echo "Hello world!";
	
	
	/* Тут больше нельзя! */
	
	
	
	#Функция обработчик ошибок
	function myErr( $errno, $errmsg, $file, $line ) 
	{
		$s_errmess = $errno . "\t" . $errmsg . "\t" . $file . "\t" . $line;
		$mlw = new MyLogWriter();
		$mlw->writeErr( $s_errmess );
	}
?>
