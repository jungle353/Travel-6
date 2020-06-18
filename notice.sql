
create table notice(
	num number(4) primary key,
	writer varchar2(21) not null,
	title varchar2(60) not null,
	content varchar2(1000),
	writeday date default sysdate,
	readcnt number(4) default 0
);
create table notice_comment(
	comment_num number(4) primary key,
	comment_board number,
	comment_content varchar2(1000),
	constraint FK_KEY foreign key(comment_board) references notice(num) on delete cascade,
	comment_writer varchar2(21),	
	comment_day date default sysdate,
	repRoot number(4),
	repStep number(4),
	repIndent number(4)
);

insert into notice(num, writer, title, content) values (2, 'lee', 'test2', 'ok2');
insert into notice(num,writer,title,content) values (3,'park','test3','ok3')

select * from notice
select max(num) from notice

select * from (select rownum rnum, num, title, writer, writeday, readcnt from (select * from notice order by num desc)) where rnum>=? and rnum<=?

insert into NOTICE_COMMENT(comment_num, comment_board, comment_content, comment_writer) values (2, 102, '댓글2', '댓글러2')
insert into NOTICE_COMMENT(comment_num, comment_board, comment_content, comment_writer) values (3, 101, '댓글1', '댓글러1')

select * from member
select * from notice_comment
select * from notice_comment where comment_board = 102 order by repRoot desc, repStep asc 

select * from notice_comment where comment_board = 102


select * from notice_comment, notice where notice_comment.comment_board = notice.num and comment_board = 109 order by repRoot asc, repStep asc

update notice_comment set repStep = repStep + 1 where comment_num = 11 and repStep < 1	

insert into NOTICE_COMMENT(comment_num, comment_board, comment_content, comment_writer, repRoot, repStep, repIndent) values (9, 108, '대댓글1', '대댓글러1',7 , 1, 1)

drop table notice_comment
drop table notice
select * from NOTICE_COMMENT where comment_board=118
select * from NOTICE

select * from member
insert into member (id , name , age , pw) values ('adm', 'admin', 99, 'admin')


select * from NOTICE_COMMENT where comment_board=117

select * from notice where num = 117


select * from NOTICE_comment
delete from notice_comment where comment_num = 2
update notice_comment set comment_content='수정된내용' where comment_num =1

