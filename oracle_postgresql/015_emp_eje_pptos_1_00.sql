set linesize 4000
set head off
set echo off
set termout off
set feedback off
set verify off
set SERVEROUTPUT ON SIZE 1000000

spool /accesounix/datos/tfm_apli_ingresos.csv append

-- orden de aplicaciones en el sql
-- columnas
-- B  esquema de conexión
-- C  id de entidad
-- D  entidad

declare
  v_datos_cab    varchar2 (200);
  v_datos        varchar2 (4000);

  cursor empresa
  is
    select min (adm_ser.obtener_cd_esquema_actual) esquema_conexion,
           min (id_empresa) id_empresa,
           min (ds_empresa) ds_empresa,
           min (cdi_empresa) cdi_empresa
      from adm_empresa
     where cdi_empresa = ns_4.lee_empresa_para_conta;

  -- ejercicio contable
  cursor ejercicio (
    argu_cdi_empresa  number)
  is
    select   oee.cdi_eje,
             oee.id_eje
        from ns_og_empeje oee
       where oee.emp_cdi_empresa = argu_cdi_empresa and oee.id_eje >= '2015'
    order by oee.id_eje;

  cursor ingresos_00 (
    argu_cdi_empresa  number,
    argu_cdi_eje      number)
  is
    select   opa.id_claso id_claso,
             opa.ds_claso ds_claso,
             opa.id_clase id_clase,
             opa.ds_clase ds_clase,
             opa.ds_parti ds_parti,
             opa.im_ini im_ini,
             opa.im_pr_aum im_pr_aum,
             opa.im_pr_dism im_pr_dism,
             opa.im_tot_mod im_tot_mod,
             opa.im_prev_def im_prev_def,
             opa.im_co_cer im_co_cer,
             opa.im_co_cte im_co_cte,
             opa.im_co_ecte im_co_ecte,
             opa.im_concertado im_concertado,
             opa.im_co_cre im_co_cre,
             opa.im_co_pdte_reali im_co_pdte_reali,
             opa.im_dif_de_previs_netos im_dif_de_previs_netos,
             opa.im_de_rec im_de_rec,
             opa.im_dan im_dan,
             opa.im_dalc im_dalc,
             opa.im_dadc im_dadc,
             opa.im_daic im_daic,
             opa.im_de_rec_netos im_de_rec_netos,
             opa.im_rec im_rec,
             opa.im_dev im_dev,
             opa.im_rec_neta im_rec_neta,
             opa.im_de_pdte_cobro im_de_pdte_cobro,
             opa.im_tot_liqui_cance im_tot_liqui_cance,
             opa.im_pmp im_pmp,
             opa.im_emp im_emp,
             opa.opa_type opa_type,
             opa.im_pre_dev_ing im_pre_dev_ing,
             opa.im_rec_dev_ing im_rec_dev_ing,
             opa.im_pmp_ini im_pmp_ini,
             opa.im_emp_ini im_emp_ini,
             opa.im_daaf im_daaf,
             opa.im_daaf_cerr im_daaf_cerr,
             opa.im_dcce im_dcce,
             opa.im_dcce_cerr im_dcce_cerr,
             opa.im_tot_pmp im_tot_pmp,
             opa.im_tot_emp im_tot_emp,
             opa.im_dc_otras_causas im_dc_otras_causas,
             opa.im_tot_derechos_anulados im_tot_derechos_anulados,
             opa.im_tot_derechos_cancelados im_tot_derechos_cancelados,
             opa.finalidad_contable finalidad_contable,
             opa.im_pmp_emp_ini im_pmp_emp_ini,
             opa.im_tot_acreedores_pendte_pago im_tot_acreedores_pendte_pago,
             opa.im_otros im_otros,
             opa.im_pmp_ini_ajus im_pmp_ini_ajus,
             opa.im_dev_pago im_dev_pago,
             opa.im_pend_pago im_pend_pago
        from ns_vog_parti_icp opa
       where opa.oee_emp_cdi_empresa = argu_cdi_empresa
         and opa.oee_cdi_eje = argu_cdi_eje
    order by 1,
             2;
begin
  -- cabeceras
  -- identificación entidad
  -- descripción entidad
  for regc in empresa loop
    for regd in ejercicio (regc.cdi_empresa) loop
      for rege in ingresos_00 (regc.cdi_empresa, regd.cdi_eje) loop
        v_datos   :=                                         --esquema conexión
             substr (regc.esquema_conexion,
                     1,
                     15)
          || '|'
          || regc.id_empresa
          || '|'                                      -- descripción entidad
          || regc.ds_empresa
          || '|'
          || (regd.id_eje)
          || '|'
          || (rege.id_claso)
          || '|'
          || (rege.ds_claso)
          || '|'
          || (rege.id_clase)
          || '|'
          || (rege.ds_clase)
          || '|'
          || (rege.ds_parti)
          || '|'
          || to_char (rege.im_ini)
          || '|'
          || to_char (rege.im_pr_aum)
          || '|'
          || to_char (rege.im_pr_dism)
          || '|'
          || to_char (rege.im_tot_mod)
          || '|'
          || to_char (rege.im_prev_def)
          || '|'
          || to_char (rege.im_co_cer)
          || '|'
          || to_char (rege.im_co_cte)
          || '|'
          || to_char (rege.im_co_ecte)
          || '|'
          || to_char (rege.im_concertado)
          || '|'
          || to_char (rege.im_co_cre)
          || '|'
          || to_char (rege.im_co_pdte_reali)
          || '|'
          || to_char (rege.im_dif_de_previs_netos)
          || '|'
          || to_char (rege.im_de_rec)
          || '|'
          || to_char (rege.im_dan)
          || '|'
          || to_char (rege.im_dalc)
          || '|'
          || to_char (rege.im_dadc)
          || '|'
          || to_char (rege.im_daic)
          || '|'
          || to_char (rege.im_de_rec_netos)
          || '|'
          || to_char (rege.im_rec)
          || '|'
          || to_char (rege.im_dev)
          || '|'
          || to_char (rege.im_rec_neta)
          || '|'
          || to_char (rege.im_tot_liqui_cance)
          || '|'
          || to_char (rege.im_de_pdte_cobro)
          || '|'
          || to_char (rege.im_pmp)
          || '|'
          || to_char (rege.im_emp)
          || '|'
          || rege.opa_type
          || '|'
          || to_char (rege.im_pre_dev_ing)
          || '|'
          || to_char (rege.im_rec_dev_ing)
          || '|'
          || to_char (rege.im_pmp_ini)
          || '|'
          || to_char (rege.im_emp_ini)
          || '|'
          || to_char (rege.im_daaf)
          || '|'
          || to_char (rege.im_daaf_cerr)
          || '|'
          || to_char (rege.im_dcce)
          || '|'
          || to_char (rege.im_dcce_cerr)
          || '|'
          || to_char (rege.im_tot_pmp)
          || '|'
          || to_char (rege.im_tot_emp)
          || '|'
          || to_char (rege.im_dc_otras_causas)
          || '|'
          || to_char (rege.im_tot_derechos_anulados)
          || '|'
          || to_char (rege.im_tot_derechos_cancelados)
          || '|'
          || rege.finalidad_contable
          || '|'
          || to_char (rege.im_pmp_emp_ini)
          || '|'
          || to_char (rege.im_tot_acreedores_pendte_pago)
          || '|'
          || to_char (rege.im_otros)
          || '|'
          || to_char (rege.im_pmp_ini_ajus)
          || '|'
          || to_char (rege.im_dev_pago)
          || '|'
          || to_char (rege.im_pend_pago)
          || '|';
        dbms_output.put_line (v_datos);
      end loop;
    end loop;
  end loop;

---------------------------------------------
  v_datos   :=    v_datos
               || '|';                                     -- última columna
end;
/

spool off

exit
