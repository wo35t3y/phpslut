-- Скрипт инициализации БД


CREATE TABLE article
(
	article_id INT AUTOINCREMENT,
	article_title VARCHAR( 1000 ),
	article_text VARCHAR( 10000 )
);
