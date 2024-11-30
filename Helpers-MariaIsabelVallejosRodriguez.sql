/********************************************************** 
* Curso: Fundamentos de Bases de Datos
* Profesor: Brayner Salmeron Castillo
* Proyecto: Sistema de inventario para tienda de tecnologia
* Descripcion: Helpers
* Autor: Maria Isabel Vallejos Rodriguez
* Fecha: Noviembre 2024 
***********************************************************/

USE DB_TiendaTecnologia;

SELECT * FROM Compras

DELETE FROM Proveedores;
DBCC CHECKIDENT ('Proveedores', RESEED, 0);

ALTER TABLE Proveedores
ALTER COLUMN telefono VARCHAR(20) NOT NULL;

UPDATE Productos 
SET stockActual = stockActual - 1 
WHERE id IN (
    SELECT fk_producto 
    FROM rel_ProductosVentas 
    WHERE fk_venta = 1
);

DELETE FROM Ventas 
WHERE fechaVenta < '2024-01-01';

SELECT * FROM Devoluciones

SELECT * FROM Clientes

SP_RENAME 'rel_Productos_Ventas', 'rel_ProductosVentas';
SELECT * FROM rel_ProductosProveedores

SELECT * FROM rel_ProductosVentas pv
    INNER JOIN Ventas v ON pv.fk_venta = v.id_venta

SELECT * from rel_ProductosVentas

UPDATE Productos 
SET precio = precio * 1.05 
WHERE fk_categoria IN (1, 2, 3);

DELETE FROM Productos 
WHERE stockActual = 0;

UPDATE Clientes 
SET email = 'nuevo.email@email.com',
    telefono = '+1-555-9999' 
WHERE id = 1;

UPDATE Ventas 
SET fk_metodoPago = 2
WHERE fk_cliente = 1;
