create sequence eu_criei;

--select nextval  ('eu_criei');
--select currval  ('eu_criei');

create temporary table auto (
 id integer primary key default nextval ('id_auto'),
 nome varchar(30) not null
);

insert into auto (nome) values ('Robyson');

insert into auto (id, nome) values (4, 'Robyson');

insert into auto (nome) values ('outro nome');

select * from auto;

create type classificacao as enum ('LIVRE', '12_anos','14_anos','16_anos','18_anos');

create temporary table filme (
id serial primary key,
nome varchar (255) not null,
classificacao classificacao
);

insert into filme (nome, classificacao) values ('Um filme qualquer', '18_anos')


select * from filme;