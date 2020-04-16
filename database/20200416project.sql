create table member(
id varchar(20) primary key not null,
pw varchar(20) not null,
email varchar(30) not null,
name varchar(20) not null,
birth varchar(50) not null,
gender varchar(10) not null,
auth varchar(10) not null
);

create table book_main_category(
main_category_name varchar(30) primary key
);

create table book_sub_category(
main_category_name varchar(30) primary key
);

create table book(
isbn varchar(50) primary key not null,
book_m_category varchar(30) REFERENCES book_main_category(main_category_name) not null,
book_s_category varchar(30) REFERENCES book_sub_category(main_category_name)  not null,
book_subject varchar(100) not null,
book_writer varchar(50) not null,
book_pday varchar(50) not null,
book_summary varchar(1000) not null,
book_filename varchar(100) not null,
book_filesize int not null,
book_price int not null
);


create table library(
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null ,
isbn varchar(50) REFERENCES book(isbn) not null
);

create table review(
num int primary key not null,
isbn varchar(50) REFERENCES book(isbn) not null,
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
content varchar(300) not null,
rating int not null,
regdate varchar(50) not null
);

CREATE SEQUENCE review_num --시퀀스이름 EX_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
MAXVALUE 100000 --최대값 1000
NOCYCLE;

create table reviewlike(
num INT REFERENCES review(num) ON DELETE CASCADE not null,
isbn varchar(50) REFERENCES book(isbn) not null,
writer_id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
review_id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null
);

create table mycart(
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
isbn varchar(50) REFERENCES book(isbn) not null
);

create table wish(
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
isbn varchar(50) REFERENCES book(isbn) not null
);

create table resume(
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
isbn varchar(50) REFERENCES book(isbn) not null,
pagenum varchar(20) not null
);

create table board(
board_category varchar(20) not null,
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
board_number int primary key not null,
board_subject varchar(100) not null,
board_content varchar(500) not null,
board_regdate varchar(50) not null
);

create table reply(
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
reply_number int REFERENCES board(board_number) not null,
reply_subject varchar(50) not null,
reply_content varchar(300) not null,
reply_regdate varchar(50) not null
);

---------------------------------------------------------------



insert into member values('test', '1111', 'test@naver.com', '관리자', '1999-02-02', '남', '0');
insert into member values('aaaa', '1111', 'test2@naver.com', 'aaaa', '1999-02-02', '남', '1');
insert into member values('bbbb', '1111', 'test3@naver.com', 'bbbb', '1999-02-02', '여', '1');
insert into member values('cccc', '1111', 'test4@naver.com', 'cccc', '1999-02-02', '여', '1');
insert into member values('dddd', '1111', 'test5@naver.com', 'dddd', '1999-02-02', '남', '1');
insert into member values('eeeee', '1111', 'test6@naver.com', 'eeee', '1999-02-02', '여', '1');




insert into book_main_category values(
'소설'
);
insert into book_main_category values(
'자기개발'
);
insert into book_main_category values(
'건강/다이어트'
);
insert into book_main_category values(
'외국어'
);
insert into book_main_category values(
'컴퓨터/IT'
);
insert into book_main_category values(
'경영/경제'
);

insert into book_sub_category values(
'일반'
);

insert into book_sub_category values(
'SF'
);

insert into book_sub_category values(
'추리'
);

insert into book_sub_category values(
'판타지/무협'
);

insert into book_sub_category values(
'로맨스'
);

insert into book_sub_category values(
'성공/삶의 자세'
);

insert into book_sub_category values(
'취업/창업'
);

insert into book_sub_category values(
'설득/화술/협상'
);

insert into book_sub_category values(
'스마일/뷰티'
);

insert into book_sub_category values(
'건강/다이어트'
);

insert into book_sub_category values(
'운동/스포츠'
);

insert into book_sub_category values(
'비즈니스 영어'
);

insert into book_sub_category values(
'일반 영어'
);

insert into book_sub_category values(
'제2 외국어'
);

insert into book_sub_category values(
'IT비즈니스'
);

insert into book_sub_category values(
'IT자격증'
);

insert into book_sub_category values(
'개발/프로그래밍'
);

insert into book_sub_category values(
'IT해외원서'
);

insert into book_sub_category values(
'경영 일반'
);

insert into book_sub_category values(
'경제 일반'
);

insert into book_sub_category values(
'마케팅/세일즈'
);

insert into book_sub_category values(
'CEO/리더쉽'
);

insert into board values(
'공지',
'test',
0,
'저희 00인터넷 서점이 문을 열었습니다',
'저희 00인터넷 서점이 문을 열었습니다. 많은 이용 부탁드립니다. 돈을 펑펑써서 저희를 부자로 만들어주세요',
'2020-03-09'
);

insert into board values(
'문의',
'aaaa',
1,
'책을 잘못 샀습니다',
'책을 잘못샀는데 환불해 주세요',
'2020-03-10'
);

insert into reply values(
'test',
1,
'사용자 1님에 대한 답글입니다',
'사용자 1님에 대한 답글입니다, 알겠습니다 환불해드리겠습니다. 대신 님은 영구 구매 금지에요~~',
'2020-03-10'
);

--책을 넣어줘야함

insert into library values('aaaa','10000001');
insert into library values('aaaa','10000002');
insert into library values('aaaa','10000003');
insert into library values('aaaa','10000004');
insert into library values('aaaa','10000005');
insert into library values('aaaa','10000006');
insert into library values('aaaa','10000007');
insert into library values('aaaa','10000008');
insert into library values('aaaa','10000009');
insert into library values('aaaa','100000010');
insert into library values('aaaa','100000011');
insert into library values('aaaa','100000012');
insert into library values('aaaa','100000013');
insert into library values('bbbb','10000001');
insert into library values('bbbb','10000002');
insert into library values('bbbb','10000003');
insert into library values('bbbb','10000004');
insert into library values('bbbb','10000005');
insert into library values('cccc','10000001');
insert into library values('cccc','10000002');
insert into library values('cccc','10000003');
insert into library values('cccc','10000004');
insert into library values('dddd','10000001');
insert into library values('dddd','10000002');
insert into library values('dddd','10000003');
insert into library values('eeeee','10000001');
insert into library values('eeeee','10000002');



--drop table wish;
--drop table reviewlike;
--drop table review;
--drop table resume;
--drop table reply;
--drop table mycart;
--drop table library;
--drop table book;
--drop table board;
--drop table book_main_category;
--drop table book_sub_category;
--drop table member;
--TRUNCATE TABLE member;
--TRUNCATE TABLE reviewlike;
--TRUNCATE table review;
--TRUNCATE table wish;    
      