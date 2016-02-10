-- Скрипт инициализации БД

DROP DATABASE IF EXISTS phpslut;
CREATE DATABASE phpslut;

USE phpslut;

CREATE TABLE article
(
	article_id INT PRIMARY KEY AUTO_INCREMENT,
	article_title VARCHAR( 1000 ),
	article_text VARCHAR( 10000 )
);
