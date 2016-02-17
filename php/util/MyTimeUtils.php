<?php
	#Утилитарный класс для работы с временем
	class MyTimeUtils
	{
		#Получить текущее время как строку
		public function getCurDateTimeAsString()
		{
			$s_res = date("d-m-Y H:i:s");
			return $s_res;
		}
	}
?>
