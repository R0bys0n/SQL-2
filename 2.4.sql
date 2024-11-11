CREATE FUNCTION primeiraFuncao() RETURNS integer AS '
    select (5 -3) *2
' LANGUAGE SQL;

select primeiraFuncao() as numero;


create function somaDoisNumeros (qualquer integer, coisa integer) returns integer as '
 select qualquer + coisa
'language SQL;

select somaDoisNumeros(7,13)

create table a (nome varchar(255)not null);
drop function cria;
create or replace function cria (nome varchar) returns void as $$
insert into a (nome) values('robyson');
$$language sql;

select cria ('Robyson');