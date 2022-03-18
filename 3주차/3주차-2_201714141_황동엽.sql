use mydb;
show tables;

#### ���ο� SQL �� Ȱ���Ͽ� ���α׷� �ۼ��ϱ� �ǽ�
####
#### �Ʒ� ���� ���α׷��� �ۼ��ϰ� �ǽ��ϱ�
set @a=100;
set @b=200;
set @c=@a + @b;
select @a, @b, @c;

set @a = 500; 
set @b =300; 
set @c = @a - @b;
select @a, @b, @c;

#### ���ν��� add_sum�� �ۼ��ϰ� �ǽ��ϱ�
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

#### ���ν��� minus_proc�� �ۼ��ϰ� �ǽ��ϱ�
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

#### ���ν��� minus_proc2�� �ۼ��ϰ� �ǽ��ϱ�
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

#### ���ν��� score�� �ۼ��ϰ� �ǽ��ϱ�
DELIMITER $$
CREATE PROCEDURE score(IN d int)
BEGIN
    IF d >= 90 THEN SELECT 'A �Դϴ�.';
    ELSEIF d >= 80 THEN SELECT 'B �Դϴ�.';
    ELSEIF d >= 70 THEN SELECT 'C �Դϴ�.';
    ELSEIF d >= 60 THEN SELECT 'D �Դϴ�.';
    ELSE SELECT 'F �Դϴ�.';
    END IF;
end
$$
DELIMITER ;

CALL score(86);
CALL score(72);
CALL score(94);
CALL score(66);
CALL score(58);


### �Ʒ� ���ν����� �ΰ��� ���� �����ڸ� �Ķ��Ÿ�� ���� �޾Ƽ�, �� �ΰ��� ���� ���� �ش�
### ������ �����ϴ� ���ν����̴�. �� ���� ä���� ���ν����� �ϼ��Ͻÿ�.

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

### ������ ȣ�⹮�� 4�� �̻� �ۼ��Ͽ� �����ϱ� 

call oper_proc (15937,'+',15799);
call oper_proc (300000,'/',1000);
call oper_proc (33333,'*',11111);
call oper_proc (593,'-',192);




### ������� ��� ������ �ǽ��� �Ϸ��ϸ�, �� ������� ��ũ��Ʈ ���Ͽ� �����Ͽ� �ǽ� ��� ������ 
### �����ϼ���.

### �����ϼ̽��ϴ�.