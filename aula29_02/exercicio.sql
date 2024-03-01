create database aula29_02;
use aula29_02;

create table Aluno(
	matricula varchar(100),
	nome varchar(100),
    codCurso varchar(100),
    statuss boolean,
    primary key(matricula, codCurso),
    foreign key(codCurso) references Cursos(codigo)
);

create table Cursos(
	codigo varchar(10) primary key,
    nome varchar(100)
);

create table Professor(
	codProfessor int primary key,
    nome varchar(100)
);

create table Disciplina(
	codigoDisciplina varchar(100),
    descricao varchar(100),
    codProfessor int,
    primary key(codigoDisciplina, codProfessor),
    foreign key(codProfessor) references Professor(codProfessor)
);

create table Matricula(
	idMatricula int auto_increment,
    RaMatricula varchar(100),
    codCurso varchar(100), 
    ano int, 
    semestre int,
    primary key(idMatricula, RaMatricula, codCurso),
    foreign key(RaMatricula) references Aluno(matricula),
    foreign key(codCurso) references Cursos(codigo)
);

create table DiscMatricula(
	idMatricula int,
    codDsic varchar(100),
    codProf int,
    notas varchar(100),
    faltas float,
    situacao varchar(100),
    primary key(idMatricula, codDsic, codProf),
    foreign key(codProf) references Professor(codProfessor),
    foreign key(idMatricula) references Matricula(idMatricula)
);

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (codigo, nome) VALUES ('C001', 'Ciência da Computação');
INSERT INTO Cursos (codigo, nome) VALUES ('C002', 'Engenharia Elétrica');
-- Inserindo dados na tabela Professor
INSERT INTO Professor (codProfessor, nome) VALUES (1, 'João Silva');
INSERT INTO Professor (codProfessor, nome) VALUES (2, 'Maria Santos');
-- Inserindo dados na tabela Aluno
INSERT INTO Aluno (matricula, nome, codCurso, statuss) VALUES ('A001', 'Pedro Oliveira', 'C001', true);
INSERT INTO Aluno (matricula, nome, codCurso, statuss) VALUES ('A002', 'Ana Souza', 'C002', true);
-- Inserindo dados na tabela Disciplina
INSERT INTO Disciplina (codigoDisciplina, descricao, codProfessor) VALUES ('D001', 'Programação', 1);
INSERT INTO Disciplina (codigoDisciplina, descricao, codProfessor) VALUES ('D002', 'Circuitos Elétricos', 2);
-- Inserindo dados na tabela Matricula
INSERT INTO Matricula (RaMatricula, codCurso, ano, semestre) VALUES ('A001', 'C001', 2024, 1);
INSERT INTO Matricula (RaMatricula, codCurso, ano, semestre) VALUES ('A002', 'C002', 2024, 1);
-- Inserindo dados na tabela DiscMatricula
INSERT INTO DiscMatricula (idMatricula, codDsic, codProf, notas, faltas, situacao) VALUES (1, 'D001', 1, 'Aprovado', 0, 'Regular');
INSERT INTO DiscMatricula (idMatricula, codDsic, codProf, notas, faltas, situacao) VALUES (2, 'D002', 2, 'Reprovado', 3, 'Irregular');

-- Exibir os dados
-- 01)
select Aluno.nome 
from Aluno
inner join Cursos
on Aluno.codCurso = Cursos.codigo 
where Cursos.nome = 'Engenharia Elétrica';

-- 02)
