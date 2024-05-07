create database ExemplloWhile;
use ExemplloWhile;

delimiter $$
create procedure Ex_While()
begin
	declare x int;
    declare str varchar(100);   
    set str = "";
    set x = 1;
	while x <= 5 DO
		set str  = concat(str, x,',');
		set x = x + 1;
    end while;
    
    select str;
end;
$$
delimiter ;

call Ex_While();


delimiter $$
create procedure Ex_WhileRepeat()
begin
	declare x int;
    declare str varchar(100);   
    set str = "";
    set x = 1;
	repeat
		set str  = concat(str, x,',');
		set x = x + 1;
	until x > 5
    end repeat;
    
    select str;
end;
$$
delimiter ;

call Ex_WhileRepeat;


delimiter $$
create procedure Ex_WhileLoop(limite int)
begin

declare contador int default 0;
declare som int default 0;

qualquerNome: LOOP
	set contador = contador + 1;
	set som = som + contador;
    if contador >= limite then
		leave qualquerNome;
	end if;
end loop qualquerNome;
select som;
end
$$
delimiter ;

call Ex_WhileLoop(10);


delimiter $$
create procedure Exercicio01()
begin
	declare str varchar(100) default "";
    declare num int default 0;
    
    NomeLoop: loop 
    set num = num + 1;
    
    if MOD(num,2) = 0 then
		set str  = concat(str, num,',');
        
        if num = 10 then
			leave NomeLoop;
		end if;
        
    end if;
    
    if num = 10 then
		leave NomeLoop;
    end if;
    
    end loop NomeLoop;
    select str;
end;
$$
delimiter ;

call Exercicio01();
drop procedure Exercicio01;