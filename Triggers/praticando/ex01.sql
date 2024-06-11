
-- Criação da tabela employees
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Criação da tabela employees_audit
CREATE TABLE employees_audit (
    id INT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into employees(name,position, salary) values('Nomess', 'posicao', 2.69);
select * from employees_audit;


delimiter $$
create trigger tr_audit after insert
on employees for each row
begin
	insert into employees_audit(id, name, position, salary)
    values(new.id, new.name, new.position, new.salary);
end;
$$
delimiter ;


 
