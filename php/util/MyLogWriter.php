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
			
			$s_log_path = $this->mkLogDir();
			$file = fopen( $s_log_path, "a" );
			fwrite( $file, $s_mess );
			fclose( $file );
		}
		
		
		#Создать каталог для текущей сессии логов
		#Получить путь до лог-файла
		private function mkLogDir()
		{
			$s_dirpath = "log/" . date( "Y" ) . "/" . date( "m" ) . "_" . date( "M" );
			
			if( !file_exists( $s_dirpath ) )
			{
				mkdir( $s_dirpath, 0777, true );
			}
			
			$s_dirpath .= "/" . date( "d" ) . ".log";
			return $s_dirpath;
		}
	}
?>
