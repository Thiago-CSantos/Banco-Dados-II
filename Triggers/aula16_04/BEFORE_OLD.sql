use aula16;


delimiter &&
	create trigger Ex03
    before update on Funcionario
    for each row
    begin
		if new.salario > old.salario * 1.05 then 
			set new.salario=old.salario*1.05;
    end if;
    end;
    &&
delimiter ;

update Funcionario set salario = 9000 where idFuc = 3;

select * from Funcionario;