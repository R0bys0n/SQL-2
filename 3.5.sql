drop function salarioOk;
create or replace function salarioOk (id_instrutor integer) returns varchar as $$
	declare
		instrutor instrutor;
	
	begin
		select * from instrutor where id = id_instrutor into instrutor;
		/*-- if wage 
		if instrutor.salario > 300 then
			return 'salario esta ok';
		elseif instrutor.salario = 300 then
			return 'Salario pode aumentar';
		else
			return 'salario esta defasado';
		end if;*/

		case instrutor.salario
			when 100 then
				return 'salario muito baixo';
			when 200 then
				return 'salario baixo';
			when 300 then
				return 'salario ok';
			else 
				return 'salario otimo';				
		end case;
	end;
$$ language plpgsql;

select nome, salarioOk (instrutor.id) from instrutor;

create or replace function tabuada (numero integer) returns setof integer as $$
declare
begin
	RETURN NEXT numero * 1;
    RETURN NEXT numero * 2;
    RETURN NEXT numero * 3;
    RETURN NEXT numero * 4;
    RETURN NEXT numero * 5;
    RETURN NEXT numero * 6;
    RETURN NEXT numero * 7;
    RETURN NEXT numero * 8;
    RETURN NEXT numero * 9;
end;
$$ language plpgsql;

select tabuada(2);



drop function tabuada2;

create or replace function tabuada2 (numero integer) returns setof varchar as $$
declare
multiplicador integer default 1;
begin
	 while multiplicador < 10 loop
		return next numero || ' * ' || multiplicador || ' = ' || numero * multiplicador;

		multiplicador := multiplicador +1;

	end loop;
end;
$$ language plpgsql;

select tabuada2(9);



create or replace function tabuada3 (numero integer) returns setof varchar as $$
declare
multiplicador integer default 1;
begin

	for multiplicador in 1..9 loop
		return next numero || ' * ' || multiplicador || ' = ' || numero * multiplicador;
	end loop;
end;
$$ language plpgsql;

select tabuada3(9);


drop function instrutorSalario;
create function instrutorSalario(out nome varchar, out salarioOk varchar) returns setof record as $$
declare
	instrutor instrutor;
	begin
		for instrutor in select * from instrutor loop
			nome := instrutor.nome;
			salarioOk := salarioOk(instrutor.id);
			return next;
		end loop;
	end;
$$ language plpgsql;

select * from instrutorSalario();



