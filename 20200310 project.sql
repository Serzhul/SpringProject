create table member(
id varchar(20) primary key not null,
pw varchar(20) not null,
email varchar(30) not null,
name varchar(20) not null,
birth varchar(50) not null,
gender varchar(10) not null,
auth varchar(10) not null
);

create table book(
isbn varchar(50) primary key not null,
book_m_category varchar(30) not null,
book_s_category varchar(30) not null,
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
alter table book
add(book_price int);

update book
set book_price=30000
where isbn='12345678';

insert into member values('test', '1111', 'test@naver.com', '관리자', '1999-02-02', '남', '0');
insert into member values('사용자1', '1111', 'test2@naver.com', '바보1', '1999-02-02', '남', '1');

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

--drop table wish;
--drop table review;
--drop table resume;
--drop table reply;
--drop table mycart;
--drop table library;
--drop table book;
--drop table member;
--drop table board;