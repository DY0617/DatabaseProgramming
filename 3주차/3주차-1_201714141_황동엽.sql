### �ǽ� ����-1
show databases;
create database mydb;
use mydb;
show tables;

create table student (
    id  int not null,
    name char(20) not null,
    age  int,
    height int,
    weight  float,
    primary key(id) 
) ENGINE=InnoDB DEFAULT CHARSET =utf8;

#(1) ���� SQL���� ���ʷ� �����ϰ� ����� Ȯ���Ͻÿ�.
insert into student values(10, 'Kim', 40, 170, 68);
insert into student values(20, 'Lee', 30, 175, 74);
insert into student values(30, 'Park', 40, 165, 58);
insert into student values(40, 'Choi', 50, 184, 87);

select * from student;

#(2) ���� SQL���� ���ʷ� �����ϰ�, ������ �߻��ϴ��� ���ο� ������ ������ Ȯ���Ͻÿ�.
insert into student values(40, 'Chung', 50, 154, null);
#id�� �ߺ���. id�� �⺻ Ű�̴�.
insert into student values(50, 2000, 'Chung', 154, null);
#�������� �߸���.
insert into student values(50, 'Chung', 30, 154, null);
insert into student values(null, 'Lim', 50, 162, null);
#id�� null���� �� �� ����.

select * from student;

#(3) ���� SQL���� ���ʷ� �����ϰ� �� ����� Ȯ���Ͻÿ�. 
select name, age from student where height >= 170 and weight <= 80;
select max(height), avg(height), min(height) from student;
select age, avg(height), avg(weight) from student group by age;

update student set age = 45, height = 165 where id = 30;
select * from student;

delete from student where age <= 40;
select * from student;

delete from student;
select * from student;

drop table student;
select * from student;
