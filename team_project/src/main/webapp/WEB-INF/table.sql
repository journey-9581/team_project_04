
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