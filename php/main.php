<?php
	ini_set( "display_errors", 1 );
	error_reporting( E_ALL );
	set_error_handler( "myErr" );
	
	require_once __DIR__ . "/util/MyLogWriter.php";
	
	
	/* ... */
	
	
	echo "Hello world!";
	
	echo $perem;
	$bd_link = mysqli_connect( "", "", "", "" );
	
	/* ... */
	
	
	
	#Функция - обработчик ошибок
	function myErr( $errno, $errmsg, $file, $line ) 
	{
		$s_errmess = $errno . "  " . $errmsg . "  " . $file . "  " . $line;
		$mlw = new MyLogWriter();
		$mlw->writeErr( $s_errmess );
	}
?>
