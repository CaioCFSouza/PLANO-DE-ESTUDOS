ALTER PROCEDURE sp_atrb_curs(
	@id_curs INT,
	@tp_curs CHAR(1)
)
	AS
	BEGIN
		DECLARE @dt_atlz_curs DATETIME,
				@dt_cad_curs DATETIME
				
		SET @dt_atlz_curs = GETDATE()
		SET	@dt_cad_curs = GETDATE()

		DECLARE @retSelect VARCHAR(MAX)
	
		IF @id_curs = ''
			BEGIN
				PRINT 'NAO FOI POSSIVEL CADASTRAR O CURSO -- ID DO CURSO VAZIO'
			END
			ELSE
				BEGIN

					DECLARE @ret_stat_curs VARCHAR(MAX)

					--CADASTRA E ATUALIZA FRONT-END
					IF @tp_curs = 'F'
						BEGIN
							SET @retSelect = (select id_curs from tbl_front_end (nolock) where id_curs = @id_curs)
							IF @retSelect = @id_curs
								BEGIN
									PRINT 'NAO FOI POSSIVEL CADASTRAR O CURSO -- CURSO JÁ CADASTRADO'
								END
								ELSE
									BEGIN
										INSERT INTO tbl_front_end
										SELECT
											@id_curs,
											nm_curs,
											tota_carg_hors,
											'PENDENTE',
											@tp_curs,
											ds_cert,
											GETDATE(),
											GETDATE()
										FROM tbl_curs
										where id_curs = @id_curs

										SET @ret_stat_curs = (SELECT curs.id_curs FROM tbl_curs curs	(NOLOCK) 
										INNER JOIN tbl_front_end front on curs.id_curs = front.id_curs where curs.id_curs = @id_curs )

										PRINT @ret_stat_curs

										UPDATE tbl_curs
										SET ds_stat_curs = 'IMPORTADO'
										where id_curs = @ret_stat_curs
									END
						END

					--CADASTRA E ATUALIZA BACK-END
					IF @tp_curs = 'B'
						BEGIN
							SET @retSelect = (select id_curs from tbl_back_end (nolock) where id_curs = @id_curs)
							IF @retSelect = @id_curs
								BEGIN
									PRINT 'NAO FOI POSSIVEL CADASTRAR O CURSO -- CURSO JÁ CADASTRADO'
								END
								ELSE
									BEGIN
										INSERT INTO tbl_back_end
										SELECT
											@id_curs,
											nm_curs,
											tota_carg_hors,
											'PENDENTE',
											@tp_curs,
											ds_cert,
											GETDATE(),
											GETDATE()
										FROM tbl_curs
										where id_curs = @id_curs

										SET @ret_stat_curs = (SELECT curs.id_curs FROM tbl_curs curs	(NOLOCK) 
										INNER JOIN tbl_back_end back on curs.id_curs = back.id_curs where curs.id_curs = @id_curs )

										PRINT @ret_stat_curs

										UPDATE tbl_curs
										SET ds_stat_curs = 'IMPORTADO'
										where id_curs = @ret_stat_curs
									END
						END

					--CADASTRA E ATUALIZA DATA SCIENCE
					IF @tp_curs = 'D'
						BEGIN
							SET @retSelect = (select id_curs from tbl_data_science (nolock) where id_curs = @id_curs)
							IF @retSelect = @id_curs
								BEGIN
									PRINT 'NAO FOI POSSIVEL CADASTRAR O CURSO -- CURSO JÁ CADASTRADO'
								END
								ELSE
									BEGIN
										INSERT INTO tbl_data_science
										SELECT
											@id_curs,
											nm_curs,
											tota_carg_hors,
											'PENDENTE',
											@tp_curs,
											ds_cert,
											GETDATE(),
											GETDATE()
										FROM tbl_curs
										where id_curs = @id_curs

										SET @ret_stat_curs = (SELECT curs.id_curs FROM tbl_curs curs	(NOLOCK) 
										INNER JOIN tbl_data_science science on curs.id_curs = science.id_curs where curs.id_curs = @id_curs )

										PRINT @ret_stat_curs

										UPDATE tbl_curs
										SET ds_stat_curs = 'IMPORTADO'
										where id_curs = @ret_stat_curs
									END
						END

					--CADASTRA E ATUALIZA INGLES
					IF @tp_curs = 'I'
						BEGIN
							SET @retSelect = (select id_curs from tbl_ingles (nolock) where id_curs = @id_curs)
							IF @retSelect = @id_curs
								BEGIN
									PRINT 'NAO FOI POSSIVEL CADASTRAR O CURSO -- CURSO JÁ CADASTRADO'
								END
								ELSE
									BEGIN
										INSERT INTO tbl_ingles
										SELECT
											@id_curs,
											nm_curs,
											tota_carg_hors,
											'PENDENTE',
											@tp_curs,
											ds_cert,
											GETDATE(),
											GETDATE()
										FROM tbl_curs
										where id_curs = @id_curs

										SET @ret_stat_curs = (SELECT curs.id_curs FROM tbl_curs curs	(NOLOCK) 
										INNER JOIN tbl_ingles ingles on curs.id_curs = ingles.id_curs where curs.id_curs = @id_curs )

										PRINT @ret_stat_curs

										UPDATE tbl_curs
										SET ds_stat_curs = 'IMPORTADO'
										where id_curs = @ret_stat_curs
									END
						END
				END

	END

EXEC sp_atrb_curs
	@id_curs = , -- ID CURSO
	@tp_curs = '' -- TIPO DO CURSO -> F = FRONT-END / B = BACK-END / D = DATA SCIENCE / I = INGLES


