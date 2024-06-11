/*Clientes que possuem pedido*/
select nome_cli
from Cliente
where cod_cli IN ( select cod_cli 
	from Pedido
    where Cliente.cod_cli = Pedido.cod_cli
);

/*Clientes que não possuem pedido*/
select nome_cli
from Cliente
where cod_cli NOT IN ( select cod_cli from pedido
);

/*Clientes que possuem pedido com o vendedor Gabriel*/
select * 
from Cliente 
where cod_cli IN ( select cod_cli
	from Pedido
	inner join Vendedor on Vendedor.cod_vend = Pedido.cod_vend
    where Vendedor.nome_vend = 'Gabriel'
);

/*Exibir o nome do vendedor que possui salário maior do que pelo menos 1 vendedor de São João"*/
select nome_vend
from Vendedor
where salario > (select max(salario)
	from Vendedor 
    where cidade = 'São João'
);
/*Exibir o nome do cliente e a quantidade de pedidos que realizou*/
select nome_cli, ( select COUNT(Pedido.num_ped)
	from Pedido
    where Cliente.cod_cli = Pedido.cod_cli
)
from Cliente;

/* para cada produto, mostar a quantidade de itens que foram vendidos deste produto */
select Produto.desc_prod, (select SUM(ItemPedido.qtde_ped)
	from ItemPedido
	where Produto.cod_prod = ItemPedido.cod_prod
) as QuantidadePedido
from Produto;
