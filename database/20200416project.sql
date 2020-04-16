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

CREATE SEQUENCE review_num --�������̸� EX_SEQ
INCREMENT BY 1 --�������� 1
START WITH 1 --���ۼ��� 1
MINVALUE 1 --�ּҰ� 1
MAXVALUE 100000 --�ִ밪 1000
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



insert into member values('test', '1111', 'test@naver.com', '������', '1999-02-02', '��', '0');
insert into member values('aaaa', '1111', 'test2@naver.com', 'aaaa', '1999-02-02', '��', '1');
insert into member values('bbbb', '1111', 'test3@naver.com', 'bbbb', '1999-02-02', '��', '1');
insert into member values('cccc', '1111', 'test4@naver.com', 'cccc', '1999-02-02', '��', '1');
insert into member values('dddd', '1111', 'test5@naver.com', 'dddd', '1999-02-02', '��', '1');
insert into member values('eeeee', '1111', 'test6@naver.com', 'eeee', '1999-02-02', '��', '1');




insert into book_main_category values(
'�Ҽ�'
);
insert into book_main_category values(
'�ڱⰳ��'
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
'aaaa',
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

--å�� �־������

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
      