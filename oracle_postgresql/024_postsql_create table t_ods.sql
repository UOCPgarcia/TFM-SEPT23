-- Table: public.t_ods

DROP TABLE IF EXISTS public.t_ods;

CREATE TABLE public.t_ods
as select esquema
,id_cliente
,ds_cliente
,id_eje
,id_claso
,ds_claso
,id_clasp
,ds_clasp
,id_clase
,ds_clase
,objetivo
,meta
,sinergia
from tfm_apli_gastos
where id_cliente = '2000' -- Diputacion
and id_eje = '2022'
;
