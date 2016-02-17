<?php
	#Класс-представление таблицы article
	
	class MyArticle
	{
		private $s_tablename = "article";
		
		private $n_article_id = null;
		private $s_article_title = null;
		private $s_article_text = null;
		
		
		#Геттеры
		public function getArticleID() { return $this->n_article_id; }
		public function getArticleTitle() { return $this->s_article_title; }
		public function getArticleText() { return $this->s_article_text; }
		
		
		#Сеттеры
		public function setArticleID( $n_article_id ) { $this->n_article_id = $n_article_id; }
		public function setArticleTitle( $s_article_title ) { $this->s_article_title = $s_article_title; }
		public function setArticleText( $s_article_text ) { $this->s_article_text = $s_article_text; }
		
		
		#Получить статью по id
		public function getArticleByID( $n_article_id )
		{
			$ma_res = null;
			
			/* ... */
			
			return $ma_res;
		}
	}
?>
