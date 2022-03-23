## 아래 company 데이터베이스에 대한 문장을 실행하세요.

show databases;

create database company;   
## 데이터베이스를 잘못 생성시, drop database company; 문장을 실행 후 다시 생성함
use company;
show tables;

create table department
( dname varchar(15) not null,
dnumber int not null,
mgr_ssn char(9) not null,
mgr_start_date date,
primary key(dnumber),
unique(dname)) engine=InnoDB default charset = utf8;

## 테이블을 잘못 생성시, drop table department; 문장을 실행 후 다시 생성함

create table employee
( fname varchar(15) not null,
minit char,
lname varchar(15) not null,
ssn char(9) not null,
bdate date,
address varchar(30),
sex char,
salary decimal(10,2),
super_ssn char(9),
dno int not null,
primary key (ssn),
foreign key(dno) references department(dnumber))
engine=InnoDB default charset = utf8;

show tables;

create table dept_locations
( dnumber int not null,
dlocation varchar(15) not null,
primary key(dnumber, dlocation),
foreign key (dnumber) references department(dnumber))
engine=InnoDB default charset = utf8;

create table project
(pname varchar(15) not null,
pnumber int not null,
plocation varchar(30) not null,
dnum int not null,
primary key(pnumber),
unique(pname),
foreign key(dnum) references department(dnumber))
engine=InnoDB default charset = utf8;

create table works_on
(essn char(9) not null,
pno int not null,
hours decimal(3,1) not null,
primary key(essn, pno),
foreign key(essn) references employee(ssn),
foreign key(pno) references project(pnumber))
engine=InnoDB default charset = utf8;

create table dependent
( essn char(9) not null,
dependent_name varchar(15) not null,
sex char,
bdate date,
relationship varchar(8),
primary key(essn, dependent_name),
foreign key(essn) references employee(ssn))
engine=InnoDB default charset = utf8;

show tables;

select * from employee;

insert into department values 
('Research', 5, '333445555', '1988-05-22');
select * from department;
insert into department values 
('Administration', 4, '987654321', '1995-01-01');
insert into department values 
('Headquarters', 1, '888665555', '1981-06-19');
insert into department values
('Finance', 6, '123456789', '1999-01-01');

insert into employee values ('John', 'B', 'Smith', '123456789',
'1965-01-09','731 Fondrein, Houston, TX', 'M', 30000, '333445555', 5);
select * from employee;
insert into employee values ('Franklin', 'T', 'Wong', '333445555', '1955-12-08',
'638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
insert into employee values ('Alicia', 'J', 'Zelaya', '999887777',
'1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
insert into employee values ('Jeniifer', 'S', 'Wallace', '987654321',
'1941-06-20', '291 Berry, Bellair, TX', 'F', 43000, '888665555', 4);
insert into employee values ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15',
'975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
insert into employee values ('Joyce', 'A', 'English', '453453453', 
'1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
insert into employee values ('Ahmed', 'V', 'Jabbar', '987987987', 
'1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
insert into employee values ('James', 'E', 'Borg', '888665555', '1937-11-10',
'450 Stone, Houston, TX', 'M', 55000, null, 1);

insert into dept_locations values (1, 'Houston');
insert into dept_locations values (4, 'Stafford');
insert into dept_locations values (5, 'Bellaire');
insert into dept_locations values (5, 'Sugarland');
insert into dept_locations values (5, 'Houston');
select * from dept_locations;

insert into project values ('ProductX', 1, 'Bellaire', 5);
insert into project values ('ProductY', 2, 'Sugarland', 5);
insert into project values ('ProductZ', 3, 'Houston', 5);
insert into project values ('Computerization', 10, 'Stafford', 4);
insert into project values ('Reorganization', 20, 'Houston', 1);
insert into project values ('Newbenefits', 30, 'Stafford', 4);
select * from project;

insert into works_on values('123456789', 1, 32.5);
insert into works_on values('123456789', 2, 15);
insert into works_on values('666884444', 3, 40.0);
insert into works_on values('453453453', 1, 20.0);
insert into works_on values('453453453', 2, 20.0);
select * from works_on;

insert into works_on values('333445555', 2, 10.0);
insert into works_on values('333445555', 3, 10.0);
insert into works_on values('333445555', 10, 10.0);
insert into works_on values('333445555', 20, 10.0);
insert into works_on values('999887777', 30, 30.0);
insert into works_on values('999887777', 10, 10.0);
insert into works_on values('987987987', 10, 35.0);
insert into works_on values('987987987', 30, 5.0);
insert into works_on values('987654321', 30, 20.0);
insert into works_on values('987654321', 20, 15.0);
insert into works_on values('888665555', 20, 20.0);

insert into dependent values 
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
insert into dependent values 
('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
insert into dependent values 
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
insert into dependent values 
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
insert into dependent values 
('123456789', 'Michael', 'M', '1988-01-04', 'Son');
insert into dependent values 
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
insert into dependent values 
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

select * from dependent;
select * from employee;
select * from department;
select * from dept_locations;
select * from project;
select * from works_on;

insert into department values('영업부', 7, '987654321', '2000-03-02');
select * from department;

insert into employee values('문수',null , '박', '222334444', 
'2002-11-25','서울시 강북구', 'M', 25000, '333445555', 7);
insert into employee values('지매',null, '일', '444556666', 
'1999-03-15','서울시 강동구', 'F', 35000, '333445555', 7);
insert into employee values('길동',null , '홍', '777889999', 
'2000-10-10','서울시 중구', 'M', 45000, '333445555', 7);
select * from employee;

drop procedure if exists getDnum;
delimiter $$
create procedure getDnum(in pid int, out dn int)
begin
	select dnum into dn from project where pnumber=pid;
end
$$
delimiter ;
call getDnum(1,@dd);
select @dd;
call getDnum(10,@dd);
select @dd;
call getDnum(30,@dd);
select @dd;
select * from project;
drop procedure if exists getPname;
delimiter $$
create procedure getPname(in pid int, out pn varchar(15))
begin 
	select pname into pn from project where pnumber=pid;
end
$$ 
delimiter ;
call getPname(1,@pp);
select @pp;
call getPname(2,@pp);
select @pp1;

select * from employee;
drop procedure if exists getEname;
delimiter $$ 
create procedure getEname(in sn char(9),out fn varchar(15), out ln varchar(15))
begin 
	select fname,lname into fn, ln from employee where ssn=sn;
end
$$ 
delimiter ;

call getEname('123456789',@fname,@lname);
select @fname,@lname;
call getEname('987654321',@fname,@lname);
select @fname,@lname1;

drop procedure if exists getEname2;
delimiter $$ 
create procedure getEname2(in sn char(9),out fn varchar(15) character set 'utf8' collate 'utf8_bin', out ln varchar(15) character set 'utf8' collate 'utf8_bin')
begin 
	select fname,lname into fn, ln from employee where ssn=sn;
end
$$ 
delimiter ;

call getEname('123456789',@fname,@lname);
select @fname,@lname;
call getEname('987654321',@fname,@lname);
select @fname,@lname;
call getEname('222334444',@fname,@lname);
select @fname,@lname;
call getEname('777889999',@fname,@lname);
select @fname,@lname;
call getEname('444556666',@fname,@lname);
select @fname,@lname;

drop function if exists getEnameFunc;
delimiter $$ 
create function getEnameFunc(sn char(9))
	returns varchar(15)
begin 
	declare ln varchar(15);
	select lname into ln from employee where ssn=sn;
	return ln;
end
$$ 
delimiter ;
select getEnameFunc('123456789');
select getEnameFunc('987654321');
select getEnameFunc('222334444');

drop procedure if exists getSalarySsn;
delimiter $$ 
create procedure getSalarySsn(in sn char(9),out inc_sal int)
begin 
	declare sal int;
	select salary into sal from employee where ssn=sn;
	set inc_sal=sal*1.1;
end 
$$ 
delimiter ;
call getSalarySsn('123456789',@inc_salary);
select @inc_salary;
call getSalarySsn('987654321',@inc_salary);
select @inc_salary;
select * from employee;

drop procedure if exists getSalaryDnoCur;
delimiter $$ 
create procedure getSalaryDno(in dn char(9),out total_sal int,out cnt int)
begin 
	declare sal int;
	declare endOfRow boolean default false;
	declare cur1 cursor for
		select salary from employee where dno=dn;
	declare continue handler for not found set endOfRow=true;

	set total_sal=0;
	set cnt=0;
	open cur1;
	cursor_loop: loop
		fetch cur1 into sal;
		if endOfRow then 
			leave cursor_loop; 
		end if;
	
		set total_sal = total_sal+sal;
		set cnt=cnt+1;
	end loop cursor_loop;
	close cur1;
end
$$ 
delimiter ;

call getSalaryDnoCur(5,@total_salary,@cnt);
select @total_salary, @cnt;
select * from employee;
