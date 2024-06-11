-- Criação da tabela inventory
CREATE TABLE inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT
);

-- Criação da tabela sales
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity_sold INT
);

select * from inventory;
select * from sales;

delimiter $$
create trigger tr_inventory after insert 
on sales for each row
begin
	
	update inventory set quantity = quantity - new.quantity_sold where product_name =  new.product_name;
    
end
$$ 
delimiter ;


-- Inserção de dados na tabela inventory
INSERT INTO inventory (product_name, quantity) VALUES ('Product A', 100);
INSERT INTO inventory (product_name, quantity) VALUES ('Product B', 200);

-- Inserção de dados na tabela sales
INSERT INTO sales (product_name, quantity_sold) VALUES ('Product A', 10);
INSERT INTO sales (product_name, quantity_sold) VALUES ('Product B', 20);

SET SQL_SAFE_UPDATES = 0;
