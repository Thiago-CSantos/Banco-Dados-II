create database Aula27_02_2023;
use Aula27_02_2023;

create table Cliente(
cod_cli int primary key,
nome_cli varchar(40),
endereco varchar(40),
cidade varchar(40));

create table Vendedor(
cod_vend int primary key,
nome_vend varchar(40),
salario float(9,2),
cidade varchar(40));

create table produto(
cod_prod int primary key,
desc_prod varchar(30),
unid_prod varchar(3),
val_unit float(9,2));

create table pedido(
num_ped int primary key,
data_entr date,
cod_cli int,
cod_vend int,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_vend) references Vendedor (cod_vend));

create table ItemPedido(
num_ped int,
cod_prod int,
qtde_ped int,
preco float(9,2),
primary key(num_ped, cod_prod),
foreign key(num_ped) references Pedido (num_ped),
foreign key(cod_prod) references Produto (cod_prod));

select * from Cliente;
insert into Cliente values (1, "Alberto", "Rua das Flores, 100", "São Paulo");
insert into Cliente values (2, "Solange", "Av. São Pedro, 420", "São Paulo");
insert into Cliente values (3, "Marcelo", "Rua Jacob Bitar, 1190", "Jacareí");
insert into Cliente values (4, "João Pedro", "Rua Andradina, 200", "São João");

select * from vendedor;
insert into Vendedor values(200, "Fernando", 1200, "São João");
insert into Vendedor values(210, "Gabriel",1400, "São João");
insert into Vendedor values(220, "Carlos", 1200, "Campinas");
insert into Vendedor values(230, "Mariá", 3300, "Sorocaba");


select * from Produto;
insert into Produto values(11, "Bombom","un", 1.30);
insert into Produto values(12, "Cereja","kg", 45);
insert into Produto values(13, "Bolacha", "pct", 2.90);
insert into Produto values(14, "Pão", "un", 0.50);

select * from pedido;
insert into Pedido values (1, null,2,220);  
insert into Pedido values (2, "2024-04-12",1,210);  
insert into Pedido values (3, null,2,200);
insert into Pedido values (4, null,3, 220);

select * from itemPedido;
insert into itemPedido values (1,11,3, null);
insert into itemPedido values (1,13,1, null);
insert into itemPedido values(2,14,5, null); 
insert into itemPedido values(3,13,2, null); 

/*Exibir o nome do vendedor que possui salario maior do que todos os vendedores de São João"*/
select Vendedor.nome_vend, salario
from Vendedor
where Vendedor.salario > all (select Vendedor.salario from Vendedor where Vendedor.cidade = "São João");

/*Exibir o nome do cliente e a quantidade de pedidos que realizou*/
SELECT Cliente.nome_cli, (SELECT COUNT(*) FROM Pedido WHERE Pedido.cod_cli = Cliente.cod_cli)
FROM  Cliente;

/* para cada produto, mostar a quantidade de itens que foram vendidos deste produto */
SELECT Produto.desc_prod, (SELECT SUM(ItemPedido.qtde_ped) FROM ItemPedido WHERE ItemPedido.cod_prod = Produto.cod_prod) AS quantidade_itens_vendidos
FROM Produto;

/* para cada produto, mostar a quantidade de itens que foram vendidos deste produto, mostrar também a quantidade de pedidos que comprou cada produto*/
SELECT Produto.desc_prod, (SELECT SUM(ItemPedido.qtde_ped) FROM ItemPedido WHERE ItemPedido.cod_prod = Produto.cod_prod),
    (SELECT COUNT(DISTINCT ItemPedido.num_ped) FROM ItemPedido WHERE ItemPedido.cod_prod = Produto.cod_prod) 
    FROM Produto;

