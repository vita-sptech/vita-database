DROP DATABASE IF EXISTS vita;
CREATE DATABASE IF NOT EXISTS vita;


USE vita ;

CREATE TABLE IF NOT EXISTS Hospital (
  Id INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Telefone VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  CNPJ VARCHAR(255) NOT NULL,
  CodHospital VARCHAR(255) NOT NULL,
  PRIMARY KEY (Id)
)AUTO_INCREMENT = 200;


CREATE TABLE IF NOT EXISTS Endereco (
  Id INT NOT NULL AUTO_INCREMENT,
  FkHospital INT NOT NULL,
  Estado VARCHAR(255) NOT NULL,
  Cidade VARCHAR(255) NOT NULL,
  CEP VARCHAR(255) NOT NULL,
  Logradouro VARCHAR(255) NOT NULL,
  NumEndereco VARCHAR(255) NOT NULL,
  Complemento VARCHAR(255) NULL,
  FOREIGN KEY (FkHospital) REFERENCES Hospital (Id),
  PRIMARY KEY (Id)
  )AUTO_INCREMENT = 100;

CREATE TABLE IF NOT EXISTS Funcionario (
  Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  FkHospital INT NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Senha VARCHAR(255) NOT NULL,
  Nome VARCHAR(255) NOT NULL,
  CPF CHAR(255) NOT NULL,
  Telefone CHAR(255) NOT NULL,
  Funcao VARCHAR(255) NOT NULL,
  FOREIGN KEY (FkHospital) REFERENCES Hospital (Id)
)AUTO_INCREMENT = 300;


CREATE TABLE IF NOT EXISTS Maquina (
  Id INT NOT NULL AUTO_INCREMENT,
  FkEmpresa INT NOT NULL,
  Apelido VARCHAR(255),
  Responsavel VARCHAR(255),
  PRIMARY KEY (Id),
  FOREIGN KEY (FkEmpresa) REFERENCES Hospital (Id)
)AUTO_INCREMENT = 400;


CREATE TABLE IF NOT EXISTS Hardware(
  Id INT NOT NULL AUTO_INCREMENT,
  FkMaquina INT NOT NULL,
  UsoProcessador VARCHAR(255),
  TempProcessador VARCHAR(255),
  FreqProcessador VARCHAR(255),
  UsoMemoria VARCHAR(255),
  TempMemoria VARCHAR(255),
  FreqMemoria VARCHAR(255),
  ArmazenamentoTotal VARCHAR(255),
  ArmazenamentoLivre VARCHAR(255),
  PRIMARY KEY (id, FkMaquina),
  FOREIGN KEY (FkMaquina) REFERENCES Maquina (Id)
) AUTO_INCREMENT = 500;

CREATE TABLE IF NOT EXISTS Processo (
Id INT primary key NOT NULL auto_increment,
FkMaquina INT NOT NULL,
Nome VARCHAR (255),
dtCaptura DATETIME,
Threads INT,
usoMemoriaRam VARCHAR(255),
FOREIGN KEY (FkMaquina) REFERENCES Maquina (Id)
);

CREATE TABLE IF NOT EXISTS Disco (
Id INT primary key NOT NULL auto_increment,
FkMaquina INT NOT NULL,
dtCaptura DATETIME,
ArmazenamentoTotal INT,
ArmazenamentoLivre VARCHAR(255),
FOREIGN KEY (FkMaquina) REFERENCES Maquina (Id)
);



CREATE TABLE IF NOT EXISTS HistoricoIncidentes (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  FkMaquina INT NOT NULL,
  Componente VARCHAR(255),
  DtIncidente DATETIME,
  FOREIGN KEY (FkMaquina) REFERENCES Maquina (Id)
);


-- DESC HOSPITAL;
INSERT INTO HOSPITAL VALUES 
(NULL,"Alberto Einstein", "11961707443","alberteinstein@hospital.com","60.765.823/0001-30","824fd9d8-6134-11ee-8c99-0242ac120002"),
(NULL,"HOSPITAL MUNICIPAL NOSSA SENHORA DA LAPA", "3438131231","hospitalapa@hospital.com","18.278.069/0001-47","7e6de880-6136-11ee-8c99-0242ac120002");
SELECT * FROM HOSPITAL;

-- DESC ENDERECO;
INSERT INTO ENDERECO VALUES
(NULL,200,"Sao Paulo","Sao Paulo","01414952","Rua do hospital albert eintein","900","Do outro lado da rua é o outro lado da rua do hospital"),
(NULL,201,"Sao Paulo","Sao Paulo","01445652","Rua do hospital da lapa","1452","");
SELECT * FROM ENDERECO;

-- DESC FUNCIONARIO;
INSERT INTO FUNCIONARIO VALUES
(null,200,"lucassantos@gmail.com","senha@123","Lucão","12312312","123123123","Gerente");

-- DESC MAQUINA;
INSERT INTO MAQUINA VALUES (null,200,"Maquina 1 Atendimento","David");
-- select * from MAQUINA;

