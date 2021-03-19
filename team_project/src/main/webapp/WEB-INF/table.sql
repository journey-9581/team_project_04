
/* by도영 review 게시판 1 place */
CREATE SEQUENCE board_place_seq;
CREATE TABLE board_place(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	imagePath VARCHAR2(100),
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);
/* by도영 review 게시판 2 food */
CREATE SEQUENCE board_food_seq;
CREATE TABLE board_food(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	imagePath VARCHAR2(100),
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);
/* by도영 review 게시판 3 secret */
CREATE SEQUENCE board_secret_seq;
CREATE TABLE board_secret(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	imagePath VARCHAR2(100),
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);
/* by도영 review 게시판 4 lantour */
CREATE SEQUENCE board_lantour_seq;
CREATE TABLE board_lantour(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	imagePath VARCHAR2(100),
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);
/* by도영 review 게시판 5 month */
CREATE SEQUENCE board_month_seq;
CREATE TABLE board_month(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	imagePath VARCHAR2(100),
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);


/* by도영 freeboard 자유게시판 테이블 */
CREATE SEQUENCE board_free_seq;
CREATE TABLE board_free(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	imagePath VARCHAR2(100),
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);
/* by도영 freeboard comment 자유게시판 댓글 테이블 */
CREATE SEQUENCE board_free_comment_seq;
CREATE TABLE board_free_comment(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100),
	content VARCHAR2(500),
	target_id VARCHAR2(100),
	ref_group NUMBER, 
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',
	regdate DATE
);

/* by도영 withboard 동행게시판 테이블 */
CREATE SEQUENCE board_with_seq;
CREATE TABLE board_with(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100) NOT NULL, 
	title VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	content CLOB, 
	viewCount NUMBER, 
	regdate DATE 
);
/* by도영 withboard comment 동행게시판 댓글 테이블 */
CREATE SEQUENCE board_with_comment_seq;
CREATE TABLE board_with_comment(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100),
	content VARCHAR2(500),
	target_id VARCHAR2(100),
	ref_group NUMBER, 
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',
	regdate DATE
);

/* by도영 gallery 갤러리 테이블 */
CREATE SEQUENCE board_gallery_seq;
CREATE TABLE board_gallery(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100),
	caption VARCHAR2(100), 
	imagePath VARCHAR2(100), 
	regdate DATE
);

/*
DROP TABLE 
DROP SEQUENCE 
*/