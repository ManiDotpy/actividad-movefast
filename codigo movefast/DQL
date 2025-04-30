--1. Vehículos disponibles en una ciudad específica (Medellín)

SELECT v.*
FROM vehiculo v
JOIN sucursal s 
  ON v.branch = s.branch_id 
WHERE s.city = 'Medellín' AND v.available = TRUE;

--2. Alquileres activos con información del cliente y vehículo

SELECT 
  a.rental_id,
  c.*,
  v.*
FROM alquiler a
JOIN clientes c 
  ON c.id_card = a.client_id
JOIN vehiculo v
  ON v.license_plate = a.vehicle_plate
WHERE CURRENT_DATE 
      BETWEEN DATE(a.start_date) 
          AND DATE(a.end_date);
-- 3. Ingresos totales por sucursal (vehículos con más de 3 alquileres)

SELECT s.city, SUM(p.amount) AS total_income
FROM pago p
JOIN alquiler a ON p.rental_id = a.rental_id
JOIN vehiculo v ON v.license_plate = a.vehicle_plate
JOIN sucursal s ON v.branch = s.branch_id
WHERE v.license_plate IN (
    SELECT vehicle_plate
    FROM alquiler
    GROUP BY vehicle_plate
    HAVING COUNT(*) > 3
)
GROUP BY s.city;
-- 4. Vehículos con más de 5 alquileres (subconsulta)

SELECT s.city, SUM(p.amount) AS total_income
FROM pago p
JOIN alquiler a ON p.rental_id = a.rental_id
JOIN vehiculo v ON v.license_plate = a.vehicle_plate
JOIN sucursal s ON v.branch = s.branch_id
WHERE v.license_plate IN (
    SELECT vehicle_plate
    FROM alquiler
    GROUP BY vehicle_plate
    HAVING COUNT(*) > 3
)
GROUP BY s.city;

-- 5. Suma total de todos los pagos

SELECT *
FROM vehiculo v
WHERE (
  SELECT COUNT(*)
  FROM alquiler a
  WHERE a.vehicle_plate = v.license_plate
) > 5;

SELECT SUM(amount) AS total_payments FROM pago;
