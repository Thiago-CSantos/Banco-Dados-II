use aula_18_04;

-- Inserindo alguns clientes
INSERT INTO Cliente (nome, datanascimento, cpf) VALUES ('João Silva', '1990-05-15', '123.456.789-00');
INSERT INTO Cliente (nome, datanascimento, cpf) VALUES ('Maria Souza', '1985-10-20', '987.654.321-00');
INSERT INTO Cliente (nome, datanascimento, cpf) VALUES ('Pedro Oliveira', '1998-03-25', '456.789.123-00');

-- Inserindo alguns produtos
INSERT INTO Produto (cod_produ, descricao, preco, quantidade) VALUES (1, 'Camisa Polo', 50.00, 100);
INSERT INTO Produto (cod_produ, descricao, preco, quantidade) VALUES (2, 'Calça Jeans', 80.00, 80);
INSERT INTO Produto (cod_produ, descricao, preco, quantidade) VALUES (3, 'Tênis Esportivo', 120.00, 50);

-- Inserindo alguns pedidos
INSERT INTO Pedido (cod_cli, datapedito, nf, valor_total) VALUES (1, '2024-04-18', 'NF123', 150.00);
INSERT INTO Pedido (cod_cli, datapedito, nf, valor_total) VALUES (2, '2024-04-17', 'NF124', 200.00);
INSERT INTO Pedido (cod_cli, datapedito, nf, valor_total) VALUES (3, '2024-04-16', 'NF125', 300.00);

-- Inserindo itens de pedido
INSERT INTO ItemPedido (cod_ped, cod_prod, valor_unitario, quatidade) VALUES (1, 1, 50.00, 2);
INSERT INTO ItemPedido (cod_ped, cod_prod, valor_unitario, quatidade) VALUES (1, 2, 80.00, 1);
INSERT INTO ItemPedido (cod_ped, cod_prod, valor_unitario, quatidade) VALUES (2, 3, 120.00, 2);
INSERT INTO ItemPedido (cod_ped, cod_prod, valor_unitario, quatidade) VALUES (3, 4, 2000.00, 2);
