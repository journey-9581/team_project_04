
create sequence premium_seq;

CREATE TABLE premium(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100),
	caption VARCHAR2(100), 
	imagePath VARCHAR2(100), 
	content CLOB,
	viewCount NUMBER,
	imagePath VARCHAR2(100),
	regdate DATE
);

CREATE TABLE premium(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100),
	caption VARCHAR2(100), 
	content CLOB,
	regdate DATE

);

CREATE SEQUENCE board_place_seq;
CREATE TABLE board_place(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);

CREATE SEQUENCE board_food_seq;
CREATE TABLE board_food(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);

CREATE SEQUENCE board_secret_seq;
CREATE TABLE board_secret(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);

CREATE SEQUENCE board_lantour_seq;
CREATE TABLE board_lantour(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);

CREATE SEQUENCE board_month_seq;
CREATE TABLE board_month(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);




