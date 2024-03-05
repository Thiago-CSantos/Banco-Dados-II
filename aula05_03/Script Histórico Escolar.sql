create database HistoricoEscolar;
use HistoricoEscolar;

create table Curso(
codCurso int primary key,
descricao varchar(40));

insert into Curso values
(1,"Engenharia de Software"),
(2,"Medicina"),
(3,"Direito"),
(4,"Administração"),
(5,"Publicidade");
select * from Curso;

create table Aluno(
ra varchar(10) primary key,
nome varchar(40),
status varchar(10),
codCurso int,
foreign key(codCurso) references Curso(codCurso) on delete restrict);

insert into Aluno values
("1234","Caio","Cursando",1),
("2345","Andre","Cursando",2),
("3456","Igor","Trancado",1),
("4567","Gustavo","Cursando",1),
("5678","Yago","Cursando",5);
select * from Aluno;

create table Disciplina(
codDisc int primary key,
descricao varchar(40));

insert into Disciplina values
(1,"Algoritmos"),
(2,"Gestão de Projetos"),
(3,"Paradigmas"),
(4,"Banco de Dados"),
(5,"Marketing"),
(6,"Banco de Dados II");
select * from disciplina;

create table Professor(
codProf int primary key,
nome varchar(40));

insert into Professor values
(10,"Adriana"),
(11,"Cristiane"),
(12,"Claudete"),
(13,"Tiago"),
(14,"Rogério");
select * from professor;

create table Matricula(
matricula int auto_increment,
ra varchar(10),
codDisc int,
codProf int,
nota double(4,2),
faltas int,
situacao varchar(10),
primary key(matricula),
foreign key(ra) references Aluno(ra) on delete restrict,
foreign key(codDisc) references Disciplina(codDisc) on delete restrict,
foreign key(codProf) references Professor(codProf) on delete restrict);

insert into Matricula values
(null,"2345",1,12,10,1,"Aprovado"),
(null,"5678",4,10,8,4,"Reprovado"),
(null,"5678",1,11,2,4,"Reprovado"),
(null,"5678",2,12,3,4,"Reprovado"),
(null,"1234",2,14,5,5,"Aprovado"),
(null,"4567",5,11,8,4,"Aprovado"),
(null,"3456",3,13,9,3,"Aprovado"),
(null,"3456",6,10,7.5,0,"Aprovado");

-- 1) Exibir o nome dos alunos que cursam Engenharia de Software
select Aluno.nome from Aluno
inner join Curso on Aluno.codCurso = Curso.codCurso
where Curso.descricao = "Engenharia de Software";

-- 2) Exibir o nome dos alunos que cursam a disciplina Banco de Dados II
select Aluno.nome from Aluno
inner join Matricula on Matricula.ra = Aluno.ra
inner join disciplina on Matricula.codDisc = Disciplina.codDisc
where Disciplina.descricao = "Banco de Dados II";

-- 3) Exibir a quantidade de alunos matriculados no curso de Medicina
select count(Aluno.nome) from Aluno
inner join Curso on Aluno.codCurso = Curso.codCurso
where Curso.descricao = "Medicina";

-- 4) Exibir a quantidade de alunos matriculados por curso
select count(Aluno.nome), Curso.descricao
from Aluno
inner join Curso on Curso.codCurso = Aluno.codCurso
group by Curso.descricao;

-- 5) Exibir os alunos que reprovaram na disciplina de Algoritmos
select count(Aluno.nome) 
from Aluno
inner join Matricula on Matricula.ra = Aluno.ra
inner join Disciplina on Disciplina.codDisc = Matricula.codDisc
where Disciplina.descricao = "Algoritmos" and Matricula.situacao = "Reprovado";

-- 6)  Exibir o nome do aluno, descrição do curso, a descrição das disciplinas cursadas com o nome do respectivo professor, nota, falta e situação
select DISTINCT Aluno.nome, Curso.descricao, Disciplina.descricao, Professor.nome, Matricula.nota, Matricula.faltas, Matricula.situacao
from Aluno
inner join Matricula on Matricula.ra = Aluno.ra
inner join Curso on Curso.codCurso = Aluno.codCurso
inner join Disciplina on Disciplina.codDisc = Matricula.codDisc
inner join Professor on Professor.codProf = Matricula.codProf;

-- 7)  Exibir as disciplinas cursadas pelo aluno André
select distinct Aluno.nome, Disciplina.descricao
from Disciplina
inner join Matricula on Matricula.codDisc = Disciplina.codDisc
inner join Aluno on Aluno.ra = Matricula.ra
where Aluno.nome = "Andre";

-- 8) Exibir o nome dos alunos que reprovaram em mais de duas disciplinas
select distinct Aluno.nome
from Aluno
inner join Matricula on Matricula.ra = Aluno.ra
inner join Disciplina on Disciplina.codDisc = Matricula.codDisc
where Matricula.situacao = "Reprovado";
