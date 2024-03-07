create database Views;
use Views;

create table Funcionario(
	idFunc int,
    nomeF varchar(100),
    sexo varchar(100),
    salario double,
    idDepto int,
    primary key(idFunc),
    foreign key(idDepto) references Departamento(idDepto)
);

insert into Funcionario 
values 
(10, "Antonio", "M", 2000, 2),
(11, "Solange", "F", 3500,1),
(12,"Pedro","M", 3800,1),
(13,"Cristina","F",1700,4);

create table Departamento(
	idDepto int primary key,
    nomeD varchar(100)
);

insert into Departamento 
values
(1,"Tecnologia"),
(2,"Compras"),
(3,"RH"),
(4,"Vendas");

-- Criando uma View FuncDepto
create view FuncDepto as select Funcionario.nomeF,  Departamento.nomeD
from Funcionario, Departamento
where Funcionario.idDepto = Departamento.idDepto;
-- Para mostrar as Views
select * from FuncDepto;
-- Drop views
drop view FuncDepto;

-- renomear nomes na view 
create view FuncDepto2(nome_Funcionario, nome_Departamento) as select Funcionario.nomeF,  Departamento.nomeD
from Funcionario, Departamento
where Funcionario.idDepto = Departamento.idDepto;
select * from FuncDepto2;

-- Exemplo com Count() e sum()
create view Exemplo2(nomeDepto, NumFunc, TotalSalario) as select Departamento.nomeD, count(Funcionario.nomeF), sum(salario)
from Funcionario, Departamento
where Funcionario.idDepto = Departamento.idDepto
group by nomeD;

select * from Exemplo2;
select nomeDepto, NumFunc, TotalSalario
from Exemplo2
where nomeDepto= "Vendas";

-- Consultando uma view
create view Exemplo3 as select idFunc, nomeF
from Funcionario;
select * from Funcionario;

insert into Exemplo3 (idFunc, nomeF)
values(15,"Rogerio");