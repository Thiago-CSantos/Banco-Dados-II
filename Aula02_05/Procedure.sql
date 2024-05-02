create database aula02_05;
use aula02_05;

delimiter $$
create procedure Ola(in variavel INTEGER)
begin
	if variavel = 5 then 
    select "Ola" As Mensagem;
    end if;
end
$$
delimiter ;


call Ola(5);
    
    



delimiter $$
create procedure Ola(in variavel INTEGER)
begin
	if variavel = 5 then 
    select "Ola" As Mensagem;
    end if;
end
$$
delimiter ;

call Ola(5);





create table correntista(
id int auto_increment primary key,
nome varchar(60) not null unique,
cpf varchar(20) not null,
dt_cadastro timestamp default current_timestamp
);

insert into correntista values(null, "Valter", "123", current_timestamp());
insert into correntista values(null, "Pedro", "321", current_timestamp());

select * from correntista;

delimiter $$
create procedure InserirCorrentista(IN Vnome varchar(60), IN Vcpf varchar(20)) BEGIN

	if((Vnome != "")&&(Vcpf!=""))then 
		insert into correntista(nome, cpf) values (Vnome, Vcpf);
	else
		select "NOME e CPF devem serfornecidos para o cadastro!" as Msg;
	end if;
end
$$
delimiter ;

call InserirCorrentista("Thiago Carretero", "888.888-88");
call InserirCorrentista("", "");


delimiter $$ 
create procedure UpdateCorrentista(v_id INT, v_nome varchar(60), v_cpf varchar(12))
begin
	if((v_id > 0) AND(v_nome != "") AND(v_cpf != "")) then
		UPDATE correntista SET nome = v_nome, cpf = v_cpf where id = v_id;
    else
		select "Os novos NOME e CPF fmnsakfjsd.fjl" as MSg;
	end if;
end
$$
delimiter ;

call UpdateCorrentista(1, "NovoNome", "888.888-88");

delimiter $$
create procedure ContCorrentista01(OUT qtd int)
begin 
	select count(*) into qtd from correntista;
end;
$$ 
delimiter ;


call ContCorrentista(@total);

select @total;
drop procedure QuadradoCorrentista;

delimiter $$
create procedure QuadradoCorrentista(INOUT valor double, OUT quadrado2 double)
begin
	set quadrado2 = valor * valor;
	select valor * valor as NumeroAoQuadrado;
    set valor = valor * valor;
end;
$$
delimiter ;

call QuadradoCorrentista(7, @ValorSaindo);
select @ValorSaindo;


delimiter $$
create procedure QuadradoCorrentista02(INOUT valor double)
begin
    set valor = valor * valor;
end;
$$
delimiter ;

set @total = 2;
call QuadradoCorrentista02(@total);
select @total;

