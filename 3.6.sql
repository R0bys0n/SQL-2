CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    primeiro_nome VARCHAR(255) NOT NULL,
    ultimo_nome VARCHAR(255) NOT NULL, 
    data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL, 
    categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
    aluno_id INTEGER NOT NULL REFERENCES aluno(id),
    curso_id INTEGER NOT NULL REFERENCES curso(id),
    PRIMARY KEY (aluno_id, curso_id)
);





CREATE FUNCTION cria_curso(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS void AS $$ 
    DECLARE
		id_categoria integer;
    BEGIN
    	select id into id_categoria from categoria where nome = nome_categoria;
		
		if not found then 
			insert into categoria (nome) values (nome_categoria) returning id into id_categoria;
		end if;

		insert into curso (nome, categoria_id) values (nome_curso, id_categoria);
    END;
$$ LANGUAGE plpgsql;

select  cria_curso ('Java', 'Programação')
select * from curso;
select * from categoria;




