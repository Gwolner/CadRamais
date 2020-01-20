CREATE DATABASE cad_ramais;

USE cad_ramais;

CREATE TABLE bloco(
id_bloco INT,
desc_bloco VARCHAR(45) NOT NULL,
PRIMARY KEY(id_bloco)
);

CREATE TABLE andar(
id_andar INT,
desc_andar VARCHAR(45) NOT NULL,
PRIMARY KEY(id_andar)
);

CREATE TABLE bloco_x_andar(
id_bloco_x_andar INT,
id_bloco INT,
id_andar INT,
PRIMARY KEY(id_bloco_x_andar),
FOREIGN KEY (id_bloco) REFERENCES bloco (id_bloco),
FOREIGN KEY (id_andar) REFERENCES andar (id_andar)
);

CREATE TABLE setor(
id_setor INT,
desc_setor VARCHAR(45) NOT NULL,
PRIMARY KEY(id_setor)
);

CREATE TABLE sala(
id_sala INT,
desc_sala VARCHAR(45) NOT NULL,
id_andar INT,
id_setor INT,
PRIMARY KEY(id_sala),
FOREIGN KEY (id_andar) REFERENCES andar (id_andar),
FOREIGN KEY (id_setor) REFERENCES setor (id_setor)
);

CREATE TABLE sub_setor(
id_sub_setor INT,
desc_sub_setor VARCHAR(45) NOT NULL,
id_setor INT,
PRIMARY KEY(id_sub_setor),
FOREIGN KEY (id_setor) REFERENCES setor (id_setor)
);

CREATE TABLE email(
id_email INT,
endereco_email VARCHAR(45) NOT NULL,
id_sub_setor INT,
PRIMARY KEY(id_email),
FOREIGN KEY (id_sub_setor) REFERENCES sub_setor (id_sub_setor)
);

CREATE TABLE tipo_ramal(
id_tipo_ramal INT,
tecnologia VARCHAR(45) NOT NULL,
PRIMARY KEY(id_tipo_ramal)
);

CREATE TABLE ramal(
id_ramal INT,
numero_ramal INT NOT NULL,
id_sub_setor INT,
id_tipo_ramal INT,
PRIMARY KEY(id_ramal),
FOREIGN KEY (id_sub_setor) REFERENCES sub_setor (id_sub_setor),
FOREIGN KEY (id_tipo_ramal) REFERENCES tipo_ramal (id_tipo_ramal)
);
