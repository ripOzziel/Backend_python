CREATE TABLE ASENTAMIENTO (
    id_asentamiento char(36) PRIMARY KEY DEFAULT (UUID()),
    nomb_asent VARCHAR(65) NOT NULL,
    tipo_asent VARCHAR(35),
    tipo_vial VARCHAR(35),
    edificio VARCHAR(50),
    numero_int VARCHAR(8)
);

CREATE TABLE UBICACION (
    id_ubicacion char(36) PRIMARY KEY DEFAULT (UUID()),
    cod_postal VARCHAR(5),
    cve_mun VARCHAR(5),
    cve_loc VARCHAR(8),
    latitud DECIMAL(12, 8) NOT NULL,
    longitud DECIMAL(12, 8) NOT NULL,
    id_asentamiento char(36) NOT NULL,
    FOREIGN KEY (id_asentamiento) REFERENCES ASENTAMIENTO(id_asentamiento)
);

CREATE TABLE ESTABLECIMIENTO (
    id_establecimiento char(36) PRIMARY KEY DEFAULT (UUID()),
    nom_estab VARCHAR(220) NOT NULL,
    raz_social VARCHAR(220),
    codigo_act VARCHAR(8) NOT NULL,
    fecha_alta DATE NOT NULL,
    id_ubicacion char(36) NOT NULL,
    FOREIGN KEY (id_ubicacion) REFERENCES UBICACION(id_ubicacion)
);

CREATE TABLE TELEFONO_ESTABLECIMIENTO (
    id_telefono char(36) PRIMARY KEY DEFAULT (UUID()),
    telefono VARCHAR(15),
    id_establecimiento char(36) NOT NULL,
    FOREIGN KEY (id_establecimiento) REFERENCES ESTABLECIMIENTO(id_establecimiento)
);

CREATE TABLE CORREO_ESTABLECIMIENTO (
    id_correo char(36) PRIMARY KEY DEFAULT (UUID()),
    correo VARCHAR(85),
    id_establecimiento char(36) NOT NULL,
    FOREIGN KEY (id_establecimiento) REFERENCES ESTABLECIMIENTO(id_establecimiento)
);

CREATE TABLE WWW_ESTABLECIMIENTO (
    id_www char(36) PRIMARY KEY DEFAULT (UUID()),
    www VARCHAR(85),
    id_establecimiento char(36) NOT NULL,
    FOREIGN KEY (id_establecimiento) REFERENCES ESTABLECIMIENTO(id_establecimiento)
);

