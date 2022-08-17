CREATE DATABASE test;

CREATE TABLE TB_ESTADOS(
EST_CODIGO INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
EST_NOME CHAR(2)
);


CREATE TABLE TB_CIDADES(
CID_CODIGO INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
CID_NOME VARCHAR(50),
CID_EST_CODIGO INT,

FOREIGN KEY (CID_EST_CODIGO)
REFERENCES TB_ESTADOS (EST_CODIGO)
);
-- CONSTRAINT FK_EST_CID FOREIGN KEY (CID_EST_CODIGO)

DROP TABLE TB_CIDADES;
DROP TABLE TB_ESTADOS;

CREATE TABLE TB_ESTADOS(
EST_CODIGO INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
EST_NOME CHAR(2)
);
-- CONSTRAINT PK_TB_ESTADOS PRIMARY KEY (EST_CODIGO)

select * from TB_ESTADOS;
select * from TB_CIDADES;

CREATE TABLE TB_CIDADES(
CID_CODIGO INT NOT NULL AUTO_INCREMENT,
CID_NOME VARCHAR(50),
CID_EST_CODIGO INT,

CONSTRAINT PK_TB_CIDADES PRIMARY KEY (CID_CODIGO),
CONSTRAINT FK_EST_CID FOREIGN KEY (CID_EST_CODIGO)
REFERENCES TB_ESTADOS (EST_CODIGO)
);

CREATE TABLE TB_BAIRROS(
BAI_CODIGO INT NOT NULL AUTO_INCREMENT,
BAI_NOME VARCHAR(50),
BAI_CID_CODIGO INT,

CONSTRAINT PK_TB_BAIRROS PRIMARY KEY (BAI_CODIGO),
CONSTRAINT FK_CID_BAI FOREIGN KEY (BAI_CID_CODIGO)
REFERENCES TB_CIDADES (CID_CODIGO)
);

CREATE TABLE TB_CLIENTES(
CLI_CODIGO INT NOT NULL AUTO_INCREMENT,
CLI_NOME VARCHAR(100),
CLI_EMAIL VARCHAR(100),
CLI_LOGRADOURO VARCHAR(255),
CLI_NUMERO INT,
CLI_COMPLEMENTO VARCHAR(255),
CLI_CEP CHAR(7),
CLI_BAI_CODIGO INT,
CLI_CID_CODIGO INT,
CLI_EST_CODIGO INT,

CONSTRAINT PK_TB_CLIENTES PRIMARY KEY (CLI_CODIGO),

CONSTRAINT FK_BAI_CLI FOREIGN KEY (CLI_BAI_CODIGO)
REFERENCES TB_BAIRROS(BAI_CODIGO),
CONSTRAINT FK_CID_CLI FOREIGN KEY (CLI_CID_CODIGO)
REFERENCES TB_CIDADES(CID_CODIGO),
CONSTRAINT FK_EST_CLI FOREIGN KEY (CLI_EST_CODIGO)
REFERENCES TB_ESTADOS(EST_CODIGO)
);


CREATE TABLE TB_CLIENTES(
CLI_CODIGO INT NOT NULL AUTO_INCREMENT,
CLI_NOME VARCHAR(100),
CLI_EMAIL VARCHAR(100),
CLI_LOGRADOURO VARCHAR(255),
CLI_NUMERO INT,
CLI_COMPLEMENTO VARCHAR(255),
CLI_CEP CHAR(7),
CLI_BAI_CODIGO INT,
CLI_CID_CODIGO INT,
CLI_EST_CODIGO INT,

CONSTRAINT PK_TB_CLIENTES PRIMARY KEY (CLI_CODIGO),

CONSTRAINT FK_BAI_CLI FOREIGN KEY (CLI_BAI_CODIGO)
REFERENCES TB_BAIRROS(BAI_CODIGO),
CONSTRAINT FK_CID_CLI FOREIGN KEY (CLI_CID_CODIGO)
REFERENCES TB_CIDADES(CID_CODIGO),
CONSTRAINT FK_EST_CLI FOREIGN KEY (CLI_EST_CODIGO)
REFERENCES TB_ESTADOS(EST_CODIGO)
);

CREATE TABLE TB_SETORES(
SET_CODIGO INT NOT NULL AUTO_INCREMENT,
SET_NOME VARCHAR(50),
CONSTRAINT PK_TB_SETORES PRIMARY KEY (SET_CODIGO),
);


-- DROP TABLE TB_FUNCOES
CREATE TABLE TB_FUNCOES(
FUN_CODIGO INT NOT NULL AUTO_INCREMENT,
FUN_NOME VARCHAR(50),
FUN_SET_CODIGO INT,
CONSTRAINT PK_TB_FUNCOES PRIMARY KEY (FUN_CODIGO),
CONSTRAINT FK_SET_FUN FOREIGN KEY (FUN_SET_CODIGO)
REFERENCES TB_SETORES(SET_CODIGO)
);

-- DROP TABLE TB_SERVIDORES
CREATE TABLE TB_SERVIDORES(
SER_CODIGO INT NOT NULL AUTO_INCREMENT,
SER_NOME VARCHAR(100),
SER_IDENTIDADE VARCHAR(15),
SER_CPF CHAR(15),
SER_CAR_TRAB VARCHAR(15),
SER_DATA_NASCIMENTO DATE,
SER_DATA_ADMISSAO DATE,
SER_DATA_REGISTRO DATE,
SER_SEXO CHAR(1),
SER_ESTADO_CIVIL VARCHAR(15),
SER_FILHOS INT,
SER_EMAIL VARCHAR(100),
SER_LOGRADOURO VARCHAR(255),
SER_NUMERO VARCHAR(10),
SER_COMPLEMENTO VARCHAR(255),
SER_CEP CHAR(9),
SER_FUN_CODIGO INT,
SER_SET_CODIGO INT,
SER_BAI_CODIGO INT,
SER_CID_CODIGO INT,
SER_EST_CODIGO INT,

CONSTRAINT PK_TB_SERVIDORES PRIMARY KEY (SER_CODIGO),
CONSTRAINT FK_BAI_SER FOREIGN KEY (SER_BAI_CODIGO)
REFERENCES TB_BAIRROS(BAI_CODIGO),
CONSTRAINT FK_CID_SER FOREIGN KEY (SER_CID_CODIGO)
REFERENCES TB_CIDADES(CID_CODIGO),
CONSTRAINT FK_EST_SER FOREIGN KEY (SER_EST_CODIGO)
REFERENCES TB_ESTADOS(EST_CODIGO),
CONSTRAINT FK_FUN_SER FOREIGN KEY (SER_FUN_CODIGO)
REFERENCES TB_FUNCOES(FUN_CODIGO),
CONSTRAINT FK_SET_SER FOREIGN KEY (SER_SET_CODIGO)
REFERENCES TB_SETORES(SET_CODIGO)
);


-- SER_SALARIO DECIMAL,
-- SER_GRATIFICAO DECIMAL,
-- SER_VALE_TRANSPORTE DECIMAL,