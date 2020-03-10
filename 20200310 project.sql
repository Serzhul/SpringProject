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
main_category_num int,
main_category_name varchar(30) primary key
);

create table book_sub_category(
main_category_num int,
main_category_name varchar(30) primary key
);

create table book(
isbn varchar(50) primary key not null,
book_m_category varchar(30) REFERENCES book_main_category(main_category_name) not null,
book_s_category varchar(30) REFERENCES book_sub_category(main_category_name)  not null,
book_subject varchar(50) not null,
book_writer varchar(20) not null,
book_pday varchar(50) not null,
book_summary varchar(300) not null,
book_filename varchar(50) not null,
book_filesize int not null,
book_price int not null
);


create table library(
id varchar(20) REFERENCES member(id) not null,
isbn varchar(50) REFERENCES book(isbn) not null
);

create table review(
isbn varchar(50) REFERENCES book(isbn) not null,
id varchar(20) REFERENCES member(id) not null,
content varchar(300) not null,
rating varchar(30) not null,
like_cnt varchar(20) not null,
regdate varchar(50) not null
);

create table mycart(
id varchar(20) REFERENCES member(id) not null,
isbn varchar(50) REFERENCES book(isbn) not null
);

create table wish(
id varchar(20) REFERENCES member(id) not null,
isbn varchar(50) REFERENCES book(isbn) not null
);

create table resume(
id varchar(20) REFERENCES member(id) not null,
isbn varchar(50) REFERENCES book(isbn) not null,
pagenum varchar(20) not null
);

create table board(
board_category varchar(20) not null,
id varchar(20) REFERENCES member(id) not null,
board_number int primary key not null,
board_subject varchar(100) not null,
board_content varchar(500) not null,
board_regdate varchar(50) not null
);

create table reply(
id varchar(20) REFERENCES member(id) not null,
reply_number int REFERENCES board(board_number) not null,
reply_subject varchar(50) not null,
reply_content varchar(300) not null,
reply_regdate varchar(50) not null
);

---------------------------------------------------------------

insert into member values('test', '1111', 'test@naver.com', '관리자', '1999-02-02', '남', '0');
insert into member values('사용자1', '1111', 'test2@naver.com', '바보1', '1999-02-02', '남', '1');



insert into book_main_category values(
1,
'소설'
);
insert into book_main_category values(
,
'자기 계발'
);
insert into book_main_category values(
3,
'건강/다이어트'
);
insert into book_main_category values(
4,
'외국어'
);
insert into book_main_category values(
5,
'컴튜터/IT'
);
insert into book_main_category values(
6,
'경영/경제'
);

insert into book_sub_category values(
100,
'소설 전체'
);

insert into book_sub_category values(
101,
'일반'
);

insert into book_sub_category values(
102,
'SF'
);

insert into book_sub_category values(
103,
'추리'
);

insert into book_sub_category values(
104,
'판타지/무협'
);

insert into book_sub_category values(
105,
'로맨스'
);

insert into book_sub_category values(
200,
'자기계발 전체'
);

insert into book_sub_category values(
201,
'성공/삶의 자세'
);

insert into book_sub_category values(
202,
'취업/창업'
);

insert into book_sub_category values(
203,
'설득/화술/협상'
);

insert into book_sub_category values(
300,
'건강/다이어트 전체'
);

insert into book_sub_category values(
301,
'스마일/뷰티'
);

insert into book_sub_category values(
302,
'건강/다이어트'
);

insert into book_sub_category values(
303,
'운동/스포츠'
);

insert into book_sub_category values(
400,
'외국어 전체'
);

insert into book_sub_category values(
401,
'비즈니스 영어'
);

insert into book_sub_category values(
402,
'일반 영어'
);

insert into book_sub_category values(
403,
'제2 외국어'
);

insert into book_sub_category values(
500,
'컴퓨터/IT 전체'
);

insert into book_sub_category values(
501,
'IT비즈니스'
);

insert into book_sub_category values(
502,
'IT자격정'
);

insert into book_sub_category values(
503,
'개발/프로그래밍'
);

insert into book_sub_category values(
504,
'IT해외원서'
);

insert into book_sub_category values(
600,
'경영/경제 전체'
);

insert into book_sub_category values(
601,
'경영 일반'
);

insert into book_sub_category values(
602,
'경제 일반'
);

insert into book_sub_category values(
603,
'마케팅/세일즈'
);

insert into book_sub_category values(
604,
'CEO/리더쉽'
);

insert into book values(
'12345678',
'소설',
'일반',
'Moby Dick; Or, The Whale.txt',
'Herman Melville',
'2020-03-09',
'모든 것을 파괴할 뿐, 정복하지 않는 고래여, 나는 너를 향해 돌진하고 끝까지 너와 맞붙어 싸우리라. 지옥 한복판에서라도 너를 향해 작살을 던지고, 가눌 수 없는 증오를 담아 내 마지막 숨을 너에게 뱉어 주마.',
'Moby Dick; Or, The Whale',
1111111,
30000
);

insert into library values(
'사용자1',
'12345678'
);

insert into review values(
'12345678',
'사용자1',
'아주 끝내주게 좋았어요~~',
'5',
'0.',
'2020-03-09'
);

insert into mycart values(
'사용자1',
'12345678'
);

insert into wish values(
'사용자1',
'12345678'
);

insert into resume values(
'사용자1',
'12345678',
1
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
'사용자1',
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

drop table wish;
drop table review;
drop table resume;
drop table reply;
drop table mycart;
drop table library;
drop table book;
drop table board;
drop table book_main_category;
drop table book_sub_category;
drop table member;