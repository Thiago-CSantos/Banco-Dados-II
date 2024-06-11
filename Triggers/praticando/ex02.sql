-- Criação da tabela products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    last_updated TIMESTAMP
);
select * from products;
insert into products(name,price,last_updated) values('nome', 2.69, CURRENT_TIMESTAMP);

update products set price = 2000.9 where id = 1;

delimiter $$
create trigger tr_updateProducts before update
on products for each row
begin
	if old.price != new.price then
		set new.last_updated = CURRENT_TIMESTAMP;
	end if;
end
$$
delimiter ;