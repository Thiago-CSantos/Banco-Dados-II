create database aula_18_04;
use aula_18_04;

create table Cliente(
	cod_cli int primary key auto_increment,
    nome varchar(100),
    datanascimento varchar(19),
    cpf varchar(19)
);

create table Produto(
	cod_produ int primary key,
    descricao varchar(100),
    preco double,
    quantidade int
);
select * from Produto;
create table Pedido(
	codigo_pedido int auto_increment,
    cod_cli int,
    datapedito varchar(100),
    nf varchar(100),
    valor_total double,
    primary key(codigo_pedido, cod_cli),
    foreign key (cod_cli) references Cliente(cod_cli)
);
select * from Pedido;
create table ItemPedido(
	cod_ped int,
    cod_prod int, 
    valor_unitario double,
    quatidade int,
    primary key(cod_ped,cod_prod)
);
/*
CREATE TRIGGER nome momento evento
ON tabela
FOR EACH ROW
BEGIN
corpo do código
END
*/
#1)
delimiter $$
	create trigger Trigger01 before delete
    on Pedido
    FOR EACH ROW
    begin
		delete from ItemPedido where cod_ped = old.codigo_pedido;
    end
    
$$
delimiter ;
drop trigger Trigger01;
DELETE FROM Pedido WHERE codigo_pedido = 2;


delimiter $$ 

create trigger Trigger02 after insert
on ItemPedido
for each row
begin
	update Produto set Produto.quantidade = Produto.quantidade - new.quatidade
    where Produto.cod_produ = new.cod_prod;
end

$$
delimiter ;
    
    INSERT INTO ItemPedido (cod_ped, cod_prod, valor_unitario, quatidade) VALUES (1, 3, 2000.00, 60);
    
    select * from ItemPedido;
    
    delimiter $$ 

create trigger Trigger03 after insert
on ItemPedido
for each row
begin
	update Pedido set Pedido.valor_total = Pedido.valor_total + (new.quatidade * ItemPedido.quatidade)
    where Pedido.codigo_pedido = new.cod_ped;
end

$$
delimiter ;
drop trigger Trigger03;
 INSERT INTO ItemPedido (cod_ped, cod_prod, valor_unitario, quatidade) VALUES (4, 2, 2000.00, 6);
 select *from Pedido;