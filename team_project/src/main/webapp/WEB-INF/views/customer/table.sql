
create sequence serbbs_seq
	increment by 1
	start with 1
	minvalue 1
	maxvalue 1000
	nocycle
	cache 1



create table serviceBBS(
	num number primary key,
	title VARCHAR2(100),
	content clob,
	writerid VARCHAR2(100),
	regdate DATE,
	bbstype number,
	ref number,
	secrete number
);