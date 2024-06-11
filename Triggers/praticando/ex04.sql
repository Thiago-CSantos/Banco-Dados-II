CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Criação da tabela customers_history
CREATE TABLE customers_history (
    id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


delimiter $$
create trigger tr_copyDados before update 
on customers for each row
begin
	insert into customers_history(id, name, email, phone) values (old.id, old.name, old.email, old.phone);
end
$$
delimiter ;

insert into customers(name, email, phone) values('Thiago', 'thiao@hfjds', '19-999-999');

select * from customers_history;

update customers set phone = '19-4651484445' where id = 1;