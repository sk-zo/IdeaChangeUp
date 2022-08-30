create table member (
	id varchar2(20) primary key,
	password varchar2(20) not null,
	phone varchar2(20) not null,
	point number(5) default 0,
	grade number(1) default 2
);

create sequence post_num
start with 1
increment by 1;

create table post (
	post_num number primary key,
	writer varchar2(20) not null,
	title varchar2(200) not null,
	abstract varchar2(3000) not null,
	content varchar2(4000) not null,
	category number(1) not null,
	views number(8) default 0,
	likes number(8) default 0,
	post_time date default sysdate,
	constraint post_writer foreign key(writer)
	references member(id)
);

create sequence comment_num
start with 1
increment by 1;

create table comments (
	comment_num number primary key,
	post number not null,
	writer varchar2(20) not null,
	content varchar2(500) not null,
	comment_time date default sysdate,
	constraint comment_post foreign key(post)
	references post(post_num),
	constraint comment_writer foreign key(writer)
	references member(id)
);

create table patent (
	patent_num char(13) primary key,
	ipc number(1) not null,
	title varchar2(200) not null,
	abstract varchar2(3000) not null
);

create table similar_patent (
	post_num number not null,
	patent_num char(13) not null,
	similarity float not null,
	constraint sim_post foreign key(post_num)
	references post(post_num),
	constraint sim_patent foreign key(patent_num)
	references patent(patent_num)
);

create table attached_file (
	post_num number not null,
	file_name varchar2(50) not null,
	file_path varchar2(50) not null,
	constraint file_post foreign key(post_num)
	references post(post_num)
);

create table likes (
	post_num number not null,
	id varchar2(20) not null,
	constraint like_post foreign key(post_num)
	references post(post_num),
	constraint like_id foreign key(id)
	references member(id)
);

create table attached_file (
	post_num number not null,
	file_name varchar2(50) not null,
	file_path varchar2(50) not null,
	constraint file_post foreign key(post_num)
	references post(post_num)
);

create sequence competition_num
start with 1
increment by 1;

create table competition (
	competition_num number primary key,
	writer varchar2(20) not null,
	title varchar2(200) not null,
	category number(1) not null,
	price number not null,
	deadline date not null,
	post_time date default sysdate,
	constraint competition_writer foreign key(writer)
	references member(id)
);

create table compete_file (
	compete_num number not null,
	file_path varchar2(100) not null,
	file_group number(1) not null,
	constraint compete_file foreign key(compete_num)
	references competition(competition_num)
);

create table submit_file (
	compete_num number not null,
	writer varchar2(20) not null,
	file_path varchar2(100) not null,
	submit_date date not null,
	constraint compete_submit foreign key(compete_num)
	references competition(competition_num),
	constraint submit_writer foreign key(writer)
	references member(id)
);

select * from patent;

select post_num, writer, title, abstract, content, category, views, post_time from (select post_num, writer, title, abstract, content, category, views, post_time, rank() over(order by post_num) as num from post where abstract like '%회전체%') where num <= 10;

select count(*) from likes where ;

Insert into similar_patent values(post_num.currval, '1020200077914', 0.6);

select post_num.currval from dual;

select post_num, writer, title, abstract, content, category, views, post_time, likes from (select post_num, writer, title, abstract, content, category, views, post_time, likes, rank() over(order by post_num) as num from post) where num between 1 and 3;

delete from post where post_num=26;


drop sequence competition_num;

select compete_num from (select compete_num, rank() over(order by compete_num desc) as num from competition) where num=1;

select * from patent where patent_num=1019997001386	;

select count(*) from patent;

delete from patent;
