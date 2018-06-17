
--TABLA ISLA;
CREATE TABLE admin (
    id_admin SERIAL PRIMARY KEY,
    username VARCHAR(45) NOT NULL,
	pass VARCHAR(45) NOT NULL   
);

CREATE TABLE usuario(
    id_usuario SERIAL PRIMARY KEY,
    username VARCHAR(45) NOT NULL,
	password VARCHAR(45) NOT NULL, 
	nombre_completo VARCHAR(100) NOT NULL, 
	numero_cuenta   VARCHAR(100) NOT NULL,  
	fecha_creacion	DATE,
	saldo REAL,
	estado BOOLEAN
);

--En la entidad usuario, un atributo List<Usuario> beneficiarios; 
CREATE TABLE usuarioxbeneficiario(
    id_usuarioxbeneficiario SERIAL PRIMARY KEY,
    id_usuario INT,
    id_beneficiario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_beneficiario) REFERENCES usuario(id_usuario)
);



CREATE TABLE operacion(
    id_operacion SERIAL PRIMARY KEY,
    tipo_operacion INT, --0=Debito, 1=Credito;
   	fecha DATE,
   	monto REAL,
   	concepto VARCHAR(500),
   	id_usuario INT,
   	estado INT, --0=Pendiente, 1=Realizada, 2=Rechazada;
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)

);



