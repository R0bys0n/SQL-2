create function somaProduto (in numero1 integer,in numero2 integer, out soma integer, out produto integer)as $$
	select numero1 + numero2 as soma, numero1 * numero2 as produto;
$$ language sql;

select * from somaProduto(3,3);