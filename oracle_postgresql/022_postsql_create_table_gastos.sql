CREATE TABLE tfm_apli_gastos 
(
esquema					VARCHAR(15),
id_cliente				VARCHAR(5),
ds_cliente				VARCHAR(100),
id_eje					VARCHAR(4),
id_claso				VARCHAR(10),
ds_claso				VARCHAR(100),
id_clasp				VARCHAR(10) NOT NULL,
ds_clasp				VARCHAR(100) NOT NULL,
id_clase				VARCHAR(10) NOT NULL,
ds_clase				VARCHAR(100) NOT NULL,
objetivo 				VARCHAR(50),
meta					VARCHAR(50),
sinergia				VARCHAR(100),
vi_org					VARCHAR(10),
vi_pro					VARCHAR(10) NOT NULL,
vi_eco					VARCHAR(10) NOT NULL,
ds_apli 				VARCHAR(250) NOT NULL,
im_cr_ini				NUMERIC (14,2),
im_cr_ext				NUMERIC (14,2),
im_cr_sup				NUMERIC (14,2),
im_cr_amp				NUMERIC (14,2),
im_tr_neg				NUMERIC (14,2),
im_tr_pos				NUMERIC (14,2),
im_in_rem				NUMERIC (14,2),
im_mo_ing				NUMERIC (14,2),
im_mo_baj				NUMERIC (14,2),
im_mod_tot_cre			NUMERIC (14,2),
im_cr_tot				NUMERIC (14,2),
im_dis_vincu			NUMERIC (14,2),
im_cr_dis				NUMERIC (14,2),
im_ri_put				NUMERIC (14,2),
im_ri_tra				NUMERIC (14,2),
im_cr_nod				NUMERIC (14,2),
im_tot_rc				NUMERIC (14,2),
im_ai_ret				NUMERIC (14,2),
im_ai_dis				NUMERIC (14,2),
im_tot_gas_au			NUMERIC (14,2),
im_di_gas				NUMERIC (14,2),
im_oi_rec				NUMERIC (14,2),
im_pi_ord				NUMERIC (14,2),
im_ri_efe				NUMERIC (14,2),
im_ri_rei				NUMERIC (14,2),
sal_cre_ret_pte			NUMERIC (14,2),
sal_cre_ret_tra			NUMERIC (14,2),
sal_gas_au				NUMERIC (14,2),
sal_gas_com				NUMERIC (14,2),
sal_obl_rec				NUMERIC (14,2),
im_comno				NUMERIC (14,2),
im_comin				NUMERIC (14,2),
im_nocomno				NUMERIC (14,2),
im_nocomin				NUMERIC (14,2),
finalidad_contable		VARCHAR(50)
);
COMMENT ON COLUMN tfm_apli_gastos.esquema IS 'esquema de conexión';
COMMENT ON COLUMN tfm_apli_gastos.id_cliente IS 'Código numérico del cliente';
COMMENT ON COLUMN tfm_apli_gastos.ds_cliente IS 'Nombre del cliente';
COMMENT ON COLUMN tfm_apli_gastos.id_eje IS 'Ejercicio contable';
COMMENT ON COLUMN tfm_apli_gastos.id_claso IS 'Código clasificación orgánica';
COMMENT ON COLUMN tfm_apli_gastos.ds_claso IS 'Descripción clasificación orgánica';
COMMENT ON COLUMN tfm_apli_gastos.id_clasp IS 'Código clasificación programa de gasto';
COMMENT ON COLUMN tfm_apli_gastos.ds_clasp IS 'Descripción clasificación programa de gasto';
COMMENT ON COLUMN tfm_apli_gastos.id_clase IS 'Código clasificación económica';
COMMENT ON COLUMN tfm_apli_gastos.ds_clase IS 'Descripción clasificación económica';
COMMENT ON COLUMN tfm_apli_gastos.objetivo  IS 'Objetivo de desarrollo sostenible';
COMMENT ON COLUMN tfm_apli_gastos.meta IS 'Meta del objetivo de desarrollo sostenible';
COMMENT ON COLUMN tfm_apli_gastos.sinergia IS 'Sinergia';
COMMENT ON COLUMN tfm_apli_gastos.vi_org IS 'Código org en bolsa de vinculación ';
COMMENT ON COLUMN tfm_apli_gastos.vi_pro IS 'Código programa de gasto en bolsa de vinculación';
COMMENT ON COLUMN tfm_apli_gastos.vi_eco IS 'Código económica en bolsa de vinculación';
COMMENT ON COLUMN tfm_apli_gastos.ds_apli  IS 'Descripción de la aplicación presupuestaria';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_ini IS 'Importe créditos aprobados definitivos';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_ext IS 'Importe créditos extraordinarios';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_sup IS 'Importe suplementos de crédito';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_amp IS 'Importe ampliaciones de crédito';
COMMENT ON COLUMN tfm_apli_gastos.im_tr_neg IS 'Importe transferencias negativas de crédito';
COMMENT ON COLUMN tfm_apli_gastos.im_tr_pos IS 'Importe transferencias positivas de crédito';
COMMENT ON COLUMN tfm_apli_gastos.im_in_rem IS 'Importe incorporación de remanentes de crédito';
COMMENT ON COLUMN tfm_apli_gastos.im_mo_ing IS 'Importe modificaciones de crédito generadas por ingresos';
COMMENT ON COLUMN tfm_apli_gastos.im_mo_baj IS 'Importe de bajas por anulación';
COMMENT ON COLUMN tfm_apli_gastos.im_mod_tot_cre IS 'Importe total de modificaciones de crédito';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_tot IS 'Importe total de créditos';
COMMENT ON COLUMN tfm_apli_gastos.im_dis_vincu IS 'Importe disponible en la vinculación';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_dis IS 'Importe de crédito disponible';
COMMENT ON COLUMN tfm_apli_gastos.im_ri_put IS 'Importe créditos retenidos pendientes de utilización';
COMMENT ON COLUMN tfm_apli_gastos.im_ri_tra IS 'Importe créditos retenidos para transferencias';
COMMENT ON COLUMN tfm_apli_gastos.im_cr_nod IS 'Importe créditos no disponibles';
COMMENT ON COLUMN tfm_apli_gastos.im_tot_rc IS 'Importe total de créditos retenidos';
COMMENT ON COLUMN tfm_apli_gastos.im_ai_ret IS 'Importe autorizado sobre retenido';
COMMENT ON COLUMN tfm_apli_gastos.im_ai_dis IS 'Importe autorizado sobre disponible';
COMMENT ON COLUMN tfm_apli_gastos.im_tot_gas_au IS 'Importe total de gastos autorizados';
COMMENT ON COLUMN tfm_apli_gastos.im_di_gas IS 'Importe de gastos comprometidos';
COMMENT ON COLUMN tfm_apli_gastos.im_oi_rec IS 'Importe de obligaciones reconocidas';
COMMENT ON COLUMN tfm_apli_gastos.im_pi_ord IS 'Importe de pagos ordenados';
COMMENT ON COLUMN tfm_apli_gastos.im_ri_efe IS 'Importe de pagos efectuados';
COMMENT ON COLUMN tfm_apli_gastos.im_ri_rei IS 'Importe de reintegros';
COMMENT ON COLUMN tfm_apli_gastos.sal_cre_ret_pte IS 'Saldo de créditos retenidos pendientes';
COMMENT ON COLUMN tfm_apli_gastos.sal_cre_ret_tra IS 'Saldo de créditos retenidos para transferencias';
COMMENT ON COLUMN tfm_apli_gastos.sal_gas_au IS 'Saldo de gastos autorizados';
COMMENT ON COLUMN tfm_apli_gastos.sal_gas_com IS 'Saldo de gastos comprometidos';
COMMENT ON COLUMN tfm_apli_gastos.sal_obl_rec IS 'Saldo de obligaciones pendientes';
COMMENT ON COLUMN tfm_apli_gastos.im_comno IS 'Importe de remanentes comprometidos no incorporables';
COMMENT ON COLUMN tfm_apli_gastos.im_comin IS 'Importe de remanentes comprometidos incorporables';
COMMENT ON COLUMN tfm_apli_gastos.im_nocomno IS 'Importe de remanentes no comprometidos no incorporables';
COMMENT ON COLUMN tfm_apli_gastos.im_nocomin IS 'Importe de remanentes no comprometidos incorporables';
COMMENT ON COLUMN tfm_apli_gastos.finalidad_contable IS 'Finalidad contable';	