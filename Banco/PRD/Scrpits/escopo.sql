CREATE TABLE tbl_curs(
	id_curs INT PRIMARY KEY IDENTITY(1,1),
	nm_curs VARCHAR(50) NOT NULL,
	tota_carg_hors DATETIME NOT NULL,
	ds_stat_curs VARCHAR(30) NOT NULL,
	tp_curs CHAR(1) NOT NULL,
	ds_cert CHAR(1) NOT NULL,
	dt_atlz_curs DATETIME NOT NULL,
	dt_cad_curs DATETIME NOT NULL
)

CREATE TABLE tbl_front_end(
	id_curs_front_end INT PRIMARY KEY IDENTITY(1 , 1),
	id_curs INT,
	nm_curs VARCHAR(50) NOT NULL,
	tota_carg_hors DATETIME NOT NULL,
	ds_stat_curs VARCHAR(30) NOT NULL,
	tp_curs CHAR(1) NOT NULL,
	ds_cert CHAR(1) NOT NULL,
	dt_atlz_curs DATETIME NOT NULL,
	dt_cad_curs DATETIME NOT NULL
	FOREIGN KEY (id_curs) REFERENCES tbl_curs(id_curs)
)

CREATE TABLE tbl_back_end(
	id_curs_front_end INT PRIMARY KEY IDENTITY(1 , 1),
	id_curs INT,
	nm_curs VARCHAR(50) NOT NULL,
	tota_carg_hors DATETIME NOT NULL,
	ds_stat_curs VARCHAR(30) NOT NULL,
	tp_curs CHAR(1) NOT NULL,
	ds_cert CHAR(1) NOT NULL,
	dt_atlz_curs DATETIME NOT NULL,
	dt_cad_curs DATETIME NOT NULL
	FOREIGN KEY (id_curs) REFERENCES tbl_curs(id_curs)
)

CREATE TABLE tbl_data_science(
	id_curs_front_end INT PRIMARY KEY IDENTITY(1 , 1),
	id_curs INT,
	nm_curs VARCHAR(50) NOT NULL,
	tota_carg_hors DATETIME NOT NULL,
	ds_stat_curs VARCHAR(30) NOT NULL,
	tp_curs CHAR(1) NOT NULL,
	ds_cert CHAR(1) NOT NULL,
	dt_atlz_curs DATETIME NOT NULL,
	dt_cad_curs DATETIME NOT NULL
	FOREIGN KEY (id_curs) REFERENCES tbl_curs(id_curs)
)

CREATE TABLE tbl_ingles(
	id_curs_front_end INT PRIMARY KEY IDENTITY(1 , 1),
	id_curs INT,
	nm_curs VARCHAR(50) NOT NULL,
	tota_carg_hors DATETIME NOT NULL,
	ds_stat_curs VARCHAR(30) NOT NULL,
	tp_curs CHAR(1) NOT NULL,
	ds_cert CHAR(1) NOT NULL,
	dt_atlz_curs DATETIME NOT NULL,
	dt_cad_curs DATETIME NOT NULL

	FOREIGN KEY (id_curs) REFERENCES tbl_curs(id_curs)
)

CREATE TABLE tbl_user(
	id_user INT PRIMARY KEY IDENTITY(1 , 1),
	cd_user CHAR(10) NOT NULL,
	nm_user VARCHAR(MAX) NOT NULL,
	ds_senh VARCHAR(20) NOT NULL,
	fl_atvo CHAR(1) NOT NULL,
	dt_atl_user DATETIME NOT NULL,
	dt_cad_user DATETIME NOT NULL,
)

CREATE TABLE tbl_cert(
	id_cert INT PRIMARY KEY IDENTITY(1 , 1),
	id_curs INT NOT NULL,
	id_user INT NOT NULL,
	tp_curs CHAR(1) NOT NULL,
	url_cert VARCHAR(MAX) NOT NULL,
	dt_atlz_cert DATETIME NOT NULL,
	dt_cad_cert DATETIME NOT NULL

	FOREIGN KEY(id_curs) REFERENCES tbl_curs(id_curs),
	FOREIGN KEY(id_user) REFERENCES tbl_user(id_user)
)

ALTER TABLE tbl_curs
ALTER COLUMN tota_carg_hors VARCHAR(10);

ALTER TABLE tbl_front_end
ALTER COLUMN tota_carg_hors VARCHAR(10);

ALTER TABLE tbl_back_end
ALTER COLUMN tota_carg_hors VARCHAR(10);

ALTER TABLE tbl_ingles
ALTER COLUMN tota_carg_hors VARCHAR(10);

ALTER TABLE tbl_data_science
ALTER COLUMN tota_carg_hors VARCHAR(10);
