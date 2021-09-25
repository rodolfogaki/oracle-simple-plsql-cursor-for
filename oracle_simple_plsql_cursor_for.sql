--#ex.1
DECLARE
    cursor cur_pessoa_ativa is
           select p.nome_completo,p.email
             from pessoa p
            where 1=1
              and p.status = 'A'
           ;
    --
    reg_pessoa_ativa cur_pessoa_ativa%rowtype;
BEGIN
    for reg_pessoa_ativa in cur_pessoa_ativa loop
        dbms_output.put_line(reg_pessoa_ativa.nome_completo||' - '||reg_pessoa_ativa.email);
    end loop;
END;

--#ex.2
DECLARE
    reg_pessoa_ativa pessoa%rowtype;
BEGIN
    for reg_pessoa_ativa in (
        select *
          from pessoa p
         where 1=1
           and p.status = 'A'

    ) loop
        dbms_output.put_line(reg_pessoa_ativa.nome_completo||' - '||reg_pessoa_ativa.email);
    end loop;
END;

/*
-- CRIACAO DE TABELAS
CREATE TABLE pessoa (
    id_pessoa NUMBER(11) NOT NULL,
    nome_completo VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    dt_nascimento DATE NOT NULL,
    sexo VARCHAR2(1) NOT NULL,
    status VARCHAR2(1) NOT NULL, --I=INATIVO,A=ATIVO
    PRIMARY KEY (id_pessoa)
);
-- INCLUSAO DE INFORMACOES
insert into pessoa values (1,'João Henrique da Silva','joaohs@joaohs.com',to_date('01/01/1990','dd/mm/yyyy'),'M','A');
insert into pessoa values (2,'Ana Patrícia Monteiro Dias','anapmd@anapmd.com',to_date('05/05/2006','dd/mm/yyyy'),'F','A');
insert into pessoa values (3,'Carlos José Pinheiro','carlosjp@carlosjp.com',to_date('05/05/2006','dd/mm/yyyy'),'M','I');
*/