/*Procedimiento almacenado que devuelva los nombres del empleados que han estado en 
un departamento y la fecha de ingreso, al ingresar el nombre del departamento
*/

create or replace function info_departamento (varchar)
returns table (nombre_empleado varchar, area varchar ,fecha date)
as
$$
select 
nombre_empleado, ad.area_departamento as area,  ad.fecha_inicio as fecha
from empleado
inner join area_departamento ad  on empleado.id_area=ad.id_area
where ad.area_departamento = $1
$$
language SQL;

SELECT * FROM info_departamento('LIMPIEZA');