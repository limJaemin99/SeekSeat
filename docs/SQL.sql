/* Drop Tables */

DROP TABLE QnA CASCADE CONSTRAINTS;
DROP TABLE AdminInfo CASCADE CONSTRAINTS;
DROP TABLE AfterVisit CASCADE CONSTRAINTS;
DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Community CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE Reservation CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Menu CASCADE CONSTRAINTS;
DROP TABLE StoreTable CASCADE CONSTRAINTS;
DROP TABLE StoreInfo CASCADE CONSTRAINTS;
DROP TABLE Owner CASCADE CONSTRAINTS;
DROP TABLE Favorite CASCADE CONSTRAINTS;



/* Create Tables */

CREATE TABLE AdminInfo
(
   id varchar2(30) NOT NULL,
   pw varchar2(64) NOT NULL,
   member_type number(1) DEFAULT 3 NOT NULL,
   PRIMARY KEY (id)
);


CREATE TABLE Community
(
   writeNo number NOT NULL,
   id varchar2(30) NOT NULL,
   title varchar2(50) NOT NULL,
   content varchar2(500) NOT NULL,
   createdDate date DEFAULT sysdate NOT NULL,
   PRIMARY KEY (writeNo)
);


CREATE TABLE Customer
(
   id varchar2(30) NOT NULL,
   pw varchar2(64) NOT NULL,
   name varchar2(30) NOT NULL,
   member_type number(1) DEFAULT 1 NOT NULL,
   tel varchar2(13) NOT NULL UNIQUE,
   email varchar2(30) NOT NULL UNIQUE,
   address varchar2(200) NOT NULL,
   PRIMARY KEY (id)
);


CREATE TABLE Menu
(
   menu_name varchar2(30) NOT NULL,
   price number NOT NULL,
   content varchar2(100) NOT NULL,
   best varchar2(4000),
   store_id varchar2(30) NOT NULL,
   menuPictureUrl varchar2(4000)
);


CREATE TABLE Owner
(
   id varchar2(30) NOT NULL,
   pw varchar2(64) NOT NULL,
   name varchar2(30) NOT NULL,
   member_type number(1) DEFAULT 2 NOT NULL,
   tel varchar2(13) NOT NULL UNIQUE,
   email varchar2(30) NOT NULL UNIQUE,
   PRIMARY KEY (id)
);


CREATE TABLE QnA
(
   writeNo number NOT NULL,
   user_id varchar2(30),
   owner_id varchar2(30),
   admin_id varchar2(30),
   title varchar2(50),
   content varchar2(500),
   answer varchar2(500),
   createdDate date,
   answerDate date,
   status number(1) DEFAULT 0,
   PRIMARY KEY (writeNo)
);


CREATE TABLE Reply
(
   replyNo NUMBER PRIMARY KEY,
   writeNo number NOT NULL,
   user_id varchar2(30) NOT NULL,
   reply varchar2(500) NOT NULL,
   createdDate date DEFAULT sysdate,
   CONSTRAINT fk_writeNo foreign key(writeNo) references community (writeNo)
);


CREATE TABLE Reservation
(
	reserveNo varchar2(100) NOT NULL,
	store_id varchar2(30) NOT NULL,
	user_id varchar2(30) NOT NULL,
	tableNo varchar2(10) NOT NULL,
	headCount number(2,0) NOT NULL,
	reserveDate varchar2(30) NOT NULL,
	PRIMARY KEY (reserveNo)
);


CREATE TABLE Review
(
   reviewNo NUMBER PRIMARY KEY,
   reserveNo varchar2(100) NOT NULL,
   id varchar2(30) NOT NULL,
   store_id varchar2(30) NOT NULL,
   rating number(1) DEFAULT 0 NOT NULL,
   content varchar2(500) NOT NULL,
   reviewPictureUrl varchar2(4000),
   createdDate date DEFAULT sysdate NOT NULL,
   CONSTRAINT fk_reserveNo foreign key(reserveNo) references reservation (reserveNo)
);


CREATE TABLE StoreInfo
(
   store_id varchar2(30) NOT NULL,
   id varchar2(30) NOT NULL UNIQUE,
   name varchar2(200) NOT NULL,
   category varchar2(30) NOT NULL,
   store_tel varchar2(13) NOT NULL UNIQUE,
   address varchar2(100) NOT NULL,
   openTime date NOT NULL,
   closeTime date NOT NULL,
   closedDays varchar2(30) NOT NULL,
   content varchar2(500) NOT NULL,
   mainPictureUrl varchar2(4000) NOT NULL,
   pictureUrl varchar2(4000) NOT NULL,
   menuPictureUrl varchar2(4000) NOT NULL,
   rating number(1) DEFAULT 0 NOT NULL,
   reviewCount number(1) DEFAULT 0 NOT NULL,
   station varchar2(100) NOT NULL,
   hashtag varchar2(4000),
   PRIMARY KEY (store_id)
);


CREATE TABLE StoreTable
(
	store_id varchar2(30) NOT NULL,
	headCount number(2,0),
	tableNo varchar2(10) NOT NULL,
	x varchar2(100) NOT NULL,
	y varchar2(100) NOT NULL
);


CREATE TABLE AfterVisit
(
   reserveNo varchar2(100) NOT NULL,
   store_id varchar2(30) NOT NULL,
   user_id varchar2(30) NOT NULL,
   tableNo varchar2(10) NOT NULL,
   headCount number(2,0) NOT NULL,
   reserveDate varchar2(30) NOT NULL,
   status NUMBER NOT NULL,
   PRIMARY KEY (reserveNo)
);


CREATE TABLE Favorite 	/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 09.18 최종본 추가 테이블 */
(
	user_id varchar2(30) NOT NULL,
	store_id varchar2(30) NOT NULL,
	store_name varchar2(200) NOT NULL
);

/* Create Foreign Keys */

ALTER TABLE Favorite	/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 09.18 최종본 추가 테이블 */
	ADD FOREIGN KEY (user_id)
	REFERENCES Customer (id)
;

ALTER TABLE QnA
   ADD FOREIGN KEY (admin_id)
   REFERENCES AdminInfo (id)
;


/*ALTER TABLE Reply
   ADD FOREIGN KEY (writeNo)
   REFERENCES Community (writeNo)
;*/


ALTER TABLE Community
   ADD FOREIGN KEY (id)
   REFERENCES Customer (id)
;


ALTER TABLE QnA
   ADD FOREIGN KEY (user_id)
   REFERENCES Customer (id)
;


ALTER TABLE Reply
   ADD FOREIGN KEY (user_id)
   REFERENCES Customer (id)
;


ALTER TABLE Reservation
   ADD FOREIGN KEY (user_id)
   REFERENCES Customer (id)
;


ALTER TABLE QnA
   ADD FOREIGN KEY (owner_id)
   REFERENCES Owner (id)
;


/*ALTER TABLE Review
   ADD FOREIGN KEY (id, store_id)
   REFERENCES Reservation (user_id, store_id)
;*/


ALTER TABLE Menu
   ADD FOREIGN KEY (store_id)
   REFERENCES StoreInfo (store_id)
;


ALTER TABLE StoreTable
	ADD FOREIGN KEY (store_id)
	REFERENCES StoreInfo (store_id)
;


/*ALTER TABLE Reply
ADD CONSTRAINT fk_writeNo
FOREIGN KEY (writeNo)
REFERENCES Community(writeNo)
ON DELETE CASCADE;*/

/*ALTER TABLE Reply
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES Customer (id)
ON DELETE CASCADE;*/


DROP SEQUENCE seq_reservation;
DROP SEQUENCE seq_review;
DROP SEQUENCE seq_reply;
DROP SEQUENCE seq_community;
DROP SEQUENCE seq_QnA;
DROP SEQUENCE seq_Store_id;

CREATE SEQUENCE seq_reservation START WITH 1000001;
CREATE SEQUENCE seq_review START WITH 1;
CREATE SEQUENCE seq_reply START WITH 1;
CREATE SEQUENCE seq_community START WITH 1;
CREATE SEQUENCE seq_QnA START WITH 1;
CREATE SEQUENCE seq_Store_id START WITH 10001;