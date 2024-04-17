create database aula16;
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


select * from departamento;

insert into Departamento values(1,"Tecnologia",0);

delimiter aa
create trigger EX03
after insert on Funcionario
	for each row
		BEGIN 
			if NEW.codD IS NOT NULL THEN
				UPDATE Departamento
				SET total_salario = total_salario + NEW.salario
				where codD = NEW.codD;
			end if;
		END;
aa  
delimiter ;

show triggers;

insert into Funcionario(nome,codD,salario) values("Pedro", 1, 5000);