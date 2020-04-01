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
isbn varchar(50) REFERENCES book(isbn) not null,
id varchar(20) REFERENCES member(id) ON DELETE CASCADE not null,
content varchar(300) not null,
rating int not null,
like_cnt int not null,
regdate varchar(50) not null
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

insert into member values('test', '1111', 'test@naver.com', '������', '1999-02-02', '��', '0');
insert into member values('�����1', '1111', 'test2@naver.com', '�ٺ�1', '1999-02-02', '��', '1');



insert into book_main_category values(
'�Ҽ�'
);
insert into book_main_category values(
'�ڱ� ���'
);
insert into book_main_category values(
'�ǰ�/���̾�Ʈ'
);
insert into book_main_category values(
'�ܱ���'
);
insert into book_main_category values(
'��ǻ��/IT'
);
insert into book_main_category values(
'�濵/����'
);

insert into book_sub_category values(
'�Ϲ�'
);

insert into book_sub_category values(
'SF'
);

insert into book_sub_category values(
'�߸�'
);

insert into book_sub_category values(
'��Ÿ��/����'
);

insert into book_sub_category values(
'�θǽ�'
);

insert into book_sub_category values(
'����/���� �ڼ�'
);

insert into book_sub_category values(
'���/â��'
);

insert into book_sub_category values(
'����/ȭ��/����'
);

insert into book_sub_category values(
'������/��Ƽ'
);

insert into book_sub_category values(
'�ǰ�/���̾�Ʈ'
);

insert into book_sub_category values(
'�/������'
);

insert into book_sub_category values(
'����Ͻ� ����'
);

insert into book_sub_category values(
'�Ϲ� ����'
);

insert into book_sub_category values(
'��2 �ܱ���'
);

insert into book_sub_category values(
'IT����Ͻ�'
);

insert into book_sub_category values(
'IT�ڰ���'
);

insert into book_sub_category values(
'����/���α׷���'
);

insert into book_sub_category values(
'IT�ؿܿ���'
);

insert into book_sub_category values(
'�濵 �Ϲ�'
);

insert into book_sub_category values(
'���� �Ϲ�'
);

insert into book_sub_category values(
'������/������'
);

insert into book_sub_category values(
'CEO/������'
);

insert into board values(
'����',
'test',
0,
'���� 00���ͳ� ������ ���� �������ϴ�',
'���� 00���ͳ� ������ ���� �������ϴ�. ���� �̿� ��Ź�帳�ϴ�. ���� ����Ἥ ���� ���ڷ� ������ּ���',
'2020-03-09'
);

insert into board values(
'����',
'�����1',
1,
'å�� �߸� ����ϴ�',
'å�� �߸���µ� ȯ���� �ּ���',
'2020-03-10'
);

insert into reply values(
'test',
1,
'����� 1�Կ� ���� ����Դϴ�',
'����� 1�Կ� ���� ����Դϴ�, �˰ڽ��ϴ� ȯ���ص帮�ڽ��ϴ�. ��� ���� ���� ���� ��������~~',
'2020-03-10'
);


--
--drop table wish;
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
--
--
--------------------------------------------------------
--
--select * from book order by isbn;

----------------------------------------------------
--
--select * from member where id = 'test';
--select nvl(count(*),0) from book where book_m_category = '�Ҽ�';
--select * from book where book_m_category='�Ҽ�';
--
--
--
--select * 
--from(
--select row_number() over (order by isbn) num
--from book
--where book_m_category =  '�Ҽ�'
--)
--where num between 1 and 50;
--
--select row_number() over (order by isbn) num,
--A.*
--from book.;
--
--select row_number() over (order by isbn) num, A.* from BOOK A
--where book_m_category =  '�Ҽ�'
--order by isbn ;
--
--select * 
--from(
--select row_number() over (order by isbn) num, A.* from BOOK A
--where book_m_category =  '�Ҽ�'
--order by isbn
--)
--where num between 11 and 15;

insert into review values
('10000001', 'test', 'test', 5 , 0, now())