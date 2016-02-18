<?php
	require_once "MyTimeUtils.php";
	
	
	#Класс для записи сообщений об ошибках
	class MyLogWriter
	{
		#Запись сообщения в лог
		public function writeErr( $s_mess )
		{
			$mtu = new MyTimeUtils();
			$s_mess = $mtu->getCurDateTimeAsString() . "\t" . $s_mess . "\n"; 
			
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
