<?php
	require_once __DIR__ . "/util/MyLogWriter.php";
	
	$mlw = new MyLogWriter();
	$mlw->writeErr( "hello!" );
?>
