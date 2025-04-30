-- Errores en clientes (usando nuevos valores)
INSERT INTO clientes VALUES 
(2000, 'Daniel', 'Castro', -28, '2024-03-10 08:15:00', 'Bogotá'), -- Error: edad negativa
(2001, 'Patricia', 'Gómez', 45, '2024-02-20 14:30:00', NULL), -- Error: ciudad nula
(1000, 'Ricardo', 'Mendoza', 31, '2024-01-05 11:20:00', 'Medellín'); -- Error: id_card duplicado

-- test sucursal
INSERT INTO sucursal VALUES 
(20, 'Pereira', 'Carrera 8 #12-34', '315555667788'), -- Error: teléfono demasiado largo
(21, NULL, 'Avenida Circunvalar 45-67', '3162223344'), -- Error: ciudad nula
(1, 'Armenia', 'Calle 10 #5-20', '3178889900'); -- Error: branch_id duplicado

-- test vehiculo 
INSERT INTO vehiculo VALUES 
('PDQ567', 'Mazda', 1948, 'Verde', 4, TRUE, 1), -- Error: año fuera de rango
('WER890', 'Volkswagen', 2023, 'Plateado', 3, TRUE, 1), -- Error: tracción inválida
('TYU345', 'Subaru', 2022, 'Negro', 4, TRUE, 100); -- Error: sucursal inexistente

-- test alquiler
INSERT INTO alquiler VALUES 
(200, 9999, 'PDQ567', '2025-06-01 09:00:00', '2025-06-10 17:00:00', TRUE), -- Error: cliente inexistente
(201, 1000, 'ZZZ999', '2025-06-05 10:30:00', '2025-06-15 16:00:00', TRUE), -- Error: vehículo inexistente
(1, 1001, 'WER890', '2025-07-01 08:00:00', '2025-07-05 18:00:00', TRUE); -- Error: rental_id duplicado

-- test pago
INSERT INTO pago VALUES 
(300, 1, -750.00), -- Error: monto negativo
(301, 999, 420.00), -- Error: alquiler inexistente
(1, 2, 380.50); -- Error: payment_id duplicado

-- test ON DELETE CASCADE 
-- datos del test
INSERT INTO clientes VALUES 
(8888, 'Fernando', 'Ríos', 38, CURRENT_TIMESTAMP, 'Bucaramanga');

INSERT INTO alquiler VALUES 
(888, 8888, 'LMN456', '2025-08-01 10:00:00', '2025-08-10 18:00:00', TRUE);

-- test inserción
SELECT * FROM alquiler WHERE client_id = 8888;

-- test eliminando clientes y verificar la eliminación en cascada
DELETE FROM clientes WHERE id_card = 8888;
SELECT * FROM alquiler WHERE client_id = 8888;

-- test ON UPDATE CASCADE 
INSERT INTO sucursal (branch_id, city, address, phone_number) VALUES 
(777, 'Manizales', 'Carrera 22 #15-30', '3189998877');

INSERT INTO vehiculo VALUES 
('BGT987', 'Jeep', 2021, 'Blanco', 4, TRUE, 777);

-- test de inserción
SELECT * FROM vehiculo WHERE license_plate = 'BGT987';

-- Actualiza sucursal y verifica la actualización CASCADE
UPDATE sucursal SET branch_id = 778 WHERE branch_id = 777;
SELECT * FROM vehiculo WHERE license_plate = 'BGT987';
