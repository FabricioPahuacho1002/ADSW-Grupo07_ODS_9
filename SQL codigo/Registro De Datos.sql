
USE BD_Expreso_Internacional;
GO

/* 1. ROL */
INSERT INTO ROL (id_rol, nombre, descripcion)
VALUES
(1, 'Administrador', 'Gestion del sistema'),
(2, 'Vendedor', 'Venta de boletos'),
(3, 'Conductor', 'Conduccion de vehiculos'),
(4, 'Encomiendas', 'Gestion de encomiendas'),
(5, 'Supervisor', 'Supervision de operaciones');


/* 2. EMPLEADO */
INSERT INTO EMPLEADO
(id_empleado, id_rol, dni, nombres, apellidos, telefono,
 correo, fecha_nacimiento, estado)
VALUES
(1, 1, '70000001', 'Carlos', 'Perez', '900000001', 'carlos@gmail.com', '2000-01-15', 'ACTIVO'),
(2, 2, '70000002', 'Juan', 'Lopez', '900000002', 'juan@gmail.com', '1998-05-20', 'ACTIVO'),
(3, 3, '70000003', 'Pedro', 'Garcia', '900000003', 'pedro@gmail.com', '1995-08-10', 'ACTIVO'),
(4, 4, '70000004', 'Luis', 'Torres', '900000004', 'luis@gmail.com', '1999-03-12', 'ACTIVO'),
(5, 5, '70000005', 'Miguel', 'Rojas', '900000005', 'miguel@gmail.com', '1997-11-25', 'ACTIVO'),
(6, 2, '70000006', 'Jose', 'Castro', '900000006', 'jose@gmail.com', '1996-04-18', 'ACTIVO'),
(7, 3, '70000007', 'Diego', 'Mendoza', '900000007', 'diego@gmail.com', '1994-07-22', 'ACTIVO'),
(8, 4, '70000008', 'Marco', 'Soto', '900000008', 'marco@gmail.com', '1993-09-14', 'ACTIVO'),
(9, 2, '70000009', 'Andres', 'Flores', '900000009', 'andres@gmail.com', '2001-02-11', 'ACTIVO'),
(10, 3, '70000010', 'Ricardo', 'Quispe', '900000010', 'ricardo@gmail.com', '1992-12-05', 'ACTIVO');


/* 3. CLIENTE */
INSERT INTO CLIENTE
(id_cliente, nombres, apellidos, tipo_documento,
 numero_documento, correo, telefono, direccion)
VALUES
(1, 'Ana', 'Flores', 'DNI', '75000001', 'ana@gmail.com', '910000001', 'Huancayo'),
(2, 'Maria', 'Quispe', 'DNI', '75000002', 'maria@gmail.com', '910000002', 'El Tambo'),
(3, 'Jose', 'Castro', 'DNI', '75000003', 'jose@gmail.com', '910000003', 'Chilca'),
(4, 'Rosa', 'Mendoza', 'DNI', '75000004', 'rosa@gmail.com', '910000004', 'Pilcomayo'),
(5, 'David', 'Soto', 'DNI', '75000005', 'david@gmail.com', '910000005', 'Huancayo'),
(6, 'Lucia', 'Rojas', 'DNI', '75000006', 'lucia@gmail.com', '910000006', 'Concepcion'),
(7, 'Pedro', 'Torres', 'DNI', '75000007', 'pedro@gmail.com', '910000007', 'Jauja'),
(8, 'Elena', 'Garcia', 'DNI', '75000008', 'elena@gmail.com', '910000008', 'Huancayo'),
(9, 'Mario', 'Lopez', 'DNI', '75000009', 'mario@gmail.com', '910000009', 'Chilca'),
(10, 'Sofia', 'Perez', 'DNI', '75000010', 'sofia@gmail.com', '910000010', 'El Tambo');


/* 4. VEHICULO */
INSERT INTO VEHICULO
(id_vehiculo, placa, marca, modelo, capacidad, estado)
VALUES
(1, 'ABC-101', 'Mercedes-Benz', 'O500', 40, 'ACTIVO'),
(2, 'ABC-102', 'Volvo', 'B450', 40, 'ACTIVO'),
(3, 'ABC-103', 'Scania', 'K360', 40, 'ACTIVO'),
(4, 'ABC-104', 'Mercedes-Benz', 'O500', 40, 'ACTIVO'),
(5, 'ABC-105', 'Volvo', 'B450', 40, 'ACTIVO');


/* 5. RUTA */
INSERT INTO RUTA
(id_ruta, origen, destino, distancia_km, duracion_estimada)
VALUES
(1, 'Huancayo', 'Lima', 300, 8),
(2, 'Huancayo', 'Ayacucho', 250, 7),
(3, 'Huancayo', 'Huancavelica', 150, 5),
(4, 'Huancayo', 'Jauja', 45, 1),
(5, 'Huancayo', 'Tarma', 110, 3);


/* 6. VENTA */
INSERT INTO VENTA
(id_venta, id_empleado, id_cliente, fecha_venta,
 total, estado, metodo_pago)
VALUES
(1, 2, 1, '2026-11-01', 75.00, 'PAGADA', 'EFECTIVO'),
(2, 6, 2, '2026-11-02', 80.00, 'PAGADA', 'YAPE'),
(3, 9, 3, '2026-11-03', 90.00, 'PAGADA', 'TARJETA'),
(4, 2, 4, '2026-11-04', 75.00, 'PAGADA', 'EFECTIVO'),
(5, 6, 5, '2026-11-05', 85.00, 'PAGADA', 'YAPE'),
(6, 9, 6, '2026-11-06', 95.00, 'PAGADA', 'TARJETA'),
(7, 2, 7, '2026-11-07', 75.00, 'PAGADA', 'EFECTIVO'),
(8, 6, 8, '2026-11-08', 80.00, 'PAGADA', 'YAPE'),
(9, 9, 9, '2026-11-09', 90.00, 'PAGADA', 'TARJETA'),
(10, 2, 10, '2026-11-10', 85.00, 'PAGADA', 'EFECTIVO');


/* 7. ASIENTO */
INSERT INTO ASIENTO
(id_asiento, id_vehiculo, numero_asiento, tipo)
VALUES
(1, 1, 1, 'NORMAL'),
(2, 1, 2, 'NORMAL'),
(3, 2, 1, 'NORMAL'),
(4, 2, 2, 'NORMAL'),
(5, 3, 1, 'NORMAL'),
(6, 3, 2, 'NORMAL'),
(7, 4, 1, 'NORMAL'),
(8, 4, 2, 'NORMAL'),
(9, 5, 1, 'NORMAL'),
(10, 5, 2, 'NORMAL');


/* 8. DOCUMENTO_VEHICULAR */
INSERT INTO DOCUMENTO_VEHICULAR
(id_documento, id_vehiculo, numero_documento,
 tipo_documento, fecha_emision, fecha_vencimiento, estado)
VALUES
(1, 1, 'DOC-001', 'SOAT', '2026-01-01', '2027-01-01', 'VIGENTE'),
(2, 2, 'DOC-002', 'SOAT', '2026-02-01', '2027-02-01', 'VIGENTE'),
(3, 3, 'DOC-003', 'SOAT', '2026-03-01', '2027-03-01', 'VIGENTE'),
(4, 4, 'DOC-004', 'SOAT', '2026-04-01', '2027-04-01', 'VIGENTE'),
(5, 5, 'DOC-005', 'SOAT', '2026-05-01', '2027-05-01', 'VIGENTE');


/* 9. VIAJE */
INSERT INTO VIAJE
(id_viaje, id_vehiculo, id_ruta, id_empleado,
 hora_llegada, fecha, hora_salida, estado)
VALUES
(1, 1, 1, 3, '16:00:00', '2026-11-16', '08:00:00', 'PROGRAMADO'),
(2, 2, 2, 7, '15:00:00', '2026-11-17', '08:00:00', 'PROGRAMADO'),
(3, 3, 3, 10, '13:00:00', '2026-11-18', '08:00:00', 'PROGRAMADO'),
(4, 4, 4, 3, '10:00:00', '2026-11-19', '09:00:00', 'PROGRAMADO'),
(5, 5, 5, 7, '12:00:00', '2026-11-20', '09:00:00', 'PROGRAMADO'),
(6, 1, 1, 10, '16:00:00', '2026-11-21', '08:00:00', 'PROGRAMADO'),
(7, 2, 2, 3, '15:00:00', '2026-11-22', '08:00:00', 'PROGRAMADO'),
(8, 3, 3, 7, '13:00:00', '2026-11-23', '08:00:00', 'PROGRAMADO'),
(9, 4, 4, 10, '10:00:00', '2026-11-24', '09:00:00', 'PROGRAMADO'),
(10, 5, 5, 3, '12:00:00', '2026-11-25', '09:00:00', 'PROGRAMADO');


/* 10. BOLETO */
INSERT INTO BOLETO
(id_boleto, id_venta, id_asiento, id_viaje,
 estado, numero_boleto, precio)
VALUES
(1, 1, 1, 1, 'VENDIDO', 'BOL-001', 75.00),
(2, 2, 3, 2, 'VENDIDO', 'BOL-002', 80.00),
(3, 3, 5, 3, 'VENDIDO', 'BOL-003', 90.00),
(4, 4, 7, 4, 'VENDIDO', 'BOL-004', 75.00),
(5, 5, 9, 5, 'VENDIDO', 'BOL-005', 85.00),
(6, 6, 2, 6, 'VENDIDO', 'BOL-006', 95.00),
(7, 7, 4, 7, 'VENDIDO', 'BOL-007', 75.00),
(8, 8, 6, 8, 'VENDIDO', 'BOL-008', 80.00),
(9, 9, 8, 9, 'VENDIDO', 'BOL-009', 90.00),
(10, 10, 10, 10, 'VENDIDO', 'BOL-010', 85.00);


/* 11. BITACORA_ANULACION */
INSERT INTO BITACORA_ANULACION
(id_bitacora, id_empleado, id_boleto, motivo,
 fecha_hora, tipo_accion)
VALUES
(1, 2, 1, 'Solicitud del cliente', '2026-11-01 10:00:00', 'ANULACION'),
(2, 6, 2, 'Cambio de fecha', '2026-11-02 11:00:00', 'ANULACION'),
(3, 9, 3, 'Error en la compra', '2026-11-03 12:00:00', 'ANULACION'),
(4, 2, 4, 'Solicitud del cliente', '2026-11-04 13:00:00', 'ANULACION'),
(5, 6, 5, 'Cambio de destino', '2026-11-05 14:00:00', 'ANULACION');


/* 12. HISTORIAL_MANTENIMIENTO */
INSERT INTO HISTORIAL_MANTENIMIENTO
(id_mantenimiento, id_empleado, id_vehiculo,
 fecha, descripcion, taller, costo, tipo)
VALUES
(1, 1, 1, '2026-10-01', 'Cambio de aceite', 'Taller Central', 250.00, 'PREVENTIVO'),
(2, 1, 2, '2026-10-02', 'Revision de frenos', 'Taller Central', 300.00, 'PREVENTIVO'),
(3, 5, 3, '2026-10-03', 'Revision de motor', 'Taller Norte', 500.00, 'CORRECTIVO'),
(4, 5, 4, '2026-10-04', 'Cambio de llantas', 'Taller Norte', 800.00, 'CORRECTIVO'),
(5, 1, 5, '2026-10-05', 'Revision general', 'Taller Central', 350.00, 'PREVENTIVO');


/* 13. SALDO_FAVOR */
INSERT INTO SALDO_FAVOR
(id_saldo, id_cliente, id_boleto, estado,
 fecha_generacion, monto, fecha_vencimiento)
VALUES
(1, 1, 1, 'ACTIVO', '2026-11-01', 75.00, '2026-12-01'),
(2, 2, 2, 'ACTIVO', '2026-11-02', 80.00, '2026-12-02'),
(3, 3, 3, 'ACTIVO', '2026-11-03', 90.00, '2026-12-03'),
(4, 4, 4, 'ACTIVO', '2026-11-04', 75.00, '2026-12-04'),
(5, 5, 5, 'ACTIVO', '2026-11-05', 85.00, '2026-12-05');


/* 14. ENCOMIENDA */
INSERT INTO ENCOMIENDA
(id_encomienda, id_viaje, remitente_nombre,
 destinatario_nombre, descripcion, remitente_documento,
 destinatario_documento, fecha_registro,
 costo_envio, peso_kg, estado)
VALUES
(1, 1, 'Jorge Perez', 'Ana Lopez', 'Caja de ropa', '70000101', '70000102', '2026-11-01', 25.00, 2.50, 'PENDIENTE'),
(2, 2, 'Luis Castro', 'Maria Rojas', 'Documentos', '70000103', '70000104', '2026-11-02', 15.00, 0.50, 'PENDIENTE'),
(3, 3, 'Pedro Soto', 'Carlos Flores', 'Repuestos', '70000105', '70000106', '2026-11-03', 35.00, 5.00, 'PENDIENTE'),
(4, 4, 'Rosa Torres', 'Jose Mendoza', 'Paquete pequeño', '70000107', '70000108', '2026-11-04', 20.00, 1.00, 'PENDIENTE'),
(5, 5, 'David Garcia', 'Lucia Perez', 'Caja de alimentos', '70000109', '70000110', '2026-11-05', 30.00, 4.00, 'PENDIENTE'),
(6, 6, 'Mario Quispe', 'Elena Soto', 'Ropa y zapatos', '70000111', '70000112', '2026-11-06', 28.00, 3.00, 'PENDIENTE'),
(7, 7, 'Sofia Lopez', 'Pedro Flores', 'Documentos', '70000113', '70000114', '2026-11-07', 15.00, 0.50, 'PENDIENTE'),
(8, 8, 'Ana Castro', 'Luis Perez', 'Accesorios', '70000115', '70000116', '2026-11-08', 22.00, 1.50, 'PENDIENTE'),
(9, 9, 'Jose Rojas', 'Rosa Garcia', 'Caja de productos', '70000117', '70000118', '2026-11-09', 40.00, 6.00, 'PENDIENTE'),
(10, 10, 'Miguel Torres', 'Carlos Soto', 'Paquete mediano', '70000119', '70000120', '2026-11-10', 25.00, 2.00, 'PENDIENTE');


/* 15. HISTORIAL_ESTADO_ENCOMIENDA */
INSERT INTO HISTORIAL_ESTADO_ENCOMIENDA
(id_historial, id_encomienda, id_empleado,
 estado_nuevo, estado_anterior, fecha_hora)
VALUES
(1, 1, 4, 'EN TRANSITO', 'PENDIENTE', '2026-11-01 10:00:00'),
(2, 2, 8, 'EN TRANSITO', 'PENDIENTE', '2026-11-02 11:00:00'),
(3, 3, 4, 'EN TRANSITO', 'PENDIENTE', '2026-11-03 12:00:00'),
(4, 4, 8, 'EN TRANSITO', 'PENDIENTE', '2026-11-04 13:00:00'),
(5, 5, 4, 'EN TRANSITO', 'PENDIENTE', '2026-11-05 14:00:00'),
(6, 6, 8, 'EN TRANSITO', 'PENDIENTE', '2026-11-06 15:00:00'),
(7, 7, 4, 'EN TRANSITO', 'PENDIENTE', '2026-11-07 10:00:00'),
(8, 8, 8, 'EN TRANSITO', 'PENDIENTE', '2026-11-08 11:00:00'),
(9, 9, 4, 'EN TRANSITO', 'PENDIENTE', '2026-11-09 12:00:00'),
(10, 10, 8, 'EN TRANSITO', 'PENDIENTE', '2026-11-10 13:00:00');
GO


--VERIFICAR REGISTROS--
SELECT 'ROL' AS Tabla, COUNT(*) AS Total FROM ROL
UNION ALL SELECT 'EMPLEADO', COUNT(*) FROM EMPLEADO
UNION ALL SELECT 'CLIENTE', COUNT(*) FROM CLIENTE
UNION ALL SELECT 'VEHICULO', COUNT(*) FROM VEHICULO
UNION ALL SELECT 'RUTA', COUNT(*) FROM RUTA
UNION ALL SELECT 'VENTA', COUNT(*) FROM VENTA
UNION ALL SELECT 'ASIENTO', COUNT(*) FROM ASIENTO
UNION ALL SELECT 'DOCUMENTO_VEHICULAR', COUNT(*) FROM DOCUMENTO_VEHICULAR
UNION ALL SELECT 'VIAJE', COUNT(*) FROM VIAJE
UNION ALL SELECT 'BOLETO', COUNT(*) FROM BOLETO
UNION ALL SELECT 'BITACORA_ANULACION', COUNT(*) FROM BITACORA_ANULACION
UNION ALL SELECT 'HISTORIAL_MANTENIMIENTO', COUNT(*) FROM HISTORIAL_MANTENIMIENTO
UNION ALL SELECT 'SALDO_FAVOR', COUNT(*) FROM SALDO_FAVOR
UNION ALL SELECT 'ENCOMIENDA', COUNT(*) FROM ENCOMIENDA
UNION ALL SELECT 'HISTORIAL_ESTADO_ENCOMIENDA', COUNT(*) FROM HISTORIAL_ESTADO_ENCOMIENDA;