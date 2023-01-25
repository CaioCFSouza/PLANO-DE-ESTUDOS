
--CADASTRA CURSOS
EXEC sp_cad_curso
	@nm_curs = '', --NOME CURSO
	@tota_carg_hors = '', --TOTAL DE HORAS CURSO
	@ds_stat_curs = '', --STATUS CURSO / IMPORTADO OU NAO IMPORTADO
	@tp_curs = '', --TIPO DO CURSO -> F = FRONT-END / B = BACK-END / D = DATA SCIENCE / I = INGLES
	@ds_cert = '' --CERTIFICADO / SIM = S / NAO = N


-- CADASTRA CURSOS EM TABELAS PROPRIAS
EXEC sp_atrb_curs
@id_curs = , -- ID CURSO
@tp_curs = '' -- TIPO DO CURSO -> F = FRONT-END / B = BACK-END / D = DATA SCIENCE / I = INGLES