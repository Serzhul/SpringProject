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

insert into member values('test', '1111', 'test@naver.com', '������', '1999-02-02', '��', '0');
insert into member values('�����1', '1111', 'test2@naver.com', '�ٺ�1', '1999-02-02', '��', '1');



insert into book_main_category values(
1,
'�Ҽ�'
);
insert into book_main_category values(
,
'�ڱ� ���'
);
insert into book_main_category values(
3,
'�ǰ�/���̾�Ʈ'
);
insert into book_main_category values(
4,
'�ܱ���'
);
insert into book_main_category values(
5,
'��Ʃ��/IT'
);
insert into book_main_category values(
6,
'�濵/����'
);

insert into book_sub_category values(
100,
'�Ҽ� ��ü'
);

insert into book_sub_category values(
101,
'�Ϲ�'
);

insert into book_sub_category values(
102,
'SF'
);

insert into book_sub_category values(
103,
'�߸�'
);

insert into book_sub_category values(
104,
'��Ÿ��/����'
);

insert into book_sub_category values(
105,
'�θǽ�'
);

insert into book_sub_category values(
200,
'�ڱ��� ��ü'
);

insert into book_sub_category values(
201,
'����/���� �ڼ�'
);

insert into book_sub_category values(
202,
'���/â��'
);

insert into book_sub_category values(
203,
'����/ȭ��/����'
);

insert into book_sub_category values(
300,
'�ǰ�/���̾�Ʈ ��ü'
);

insert into book_sub_category values(
301,
'������/��Ƽ'
);

insert into book_sub_category values(
302,
'�ǰ�/���̾�Ʈ'
);

insert into book_sub_category values(
303,
'�/������'
);

insert into book_sub_category values(
400,
'�ܱ��� ��ü'
);

insert into book_sub_category values(
401,
'����Ͻ� ����'
);

insert into book_sub_category values(
402,
'�Ϲ� ����'
);

insert into book_sub_category values(
403,
'��2 �ܱ���'
);

insert into book_sub_category values(
500,
'��ǻ��/IT ��ü'
);

insert into book_sub_category values(
501,
'IT����Ͻ�'
);

insert into book_sub_category values(
502,
'IT�ڰ���'
);

insert into book_sub_category values(
503,
'����/���α׷���'
);

insert into book_sub_category values(
504,
'IT�ؿܿ���'
);

insert into book_sub_category values(
600,
'�濵/���� ��ü'
);

insert into book_sub_category values(
601,
'�濵 �Ϲ�'
);

insert into book_sub_category values(
602,
'���� �Ϲ�'
);

insert into book_sub_category values(
603,
'������/������'
);

insert into book_sub_category values(
604,
'CEO/������'
);

insert into book values(
'12345678',
'�Ҽ�',
'�Ϲ�',
'Moby Dick; Or, The Whale.txt',
'Herman Melville',
'2020-03-09',
'��� ���� �ı��� ��, �������� �ʴ� ����, ���� �ʸ� ���� �����ϰ� ������ �ʿ� �ºپ� �ο츮��. ���� �Ѻ��ǿ����� �ʸ� ���� �ۻ��� ������, ���� �� ���� ������ ��� �� ������ ���� �ʿ��� ��� �ָ�.',
'Moby Dick; Or, The Whale',
1111111,
30000
);

insert into library values(
'�����1',
'12345678'
);

insert into review values(
'12345678',
'�����1',
'���� �����ְ� ���Ҿ��~~',
'5',
'0.',
'2020-03-09'
);

insert into mycart values(
'�����1',
'12345678'
);

insert into wish values(
'�����1',
'12345678'
);

insert into resume values(
'�����1',
'12345678',
1
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