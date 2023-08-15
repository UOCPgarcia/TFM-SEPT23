-- PROCEDURE: public.upd_obj_metas()

CREATE OR REPLACE PROCEDURE public.upd_obj_metas(argu_long NUMERIC
	)
LANGUAGE 'plpgsql'
AS $BODY$
declare
    -- programas de gasto
c_pro CURSOR FOR
select distinct (substr (id_clasp,
                         1,
                         argu_long)) id_clasp
           from public.t_ods
          where id_cliente = '2000' and id_eje = '2022';
 -- economicas
c_eco CURSOR(argu_pro varchar(argu_long)) FOR
select   substr (id_clase,
                 1,
                 argu_long) id_clase,
         min (objetivo) objetivo,
         min (meta) meta
    from public.t_ods
   where id_cliente = '2000'
     and id_eje = '2022'
     and substr (id_clasp,
                 1,
                 argu_long) = argu_pro
group by substr (id_clase,
                 1,
                 argu_long);
 -- variables necesarias

 pro_data record; 
 eco_data record;

begin
  open c_pro;

  loop
    fetch c_pro
     into pro_data;

    exit when not found;

    open c_eco (pro_data.id_clasp);

    loop
      fetch c_eco
       into eco_data;

      exit when not found;

      update tfm_apli_gastos
         set objetivo = eco_data.objetivo,
             meta = eco_data.meta
       where substr (id_clasp,
                     1,
                     argu_long) = pro_data.id_clasp
         and substr (id_clase,
                     1,
                     argu_long) = eco_data.id_clase
		 and objetivo is null			 
         and (id_cliente <> '2000' or (id_cliente = '2000' and id_eje < '2019'));
    end loop;

    close c_eco;
  end loop;

  close c_pro;
end;
$BODY$;
ALTER PROCEDURE public.upd_obj_metas()
    OWNER TO postgres;
