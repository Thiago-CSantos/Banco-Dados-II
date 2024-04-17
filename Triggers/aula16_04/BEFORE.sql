use aula16;

create table Departamento(
	codD int primary key,
    descricao varchar(30),
    total_salario numeric(10,2)
);

create table Funcionario(
	idFuc int primary key auto_increment,
    nome varchar(100),
    codD int ,
    salario numeric(10,2),
    foreign key (codD) references Departamento(codD)
);

select * from Funcionario;
insert into Funcionario values(3,"Jhola", 2, null);
delimiter $$
	create TRIGGER Ex02
    before insert on Funcionario
    for each row
		begin
			if NEW.salario IS NULL THEN
				SET NEW.salario = 1045;
            end if;
		end;
$$
delimiter ;
show triggers;

