create database estudo;
use estudo;

create table Aluno(
	idAluno int primary key auto_increment,
	nome varchar(100),
    idade int 
);

insert into Aluno(nome, idade) values('Thiago', 20);

create table audi_Aluno(
	idAuditoria int primary key auto_increment,
    nomeAntigo varchar(100),
    nomeNovo varchar(100),
    idadeAntiga int
);



delimiter $
create trigger trg_update_Aluno before update on Aluno
for each row
begin
	
    if (old.nome <> new.nome or old.idade <> new.idade) then
		insert audi_Aluno(nomeAntigo, nomeNovo, idadeAntiga) values (old.nome, new.nome, old.idade);
    end if;
end
$
delimiter ;


update Aluno set nome = 'PH', idade = 19 where idAluno = 1;
select * from audi_Aluno;




delimiter $
create procedure proc_update_aluno_idade(
	IN p_idAluno INT,
    IN p_nova_idade INT,
    OUT p_nomeAntigo VARCHAR(100),
    OUT p_nomeNovo VARCHAR(100),
    OUT p_totalRegistrosAuditoria INT)
begin
	declare v_nome varchar(100);
    select nomeAntigo into v_nome from audi_Aluno where idAuditoria = p_idAluno;
	
    update Aluno set idade = p_nova_idade where idAluno = p_idAluno;
    
    set p_nomeAntigo = v_nome;
    
    -- Selecionar os nomes antigo e novo
    SELECT nome INTO p_nomeNovo
    FROM Aluno
    WHERE idAluno = p_idAluno;
    
    select count(*) into p_totalRegistrosAuditoria from audi_Aluno;
	
end
$
delimiter ;

-- Definir variáveis de saída
SET @nomeAntigo = '';
SET @nomeNovo = '';
SET @totalRegistrosAuditoria = 0;

call proc_update_aluno_idade(1,21,@nomeAntigo, @nomeNovo, @totalRegistrosAuditoria);

select @nomeAntigo, @nomeNovo, @totalRegistrosAuditoria;








drop procedure proc_update_aluno_idade;


