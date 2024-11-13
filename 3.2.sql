create table instrutor (
id serial primary key,
nome varchar (255) not null,
salario decimal (10, 2)
);


insert into instrutor (nome, salario) values ('robyson', 100);
insert into instrutor (nome, salario) values ('agatha', 200);
insert into instrutor (nome, salario) values ('erika', 300);
insert into instrutor (nome, salario) values ('roger', 400);
insert into instrutor (nome, salario) values ('ilka', 500);

create function dobroDoSalario (instrutor) returns decimal as $$
select $1.salario * 2 as dobro;
$$ language sql;

select nome, dobroDoSalario (instrutor.*) as desejo from instrutor;


create or replace function criaInstrutorFalso() returns instrutor as $$
	begin
		return row (22, 'nome falso', 200::decimal)::instrutor;
	end;
$$ language plpgsql;

select id, salario from criaInstrutorFalso();

drop function instrutoresBemPagos;
create function instrutoresBemPagos (valorSalario decimal) returns setof instrutor as $$
	begin
		return query select * from instrutor where salario > valorSalario;
	end;
$$ language plpgsql;

select * from instrutoresBemPagos(200);