drop function primeiraPL;
create or replace function primeiraPL() returns integer as $$
	declare
		variavel1 integer default 3;
	begin
		variavel1 = variavel1 * 2;
		---
			declare --quando declara dentro do pai o filho é uma declaração a parte então não sera apresentado
				variavel1 integer; -- se quiser que apresente o filho não pode declarar ele
			begin
				variavel1 := 7;
			end;
		---
		return variavel1;
	end	
$$ language plpgsql;

select primeiraPL();