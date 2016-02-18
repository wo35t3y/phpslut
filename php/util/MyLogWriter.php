<?php
	require_once "MyTimeUtils.php";
	
	
	#Класс для записи сообщений об ошибках
	class MyLogWriter
	{
		#Запись сообщения в лог
		public function writeErr( $s_mess )
		{
			$s_mess = date("H:i:s") . "  " . $s_mess . "\n --------------- \n"; 
			
			$s_log_path = $this->getCurrentLogPath();
			$file = fopen( $s_log_path, "a" );
			fwrite( $file, $s_mess );
			fclose( $file );
		}
		
		
		#Получить путь до текущего лог-файла
		private function getCurrentLogPath()
		{
			$s_dirpath = 
				"log/" . 
				date( "Y" ) . "/" . 
				date( "m" ) . "_" . 
				date( "M" ) . "/" . 
				date( "d" ) . ".log";
			
			return $s_dirpath;
		}
	}
?>
