CREATE TABLE ASENTAMIENTO (
    id_asentamiento INT AUTO_INCREMENT PRIMARY KEY,
    nomb_asent VARCHAR(255),
    tipo_asent VARCHAR(255),
    tipo_vial VARCHAR(255),
    numero_ext VARCHAR(50),
    edificio VARCHAR(255),
    numero_int VARCHAR(50)
);

CREATE TABLE DIRECCION (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    cod_postal VARCHAR(10),
    cve_mun VARCHAR(50),
    cve_loc VARCHAR(50),
    latitud DECIMAL(10, 10),
    longitud DECIMAL(10, 10),
    id_asentamiento INT,
    FOREIGN KEY (id_asentamiento) REFERENCES ASENTAMIENTO(id_asentamiento)
);

CREATE TABLE ESTABLECIMIENTO_CONTACTO (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    telefono VARCHAR(20),
    correoelec VARCHAR(255),
    www VARCHAR(255),
    contactos VARCHAR(255)
);

CREATE TABLE ESTABLECIMIENTO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_estab VARCHAR(255),
    raz_social VARCHAR(255),
    codigo_act VARCHAR(50),
    fecha_alta YEAR-MONTH,
);



