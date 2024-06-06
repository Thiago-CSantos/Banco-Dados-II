create database Livraria;
use Livraria;

CREATE TABLE autor (
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE,
    pais VARCHAR(50)
);

insert into autor values(null, "Deitel","1973-12-22", "França");
insert into autor values(null, "Rafael Santos","1988-07-15", "Brasil");

CREATE TABLE livros (
    livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autor(autor_id)
);

insert into livros values (null, "Banco de Dados", "Programação", 140,1);
insert into livros values (null, "Programando em Java", "Programação", 122,2);


CREATE TABLE vendas (
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    preco_total DECIMAL(10,2),
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id)
);

# Exercícios:

# Criar uma trigger será acionada antes de uma inserção na tabela vendas. Esta trigger irá calcular o preco_total automaticamente, baseado no preço do livro e na quantidade vendida.

DELIMITER $$
create trigger NomeTrigger before insert
on Vendas 
FOR EACH ROW
begin
	
	DECLARE variavel decimal(10,2);
    select preco into variavel from livros where livro_id = NEW.livro_id;
    
    set new.preco_total = new.quantidade * variavel;
end
$$
DELIMITER ;

insert into Vendas (livro_id, data_venda, quantidade) values(1, "2024-06-06", 5);

select * from vendas;
drop trigger NomeTrigger;
# Criar uma procedure para adicionar uma nova venda. Essa procedure receberá o livro_id, a data_venda e a quantidade, e realizará a inserção na tabela vendas

DELIMITER $$
create Procedure NomeDaProcedure(IN P_livro_id int, IN P_data_venda DATE, IN p_quantidade int)
begin 
	declare v_precoLivro decimal(10,2);
    declare v_preco_total decimal(10,2);
    
    select preco into v_precoLivro from livros where livro_id = P_livro_id;
    
    set v_preco_total = v_precoLivro * p_quantidade;
    
    insert into Vendas (livro_id, data_venda, quantidade) values(P_livro_id, P_data_venda, p_quantidade, v_preco_total);
    
end
$$
DELIMITER ;

drop procedure NomeDaProcedure;