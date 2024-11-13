


create table logInstrutor (
	id serial primary key,
	informacao varchar (255),
	criacao timestamp default current_timestamp
);


---Inserir instrutores (com salários).
create function criaInstrutor (nomeInstru varchar, salarioInstru decimal) returns void as $$
	declare
		id_instrutorIn integer;
		mediaSalarial decimal;
		instrutor_menos integer default 0;
		total_instrutores integer default 0;
		salario decimal;
		percentual decimal;
	begin
		insert into instrutor (nome, salario) values (nomeInstru, salarioInstru) returning id into id_instrutorIn;
		 
		 --Se o salário for maior do que a média, salvar um log.
		select avg (instrutor.salario) into mediaSalarial from instrutor where id <> id_instrutorIn;
		
		if salarioInstru > mediaSalarial then
			insert into logInstrutor (informacao) values (nomeInstru || 'Recebe acima da média');
		end if;

		---Salvar outro log dizendo que fulano recebe mais do que X% da grade de instrutores
		for salario in select instrutor.salario from instrutor where id <> id_instrutorIn loop
			total_instrutores := total_instrutores + 1;

			if salarioInstru > salario then 
				instrutor_menos := instrutor_menos + 1;
			end if;
		end loop;

		percentual = instrutor_menos::decimal / total_instrutores::decimal * 100;	

		insert into logInstrutor (informacao)
			values (nomeInstru || 'recebe mais do que ' || percentual ||'% da grade de instrutores');
	end;
$$ language plpgsql

select * from instrutor;
select criaInstrutor ('Fulano', 1000);
select * from logInstrutor;