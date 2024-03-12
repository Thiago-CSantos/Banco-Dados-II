drop database Empresa;
create database Empresa;
use Empresa;

create table Cliente(
cod_cli int primary key,
nome_cli varchar(40),
endereco varchar(40),
cidade varchar(40));

create table Vendedor(
cod_vend int primary key,
nome_vend varchar(40),
salario decimal(9,2));

create table produto(
cod_prod int primary key,
desc_prod varchar(30),
unid_prod varchar(3),
val_unit decimal(9,2));

create table pedido(
num_ped int auto_increment primary key,
data_entr date,
cod_cli int,
cod_vend int,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_vend) references Vendedor (cod_vend));

create table ItemPedido(
num_ped int,
cod_prod int,
qtde_ped int,
preco numeric(9,2),
primary key(num_ped, cod_prod),
foreign key(num_ped) references Pedido (num_ped),
foreign key(cod_prod) references Produto (cod_prod));

select * from Cliente;
insert into Cliente values (1, "Alberto", "Rua das Flores, 100", "São Paulo");
insert into Cliente values (2, "Solange", "Av. São Pedro, 420", "São Paulo");
insert into Cliente values (3, "Marcelo", "Rua Jacob Bitar, 1190", "Jacareí");

select * from vendedor;
insert into Vendedor values(200, "Fernando", 1200);
insert into Vendedor values(210, "Gabriel",1400);
insert into Vendedor values(220, "Carlos", 1200);

select * from Produto;
insert into Produto values(11, "Bombom","un", 1.30);
insert into Produto values(12, "Cereja","kg", 45);
insert into Produto values(13, "Bolacha", "pct", 2.90);
insert into Produto values(14, "Pão", "un", 0.50);

select * from pedido;
insert into Pedido values (null, "2024-02-10",2,220);  
insert into Pedido values (null, "2024-03-14",1,210);  
insert into Pedido values (null, "2024-03-18",2,200);
insert into Pedido values (null, "2024-02-15",3, 220);

select * from itemPedido;
insert into itemPedido values (2,11,3, null);
insert into itemPedido values (2,13,1, null);
insert into itemPedido values(3,14,5, null); 
insert into itemPedido values(4,13,2, null); 

# 1) Criar uma view para exibir a quantidade de pedidos do cliente Alberto.alter.
create view Exibirquantidade as select Cliente.nome_cli 
from Pedido 
inner join Cliente on Pedido.cod_cli = Cliente.cod_cli
where Cliente.nome_cli = "Alberto";
select * from Exibirquantidade;

#2) Criar uma view para exibir o numero do pedido, a descrição dos produtos e o nome do vendedor de todos os pedidos.
create view ExibirPedidoDescProdutoNomeVendedor as select Pedido.num_ped, Produto.desc_prod, Vendedor.nome_vend
from Pedido
inner join ItemPedido on ItemPedido.num_ped = Pedido.num_ped
inner join Produto on ItemPedido.cod_prod = Produto.cod_prod
inner join Vendedor on Pedido.cod_vend = Vendedor.cod_vend;
select * from ExibirPedidoDescProdutoNomeVendedor; 

#3) Criar uma view para exibir o nome dos vendedores que possuem pedidos a serem entregues
create view ExibirVendedoreData as select Vendedor.nome_vend
from Pedido 
inner join Vendedor on Vendedor.cod_vend = Pedido.cod_vend
where Pedido.data_entr > current_date(); # ou 12/03/2024
select * from ExibirVendedoreData;

#4) Criar uma view para encontrar a quantidade de pedidos agrupados por cidade de origem.
create view QuantPedidoCidade as select count(Itempedido.qtde_ped), Cliente.cidade
from ItemPedido
inner join Pedido on ItemPedido.num_ped = Pedido.num_ped
inner join Cliente on Cliente.cod_cli = Pedido.cod_cli
group by Cliente.cidade;
drop view QuantPedidoCidade;
select * from QuantPedidoCidade;

#5) Criar uma view para encontrar o nome dos clientes que possuem pelo menos 2 pedidos
create view EncontraCliente as select Cliente.nome_cli, count(Pedido.num_ped )
from Cliente
inner join Pedido on Pedido.cod_cli = Cliente.cod_cli
group by Cliente.nome_cli
having count(Pedido.num_ped) >= 2;

#6) Criar uma view Encontrar o nome dos clientes que possuem pedidos com mais de 3 itens vendidos. Obs. Eliminar os clientes duplicados.
create view Encontrar6 as select Cliente.nome_cli
from Cliente
inner join Pedido on Pedido.cod_cli = Cliente.cod_cli
inner join ItemPedido on ItemPedido.num_ped = Pedido.num_ped
group by Cliente.nome_cli, Pedido.num_ped
having count(ItemPedido.cod_prod) > 3; 
drop view Encontrar6;
select distinct * from Encontrar6;