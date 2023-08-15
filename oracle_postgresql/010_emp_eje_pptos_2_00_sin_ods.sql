set linesize 4000
set head off
set echo off
set termout off
set feedback off
set verify off
set SERVEROUTPUT ON SIZE 1000000

spool /accesounix/datos/pptos_noods.csv append

-- orden de aplicaciones en el sql
-- columnas
-- B  esquema de conexión
-- C  id de entidad
-- D  entidad

declare
  v_datos_cab    varchar2 (200);
  v_datos        varchar2 (4000);
  v_cdi_ambito   number := 48167655;
  v_cdi_tipo     number := 48167673;
  v_todos        varchar2 (15) := null;

  cursor empresa
  is
    select min (adm_ser.obtener_cd_esquema_actual)esquema_conexion,
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
       where oee.emp_cdi_empresa = argu_cdi_empresa 
	     and oee.id_eje >= 2015
    order by oee.id_eje;

  cursor gastos_00 (
    argu_cdi_empresa  number,
    argu_cdi_eje      number,
	argu_cdi_ambito   number,
	argu_cdi_tipo     number)
  is
    select   opa.id_claso id_claso,
             opa.ds_claso ds_claso,
             opa.id_clasf id_clasf,
             opa.ds_clasf ds_clasf,
             opa.id_clase id_clase,
             opa.ds_clase ds_clase,
			 ' ' objetivo,
			 ' ' meta,
             ' ' sinergia,
             opa.vi_org vi_org,
             opa.vi_fun vi_fun,
             opa.vi_eco vi_eco,
             opa.ds_parti ds_parti,
             opa.im_cr_ini im_cr_ini,
             opa.im_cr_ext im_cr_ext,
             opa.im_cr_sup im_cr_sup,
             opa.im_cr_amp im_cr_amp,
             opa.im_tr_neg im_tr_neg,
             opa.im_tr_pos im_tr_pos,
             opa.im_in_rem im_in_rem,
             opa.im_mo_ing im_mo_ing,
             opa.im_mo_baj im_mo_baj,
             opa.im_mod_tot_cre im_mod_tot_cre,
             opa.im_cr_tot im_cr_tot,
             opa.im_dis_vincu im_dis_vincu,
             opa.im_cr_dis im_cr_dis,
             opa.im_ri_put im_ri_put,
             opa.im_ri_tra im_ri_tra,
             opa.im_cr_nod im_cr_nod,
             opa.im_tot_rc im_tot_rc,
             opa.im_ai_ret im_ai_ret,
             opa.im_ai_dis im_ai_dis,
             opa.im_tot_gas_au im_tot_gas_au,
             opa.im_di_gas im_di_gas,
             opa.im_oi_rec im_oi_rec,
             opa.im_pi_ord im_pi_ord,
             opa.im_ri_efe im_ri_efe,
             opa.im_ri_rei im_ri_rei,
             opa.sal_cre_ret_pte sal_cre_ret_pte,
             opa.sal_cre_ret_tra sal_cre_ret_tra,
             opa.sal_gas_au sal_gas_au,
             opa.sal_gas_com sal_gas_com,
             opa.sal_obl_rec sal_obl_rec,
             opa.im_comno im_comno,
             opa.im_comin im_comin,
             opa.im_nocomno im_nocomno,
             opa.im_nocomin im_nocomin,
             opa.finalidad_contable finalidad_contable
        from ns_vog_parti_gcp opa
       where opa.oee_emp_cdi_empresa = argu_cdi_empresa
         and opa.oee_cdi_eje = argu_cdi_eje
    order by 1,
             2,
             4,
             6;
begin
  -- cabeceras
  -- identificación entidad
  -- descripción entidad
  for regc in empresa loop
    for regd in ejercicio (regc.cdi_empresa) loop
      for rege in gastos_00 (regc.cdi_empresa, regd.cdi_eje, v_cdi_ambito, v_cdi_tipo) loop
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
          || (rege.id_clasf)
          || '|'
          || (rege.ds_clasf)
          || '|'
          || (rege.id_clase)
          || '|'
          || (rege.ds_clase)
          || '|'
          || (rege.objetivo)
          || '|'
		  || (rege.meta)
          || '|'
          || (nvl(rege.sinergia, 'NA'))
          || '|'
          || (rege.vi_org)
          || '|'
          || (rege.vi_fun)
          || '|'
          || (rege.vi_eco)
          || '|'
          || (rege.ds_parti)
          || '|'
          || to_char (rege.im_cr_ini)
          || '|'
          || to_char (rege.im_cr_ext)
          || '|'
          || to_char (rege.im_cr_sup)
          || '|'
          || to_char (rege.im_cr_amp)
          || '|'
          || to_char (rege.im_tr_neg)
          || '|'
          || to_char (rege.im_tr_pos)
          || '|'
          || to_char (rege.im_in_rem)
          || '|'
          || to_char (rege.im_mo_ing)
          || '|'
          || to_char (rege.im_mo_baj)
          || '|'
          || to_char (rege.im_mod_tot_cre)
          || '|'
          || to_char (rege.im_cr_tot)
          || '|'
          || to_char (rege.im_dis_vincu)
          || '|'
          || to_char (rege.im_cr_dis)
          || '|'
          || to_char (rege.im_ri_put)
          || '|'
          || to_char (rege.im_ri_tra)
          || '|'
          || to_char (rege.im_cr_nod)
          || '|'
          || to_char (rege.im_tot_rc)
          || '|'
          || to_char (rege.im_ai_ret)
          || '|'
          || to_char (rege.im_ai_dis)
          || '|'
          || to_char (rege.im_tot_gas_au)
          || '|'
          || to_char (rege.im_di_gas)
          || '|'
          || to_char (rege.im_oi_rec)
          || '|'
          || to_char (rege.im_pi_ord)
          || '|'
          || to_char (rege.im_ri_efe)
          || '|'
          || to_char (rege.im_ri_rei)
          || '|'
          || to_char (rege.sal_cre_ret_pte)
          || '|'
          || to_char (rege.sal_cre_ret_tra)
          || '|'
          || to_char (rege.sal_gas_au)
          || '|'
          || to_char (rege.sal_gas_com)
          || '|'
          || to_char (rege.sal_obl_rec)
          || '|'
          || to_char (rege.im_comno)
          || '|'
          || to_char (rege.im_comin)
          || '|'
          || to_char (rege.im_nocomno)
          || '|'
          || to_char (rege.im_nocomin)
          || '|'
          || nvl(rege.finalidad_contable, 'NA');
        dbms_output.put_line (rtrim(v_datos)||' ');
      end loop;
    end loop;
  end loop;

---------------------------------------------

end;
/

spool off

exit
