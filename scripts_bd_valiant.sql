-- 1. Tabla: tipos_documento
CREATE TABLE tipos_documento (
    id_tipo_documento INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

-- 2. Tabla: clientes
CREATE TABLE clientes (
    documento VARCHAR(20) PRIMARY KEY,
    id_tipo_documento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    correo_electronico VARCHAR(100),
    fecha_nacimiento DATE,
    FOREIGN KEY (id_tipo_documento) REFERENCES tipos_documento(id_tipo_documento)
);

-- 3. Tabla: aseguradoras
CREATE TABLE aseguradoras (
    id_compania INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

-- 4. Tabla: ramos
CREATE TABLE ramos (
    id_ramo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    tipo_seguro VARCHAR(50) NOT NULL
);

-- 5. Tabla: polizas
CREATE TABLE polizas (
    numero_poliza VARCHAR(30) PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    descripcion TEXT,
    id_ramo INT NOT NULL,
    id_aseguradora INT NOT NULL,
    valor DECIMAL(15, 2),
    riesgo VARCHAR(50),
    documento_tomador VARCHAR(20),
    documento_asegurado VARCHAR(20),
    documento_beneficiario VARCHAR(20),
    documento_principal VARCHAR(20),
    documento_hija VARCHAR(20),
    FOREIGN KEY (id_ramo) REFERENCES ramos(id_ramo),
    FOREIGN KEY (id_aseguradora) REFERENCES aseguradoras(id_compania),
    FOREIGN KEY (documento_tomador) REFERENCES clientes(documento),
    FOREIGN KEY (documento_asegurado) REFERENCES clientes(documento),
    FOREIGN KEY (documento_beneficiario) REFERENCES clientes(documento),
    FOREIGN KEY (documento_principal) REFERENCES clientes(documento),
    FOREIGN KEY (documento_hija) REFERENCES clientes(documento)
);
