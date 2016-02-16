<?php
	#Скрипт для задания начальных данных в БД
	
	$S_DB_NAME = "phpslut";
	$S_DB_HOST = "localhost";
	$S_DB_USER = "root";
	$S_DB_PASS = "123456";
	
	$N_ARTICLE_ENTRIES = 10; #Кол-во статей в таблице article
	
	
	#Очистить все таблицы БД
	function cleanDB()
	{
		global $S_DB_HOST, $S_DB_USER, $S_DB_PASS, $S_DB_NAME;
		$bd_link = mysqli_connect( $S_DB_HOST, $S_DB_USER, $S_DB_PASS, $S_DB_NAME );
		
		$s_sql = "TRUNCATE TABLE article;";
		$result = mysqli_query( $bd_link, $s_sql );
		
		mysqli_close( $bd_link );
	}
	
	
	#Получить строку рандомных символов длинной n_strlength
	function getRandomString( $n_strlength )
	{
		$s_res = "";
		$s_en_alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		
		for( $i = 0; $i < $n_strlength; $i++ )
		{
			$n_rand = rand( 0, strlen( $s_en_alpha ) - 1 );
			$s_res .= $s_en_alpha[ $n_rand ];
		}
		
		return $s_res;
	}
	
	
	#Заполняем таблицу статей ( article )
	function fillArticleTable()
	{
		global $S_DB_HOST, $S_DB_USER, $S_DB_PASS, $S_DB_NAME, $N_ARTICLE_ENTRIES;
		$bd_link = mysqli_connect( $S_DB_HOST, $S_DB_USER, $S_DB_PASS, $S_DB_NAME );
		
		for( $i = 0; $i < $N_ARTICLE_ENTRIES; $i++ )
		{
			$s_artitle = getRandomString( 5 );
			$s_artext = getRandomString( 20 );
			$s_sql = "INSERT INTO article ( article_title, article_text ) VALUES ( '" . $s_artitle . "', '" . $s_artext . "' );";
			
			$result = mysqli_query( $bd_link, $s_sql );
			#mysqli_free_result( $_result );
		}
		
		
		mysqli_close( $bd_link );
	}
	
	
	function main()
	{
		cleanDB();
		fillArticleTable();
	}
	
	
	main();
?>
