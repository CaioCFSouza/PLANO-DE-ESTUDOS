CREATE PROC sp_cad_curso(
	@nm_curs VARCHAR(50),
	@tota_carg_hors VARCHAR(10),
	@ds_stat_curs VARCHAR(30),
	@tp_curs CHAR(1),
	@ds_cert CHAR(1)
)
	AS
	BEGIN
		DECLARE @dt_atlz_curs DATETIME,
				@dt_cad_curs DATETIME,
				@retSelect VARCHAR(MAX)

		SET @dt_atlz_curs = GETDATE()
		SET @dt_cad_curs = GETDATE()
		SET @retSelect = (SELECT nm_curs FROM tbl_curs where nm_curs = @nm_curs)

		IF @nm_curs = '' or @nm_curs = null
			BEGIN
				PRINT 'O NOME DO CURSO NAO PODE SER NULL OU VAZIO.'
			END
			ELSE
				BEGIN
					IF @retSelect = @nm_curs
					BEGIN
						PRINT 'O CURSO ' + @nm_curs + ' JA ESTA CADASTRADO.'
					END 
					ELSE
						BEGIN
							INSERT INTO tbl_curs(nm_curs,tota_carg_hors,ds_stat_curs,tp_curs,ds_cert,dt_atlz_curs,dt_cad_curs) VAlUES(
							@nm_curs , @tota_carg_hors , @ds_stat_curs , @tp_curs , @ds_cert , @dt_atlz_curs , @dt_cad_curs)
							
						END
			END
END

EXEC sp_cad_curso
	@nm_curs = '', --NOME CURSO
	@tota_carg_hors = '', --TOTAL DE HORAS CURSO
	@ds_stat_curs = '', --STATUS CURSO / IMPORTADO OU NAO IMPORTADO
	@tp_curs = '', --TIPO DO CURSO -> F = FRONT-END / B = BACK-END / D = DATA SCIENCE / I = INGLES
	@ds_cert = '' --CERTIFICADO / SIM = S / NAO = N
