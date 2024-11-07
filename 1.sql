CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    primeiro nome VARCHAR(255) NOT NULL,
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

DROP TABLE aluno, categoria, curso, aluno_curso;

CREATE SCHEMA academico;

CREATE TABLE academico.aluno (
    id SERIAL PRIMARY KEY,
    primeiro nome VARCHAR(255) NOT NULL,
    ultimo_nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL
);


CREATE TABLE academico.categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE academico.curso (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);


CREATE TABLE academico.aluno_curso (
    aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
    curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
    PRIMARY KEY (aluno_id, curso_id)
);