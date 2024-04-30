create table teste1(a1 int);
create table teste2(a2 int);
create table teste3(a3 int not null auto_increment primary key);
create table teste4(a4 int not null auto_increment primary key, b4 int default 0);

# inserir valores na tabela Teste3
insert into teste3 (a3) VALUES (NULL), (NULL), (NULL), (NULL),(NULL), 
								(NULL), (NULL), (NULL), (NULL),(NULL);
                                
# Inserir Valores na tabela Teste4
insert into teste4 (a4) VALUES (0),(0),(0),(0),(0),(0),(0),(0),(0),(0);

select * from teste3;
select * from teste4;


delimiter &&
create trigger triggerTeste
before INSERT ON teste1
	FOR each row begin
		insert into teste2 (a2) values (new.a1);
        delete from teste3 where a3 = new.a1;
        update teste4 set b4 = b4+1 where a4 = new.a1;
	end;
    &&
    delimiter ;
    
    
    
insert into teste1 (a1) values (9);

select * from teste1;
select * from teste2;
select * from teste3;
select * from teste4;

show triggers;