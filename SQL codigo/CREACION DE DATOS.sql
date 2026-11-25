

/*====================================================
  2. CREAR TABLAS
  Las PK se crean como CLUSTERED
====================================================*/

/* 1. ROL */
CREATE TABLE ROL (
    id_rol INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150),
    CONSTRAINT PK_ROL PRIMARY KEY CLUSTERED (id_rol)
);
GO

/* 2. EMPLEADO */
CREATE TABLE EMPLEADO (
    id_empleado INTEGER NOT NULL,
    id_rol INTEGER NOT NULL,
    dni VARCHAR(15) NOT NULL,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    fecha_nacimiento DATE,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY CLUSTERED (id_empleado),
    CONSTRAINT UQ_EMPLEADO_DNI UNIQUE NONCLUSTERED (dni),
    CONSTRAINT FK_EMPLEADO_ROL FOREIGN KEY (id_rol)
        REFERENCES ROL(id_rol)
);
GO

/* 3. CLIENTE */
CREATE TABLE CLIENTE (
    id_cliente INTEGER NOT NULL,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    tipo_documento VARCHAR(30) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    correo VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    CONSTRAINT PK_CLIENTE PRIMARY KEY CLUSTERED (id_cliente),
    CONSTRAINT UQ_CLIENTE_DOCUMENTO
        UNIQUE NONCLUSTERED (tipo_documento, numero_documento)
);
GO

/* 4. VEHICULO */
CREATE TABLE VEHICULO (
    id_vehiculo INTEGER NOT NULL,
    placa VARCHAR(15) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50) NOT NULL,
    capacidad INTEGER NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT PK_VEHICULO PRIMARY KEY CLUSTERED (id_vehiculo),
    CONSTRAINT UQ_VEHICULO_PLACA UNIQUE NONCLUSTERED (placa)
);
GO

/* 5. RUTA */
CREATE TABLE RUTA (
    id_ruta INTEGER NOT NULL,
    origen VARCHAR(80) NOT NULL,
    destino VARCHAR(80) NOT NULL,
    distancia_km DECIMAL(10,2) NOT NULL,
    duracion_estimada VARCHAR(50) NOT NULL,
    CONSTRAINT PK_RUTA PRIMARY KEY CLUSTERED (id_ruta)
);
GO

/* 6. VENTA */
CREATE TABLE VENTA (
    id_venta INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    fecha_venta DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    CONSTRAINT PK_VENTA PRIMARY KEY CLUSTERED (id_venta),
    CONSTRAINT FK_VENTA_EMPLEADO FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO(id_empleado),
    CONSTRAINT FK_VENTA_CLIENTE FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente)
);
GO

/* 7. ASIENTO */
CREATE TABLE ASIENTO (
    id_asiento INTEGER NOT NULL,
    id_vehiculo INTEGER NOT NULL,
    numero_asiento INTEGER NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    CONSTRAINT PK_ASIENTO PRIMARY KEY CLUSTERED (id_asiento),
    CONSTRAINT UQ_ASIENTO_VEHICULO_NUMERO
        UNIQUE NONCLUSTERED (id_vehiculo, numero_asiento),
    CONSTRAINT FK_ASIENTO_VEHICULO FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULO(id_vehiculo)
);
GO

/* 8. DOCUMENTO_VEHICULAR */
CREATE TABLE DOCUMENTO_VEHICULAR (
    id_documento INTEGER NOT NULL,
    id_vehiculo INTEGER NOT NULL,
    numero_documento VARCHAR(50) NOT NULL,
    tipo_documento VARCHAR(50) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT PK_DOCUMENTO_VEHICULAR
        PRIMARY KEY CLUSTERED (id_documento),
    CONSTRAINT FK_DOCUMENTO_VEHICULAR_VEHICULO
        FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULO(id_vehiculo)
);
GO

/* 9. VIAJE */
CREATE TABLE VIAJE (
    id_viaje INTEGER NOT NULL,
    id_vehiculo INTEGER NOT NULL,
    id_ruta INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL,
    hora_llegada TIME NOT NULL,
    fecha DATE NOT NULL,
    hora_salida TIME NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT PK_VIAJE PRIMARY KEY CLUSTERED (id_viaje),
    CONSTRAINT FK_VIAJE_VEHICULO FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULO(id_vehiculo),
    CONSTRAINT FK_VIAJE_RUTA FOREIGN KEY (id_ruta)
        REFERENCES RUTA(id_ruta),
    CONSTRAINT FK_VIAJE_EMPLEADO FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO(id_empleado)
);
GO

/* 10. BOLETO */
CREATE TABLE BOLETO (
    id_boleto INTEGER NOT NULL,
    id_venta INTEGER NOT NULL,
    id_asiento INTEGER NOT NULL,
    id_viaje INTEGER NOT NULL,
    estado VARCHAR(30) NOT NULL,
    numero_boleto VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_BOLETO PRIMARY KEY CLUSTERED (id_boleto),
    CONSTRAINT UQ_BOLETO_NUMERO
        UNIQUE NONCLUSTERED (numero_boleto),
    CONSTRAINT FK_BOLETO_VENTA FOREIGN KEY (id_venta)
        REFERENCES VENTA(id_venta),
    CONSTRAINT FK_BOLETO_ASIENTO FOREIGN KEY (id_asiento)
        REFERENCES ASIENTO(id_asiento),
    CONSTRAINT FK_BOLETO_VIAJE FOREIGN KEY (id_viaje)
        REFERENCES VIAJE(id_viaje)
);
GO

/* 11. BITACORA_ANULACION */
CREATE TABLE BITACORA_ANULACION (
    id_bitacora INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL,
    id_boleto INTEGER NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    tipo_accion VARCHAR(50) NOT NULL,
    CONSTRAINT PK_BITACORA_ANULACION
        PRIMARY KEY CLUSTERED (id_bitacora),
    CONSTRAINT FK_BITACORA_EMPLEADO FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO(id_empleado),
    CONSTRAINT FK_BITACORA_BOLETO FOREIGN KEY (id_boleto)
        REFERENCES BOLETO(id_boleto)
);
GO

/* 12. HISTORIAL_MANTENIMIENTO */
CREATE TABLE HISTORIAL_MANTENIMIENTO (
    id_mantenimiento INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL,
    id_vehiculo INTEGER NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    taller VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    CONSTRAINT PK_HISTORIAL_MANTENIMIENTO
        PRIMARY KEY CLUSTERED (id_mantenimiento),
    CONSTRAINT FK_MANTENIMIENTO_EMPLEADO
        FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO(id_empleado),
    CONSTRAINT FK_MANTENIMIENTO_VEHICULO
        FOREIGN KEY (id_vehiculo)
        REFERENCES VEHICULO(id_vehiculo)
);
GO

/* 13. SALDO_FAVOR */
CREATE TABLE SALDO_FAVOR (
    id_saldo INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_boleto INTEGER NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fecha_generacion DATETIME NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    CONSTRAINT PK_SALDO_FAVOR PRIMARY KEY CLUSTERED (id_saldo),
    CONSTRAINT FK_SALDO_CLIENTE FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente),
    CONSTRAINT FK_SALDO_BOLETO FOREIGN KEY (id_boleto)
        REFERENCES BOLETO(id_boleto)
);
GO

/* 14. ENCOMIENDA */
CREATE TABLE ENCOMIENDA (
    id_encomienda INTEGER NOT NULL,
    id_viaje INTEGER NOT NULL,
    remitente_nombre VARCHAR(100) NOT NULL,
    destinatario_nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    remitente_documento VARCHAR(20) NOT NULL,
    destinatario_documento VARCHAR(20) NOT NULL,
    fecha_registro DATETIME NOT NULL,
    costo_envio DECIMAL(10,2) NOT NULL,
    peso_kg DECIMAL(8,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT PK_ENCOMIENDA PRIMARY KEY CLUSTERED (id_encomienda),
    CONSTRAINT FK_ENCOMIENDA_VIAJE FOREIGN KEY (id_viaje)
        REFERENCES VIAJE(id_viaje)
);
GO

/* 15. HISTORIAL_ESTADO_ENCOMIENDA */
CREATE TABLE HISTORIAL_ESTADO_ENCOMIENDA (
    id_historial INTEGER NOT NULL,
    id_encomienda INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL,
    estado_nuevo VARCHAR(50) NOT NULL,
    estado_anterior VARCHAR(50) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    CONSTRAINT PK_HISTORIAL_ESTADO_ENCOMIENDA
        PRIMARY KEY CLUSTERED (id_historial),
    CONSTRAINT FK_HISTORIAL_ENCOMIENDA
        FOREIGN KEY (id_encomienda)
        REFERENCES ENCOMIENDA(id_encomienda),
    CONSTRAINT FK_HISTORIAL_EMPLEADO
        FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO(id_empleado)
);
GO


/*====================================================
  3. CREAR INDICES NONCLUSTERED
====================================================*/

/* Índices para relaciones y búsquedas */

CREATE NONCLUSTERED INDEX IX_VENTA_EMPLEADO
ON VENTA(id_empleado);
GO

CREATE NONCLUSTERED INDEX IX_VENTA_CLIENTE
ON VENTA(id_cliente);
GO

CREATE NONCLUSTERED INDEX IX_VENTA_FECHA
ON VENTA(fecha_venta);
GO

CREATE NONCLUSTERED INDEX IX_BITACORA_EMPLEADO
ON BITACORA_ANULACION(id_empleado);
GO

CREATE NONCLUSTERED INDEX IX_BITACORA_BOLETO
ON BITACORA_ANULACION(id_boleto);
GO

CREATE NONCLUSTERED INDEX IX_BITACORA_FECHA
ON BITACORA_ANULACION(fecha_hora);
GO

CREATE NONCLUSTERED INDEX IX_MANTENIMIENTO_EMPLEADO
ON HISTORIAL_MANTENIMIENTO(id_empleado);
GO

CREATE NONCLUSTERED INDEX IX_MANTENIMIENTO_VEHICULO
ON HISTORIAL_MANTENIMIENTO(id_vehiculo);
GO

CREATE NONCLUSTERED INDEX IX_BOLETO_VENTA
ON BOLETO(id_venta);
GO

CREATE NONCLUSTERED INDEX IX_BOLETO_ASIENTO
ON BOLETO(id_asiento);
GO

CREATE NONCLUSTERED INDEX IX_BOLETO_VIAJE
ON BOLETO(id_viaje);
GO

CREATE NONCLUSTERED INDEX IX_SALDO_CLIENTE
ON SALDO_FAVOR(id_cliente);
GO

CREATE NONCLUSTERED INDEX IX_SALDO_BOLETO
ON SALDO_FAVOR(id_boleto);
GO

CREATE NONCLUSTERED INDEX IX_DOCUMENTO_VENCIMIENTO
ON DOCUMENTO_VEHICULAR(fecha_vencimiento);
GO

CREATE NONCLUSTERED INDEX IX_VIAJE_FECHA_ESTADO
ON VIAJE(fecha, estado);
GO

CREATE NONCLUSTERED INDEX IX_VIAJE_RUTA
ON VIAJE(id_ruta);
GO

CREATE NONCLUSTERED INDEX IX_VIAJE_EMPLEADO
ON VIAJE(id_empleado);
GO

CREATE NONCLUSTERED INDEX IX_ENCOMIENDA_VIAJE
ON ENCOMIENDA(id_viaje);
GO

CREATE NONCLUSTERED INDEX IX_ENCOMIENDA_ESTADO_FECHA
ON ENCOMIENDA(estado, fecha_registro);
GO

CREATE NONCLUSTERED INDEX IX_HISTORIAL_ENCOMIENDA_FECHA
ON HISTORIAL_ESTADO_ENCOMIENDA(id_encomienda, fecha_hora);
GO

CREATE NONCLUSTERED INDEX IX_HISTORIAL_EMPLEADO
ON HISTORIAL_ESTADO_ENCOMIENDA(id_empleado);
GO


/*====================================================
  4. CONSULTAR INDICES CREADOS
====================================================*/

SELECT
    OBJECT_NAME(i.object_id) AS Tabla,
    i.name AS Nombre_Indice,
    i.type_desc AS Tipo_Indice
FROM sys.indexes i
WHERE i.object_id IN (
    SELECT object_id
    FROM sys.tables
)
AND i.name IS NOT NULL
ORDER BY Tabla, Tipo_Indice;
GO

SELECT COUNT(*) AS Total_Tablas
FROM sys.tables;

SELECT
    name AS Nombre_Tabla,
    create_date AS Fecha_Creacion
FROM sys.tables
ORDER BY name;
GO


/*====================================================
  5. CONSULTAR ESTADISTICAS DE USO DE INDICES
====================================================*/

SELECT
    OBJECT_NAME(i.object_id) AS Tabla,
    i.name AS Nombre_Indice,
    i.type_desc AS Tipo_Indice,
    ISNULL(us.user_seeks, 0) AS Busquedas,
    ISNULL(us.user_scans, 0) AS Escaneos,
    ISNULL(us.user_lookups, 0) AS Consultas_Adicionales,
    ISNULL(us.user_updates, 0) AS Actualizaciones,
    us.last_user_seek AS Ultima_Busqueda,
    us.last_user_scan AS Ultimo_Escaneo
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats us
    ON i.object_id = us.object_id
    AND i.index_id = us.index_id
    AND us.database_id = DB_ID()
WHERE i.object_id IN (
    SELECT object_id
    FROM sys.tables
)
AND i.index_id > 0
ORDER BY Tabla, Nombre_Indice;
GO
