CREATE DATABASE IF NOT EXISTS `soluciones_integradas` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `soluciones_integradas`;

CREATE TABLE EMPRESA(
	idEmpresa INTEGER,
  nit INTEGER PRIMARY KEY,
  nombre_empresa VARCHAR(30) NOT NULL,
  direccionPrincipal Varchar(80),
  telefono VARCHAR(10),
  estado_social VARCHAR(30)    
);

INSERT INTO empresa VALUES 
(
  1,
  1234567890, 
  "SOLUCIONES INTEGRADAS S.A", 
  "calle 16 # 4 -128 bodega 5 - IBAGUE", 
  "0382583244", 
  "Empresa de transporte"
);

CREATE TABLE departamentos(
  idDepartamento INTEGER PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  empresa_nit INTEGER,
  FOREIGN KEY (empresa_nit) REFERENCES EMPRESA (nit)
);
INSERT INTO departamentos VALUES (73, "Tolima", 1234567890);
INSERT INTO departamentos VALUES (41, "Huila", 1234567890);
INSERT INTO departamentos VALUES (18, "Caqueta", 1234567890);

CREATE TABLE SEDES(
    idSedes INTEGER PRIMARY KEY,
    nombreCiudad VARCHAR(30),
    direccion VARCHAR(40) ,
    telefono VARCHAR(30),
    idDepartamento INTEGER NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES departamentos (idDepartamento)    
);

INSERT INTO SEDES VALUES (101, "ibague", "calle 16 # 4 -128 bodega 5", "0382583244", 73);
INSERT INTO SEDES VALUES (201, "neiva", "Avenida 14 # 6 - 80", "0322567897", 41);
INSERT INTO SEDES VALUES (301, "Florencia", "carrera 120 # 52 - 22", "0312599122", 18);


CREATE TABLE administrador(
  id_administrador INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre_completo VARCHAR(40),
  cedula INTEGER,
  fecha_nacimiento VARCHAR(20),
  contrasena VARCHAR(30),
  telefono VARCHAR(10), 
  ciudad Varchar(20)  
);

INSERT INTO administrador VALUES (1, "Jonathan Rincon", 12345678, "1992/07/30", "J12345", "2524365", "Neiva");
INSERT INTO administrador VALUES (2, "Quiroga Cortes", 987654321,"1993/07/08", "Q12345","2589678", "Florencia" );
INSERT INTO administrador VALUES (3, "Juan Ordoñez", 246897541, "1984/04/25", "J12345", "2513146", "Ibagué");


CREATE TABLE funcionarios(
  identificacion INTEGER PRIMARY KEY,
  nombre_completo VARCHAR(50),
  fecha_nacimiento VARCHAR(20),
  telefono VARCHAR(10),
  contrasena VARCHAR(10),
  rol VARCHAR(30)  
);

INSERT into funcionarios VALUES ( 9852471, "Carlos Gómez","1978/04/25", "2065874", "Qr9075", "Cajero");
INSERT into funcionarios VALUES ( 526478 , "Pepita Mendieta", "1985/05/10", "5478921", "N96512",  "Cajera");
INSERT into funcionarios VALUES ( 369874 , "Sebastián Cortes","1985/05/10", "9857411", "P45678", "Bodeguero");
INSERT into funcionarios VALUES ( 635789 , "Jorge Pérez", "1982/01/02",  "3685478", "Q78430",  "Cajero");
INSERT into funcionarios VALUES ( 578925 , "Salomón González","1978/04/25", "6897462", "P45678", "Bodeguero");
INSERT into funcionarios VALUES ( 3245689, "Pedro Fernández","1983/07/04", "3333333", "JRY678", "Bodeguero");


CREATE TABLE EMPLEADOS(
  identificacion INTEGER PRIMARY KEY,
  nombre_completo VARCHAR(40), 
  fecha_nacimiento VARCHAR(20),
  telefono VARCHAR(10),
  direccion VARCHAR(40),
  contrasena VARCHAR(30)  
);

INSERT INTO EMPLEADOS VALUES ( 26485245, "Andrés Medina", "10/05/1980", "6441934","calle 8 5 - 22", "Cvtfe34");
INSERT INTO EMPLEADOS VALUES ( 17653841, "Arturo Monje", "25/04/1978","7245678", " Kr 8 # 1 - 11", "K567892");
INSERT INTO EMPLEADOS VALUES ( 46378521, "Gladys Cuellar", "5/10/1985","6543213", "Kr 1 # 8 - 72","Drt7u93");
INSERT INTO EMPLEADOS VALUES ( 1117564852, "Milena Guzmán", "07/04/1983", "6789054", " Cl 2 # 8 - 11","Gertujh");



CREATE TABLE envios(
  idenvios INTEGER PRIMARY KEY,
  ciudad_origen VARCHAR(30),
  ciudad_destino VARCHAR(30),
  fecha_hora_envio VARCHAR(30),
  detalles_envio VARCHAR(60),
  identificacion INTEGER REFERENCES usuarios (identificacion)
);

INSERT into envios VALUES (1, "ibague", "neiva", "2018/07/30 13:07:00", "Paquete delicado es un instrucmento", 109845678);
INSERT into envios VALUES (2, "Florencia", "ibague", "2018/07/30 13:45:00","delicado", 3214567);
INSERT into envios VALUES (3, "neiva", "Florencia", "2018/07/30 13:29:00","pesado", 36789065 );
INSERT into envios VALUES (4, "neiva", "Florencia", "2018/07/30 13:37:00","delicado", 1099765);
INSERT into envios VALUES (5, "Florencia", "Neiva", "2018/07/30 13:38:00","pesado", 1117456123);
INSERT into envios VALUES (6, "ibague", "Florencia", "2018/07/30 13:49:00","delicado",  16789045);
INSERT into envios VALUES (7, "ibague", "Neiva", "2018/07/30 13:50:00","relojes", 17685247 );
INSERT into envios VALUES (8, "neiva", "Florencia", "2018/07/30 13:55:00","delicado-portatil",  88562478);


CREATE TABLE usuarios(
  identificacion INTEGER PRIMARY KEY,
  nombre_completo VARCHAR(40),
  fecha_nacimiento VARCHAR(20),
  telefono VARCHAR(10),
  direccion VARCHAR(30),
  ciudad VARCHAR(20)
);



INSERT into usuarios VALUES( 109845678, "Carlos Medina", "1978/04/25", "6441934", "Cra 21 15-02", "Florencia");
INSERT into usuarios VALUES( 3214567, "Zulia Vega",  "1983/07/04", "7245678", "AV 115 25-40", "Neiva");
INSERT into usuarios VALUES( 36789065, "Alexander Otálora", "1980/10/05",  "6543213", "Cra 24 Nro 38-18", "Ibagué");
INSERT into usuarios VALUES( 1099765, "Lucia Acuña", "1980/09/25", "6789054", "Cra 25 Nro 45-125", "Neiva");
INSERT into usuarios VALUES( 1117456123, "Taliana Vargas", "1999/10/08",  "6789032", "Diag 25 Nro 12-45", "Ibagué");
INSERT into usuarios VALUES( 16789045, "Elizabeth Rincón", "1985/5/10", "7896543", "Cra 25 Nro 76-25",  "Florencia");
INSERT into usuarios VALUES( 17685247, "Carlos Esteban Franco", "1982/01/02", "6875241", "Manzana 25 Casa 545", "Ibagué");
INSERT into usuarios VALUES( 88562478, "Francisco Medina",  "1984/01/22",  "9638524", "Cra 10 No12-05",  "Neiva");
