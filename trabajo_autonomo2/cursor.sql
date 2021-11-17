/*Un cursor que muestre por año la cantidad de dinero pagada en total de sueldos a cada departamento.*/
do $$
declare 
	año int := 2020;
	total_sueldo money :=0;
	sueldo1 record;
	cur_tsueldo cursor for 
	select fecha_contrato,sueldo from contrato;
	
BEGIN 

	OPEN cur_tsueldo;
	FETCH cur_tsueldo INTO sueldo1;
	while (found) loop 
	if (extract (year from sueldo1.fecha_contrato)= año) then
	total_sueldo := total_sueldo + sueldo1.sueldo;
	end if;
	FETCH cur_tsueldo INTO sueldo1;
	end loop;
raise Notice 'Sueldo total pagado en el año % = %',año, total_sueldo;	
END $$	
language 'plpgsql';


