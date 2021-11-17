/*Un trigger que impida que en un mes determinado se ponga como jefe a alguien que 
haya pedido un permiso de más de 15 días en el mismo mes*/
create or replace function tg_permiso() returns trigger
as
$tg_permiso$
declare
t_permiso int;
begin
select max(duracion_permiso)into t_permiso from permiso
where duracion_permiso=new.duracion_permiso;
if (t_permiso>= 15) then
raise EXCEPTION 'ESTE EMPLEADO NO PUEDE SER JEFE HA EXEDIDO EL MAXIMO DE PERMISOS';
else
raise notice 'SI PUEDE SER JEFE';
return new;
end if;
end;
$tg_permiso$
language 'plpgsql';
create trigger tg_permiso after insert
on permiso for each row
execute procedure tg_permiso();
