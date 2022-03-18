use mydb;
show tables;

#### 새로운 SQL 언어를 활용하여 프로그램 작성하기 실습
####
#### 아래 예제 프로그램을 작성하고 실습하기
set @a=100;
set @b=200;
set @c=@a + @b;
select @a, @b, @c;

set @a = 500; 
set @b =300; 
set @c = @a - @b;
select @a, @b, @c;

#### 프로시저 add_sum을 작성하고 실습하기
drop procedure if exists add_sum;
delimiter $$
create procedure add_sum()
begin 
    declare a INT;
    declare b INT;
    declare c INT;
    set a = 200; set b = 700; set c = a + b;
    select a, b, c;
end 
$$
delimiter ;

call add_sum;
call add_sum;
select @a;
select a;
call add_sum;

#### 프로시저 minus_proc를 작성하고 실습하기
drop procedure if exists minus_proc;
delimiter $$
create procedure minus_proc ( )
begin
    declare x int;  declare y int; declare z int;
    set x = 50; set y = 35; set z = x - y; 
    select x, y, z; 
end
$$
delimiter ;

call minus_proc;
call minus_proc;

select @a, @b, @c;
select x, y, z;
select @x, @y, @z;

#### 프로시저 minus_proc2를 작성하고 실습하기
drop procedure if exists minus_proc2;
delimiter $$
create procedure minus_proc2 (IN s int, IN t int)
begin
    declare u int;  
    set u = s - t;  
    select s, t, u; 
end
$$
delimiter ;

call minus_proc2(200, 150);
call minus_proc2(5000, 2550);
call minus_proc2(30, 10);

call minus_proc;
call minus_proc;

#### 프로시저 score를 작성하고 실습하기
DELIMITER $$
CREATE PROCEDURE score(IN d int)
BEGIN
    IF d >= 90 THEN SELECT 'A 입니다.';
    ELSEIF d >= 80 THEN SELECT 'B 입니다.';
    ELSEIF d >= 70 THEN SELECT 'C 입니다.';
    ELSEIF d >= 60 THEN SELECT 'D 입니다.';
    ELSE SELECT 'F 입니다.';
    END IF;
end
$$
DELIMITER ;

CALL score(86);
CALL score(72);
CALL score(94);
CALL score(66);
CALL score(58);


### 아래 프로시저는 두개의 값과 연산자를 파라메타로 전달 받아서, 그 두개의 값에 대해 해당
### 연산을 실행하는 프로시저이다. 빈 줄을 채워서 프로시저를 완성하시오.

drop procedure if exists oper_proc;
delimiter $$
create procedure oper_proc (IN s int, IN op char, IN t int)
begin
      declare u int;  
      case
	when op = '+' then set u = s + t;
	when op = '-' then set u = s - t;
	when op = '*' then set u = s * t;
	when op = '/' then set u = s / t;
	else set u = -10000;
     end case;
     select s, op, t, '=', u;
end 
$$
delimiter ;

call oper_proc (100, '+', 50);
call oper_proc (250, '-', 120);
call oper_proc (10, '*', 5);
call oper_proc (400, '/', 80);  

### 임의의 호출문을 4개 이상 작성하여 실행하기 

call oper_proc (15937,'+',15799);
call oper_proc (300000,'/',1000);
call oper_proc (33333,'*',11111);
call oper_proc (593,'-',192);




### 여기까지 모든 문장의 실습을 완료하면, 이 문장들을 스크립트 파일에 저장하여 실습 결과 과제로 
### 제출하세요.

### 수고하셨습니다.