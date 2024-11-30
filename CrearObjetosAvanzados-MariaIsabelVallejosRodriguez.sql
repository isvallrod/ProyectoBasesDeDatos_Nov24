/********************************************************** 
* Curso: Fundamentos de Bases de Datos
* Profesor: Brayner Salmeron Castillo
* Proyecto: Sistema de inventario para tienda de tecnologia
* Descripcion: Script para crear objetos avanzados
* Objetos generados:
* - Funcion Escalar
* - Funcion de tabla
* - Procedimientos Almacenados
* - Vistas
* - Triggers
* Autor: Maria Isabel Vallejos Rodriguez
* Fecha: Noviembre 2024 
***********************************************************/

USE DB_TiendaTecnologia;

-- =============================================
-- FUNCIONES ESCALARES
-- =============================================

-- 1. Funcion para calcular el valor total del inventario

CREATE FUNCTION fn_ValorTotalInventario()
RETURNS DECIMAL(12,2)
AS
BEGIN
    RETURN (
        SELECT SUM(precio * stockActual)
        FROM Productos
    )
END;

-- Consultar valor total del inventario
SELECT dbo.fn_ValorTotalInventario() as ValorTotal

-- 2. Función para contar productos vendidos en un período
CREATE FUNCTION fn_ProductosVendidosPeriodo
(
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT SUM(cantidad)
        FROM rel_ProductosVentas rpv
        INNER JOIN Ventas v ON rpv.fk_venta = v.id_venta
        WHERE v.fechaVenta BETWEEN @FechaInicio AND @FechaFin
    )
END;

-- Calcular productos vendidos en un perIodo
SELECT dbo.fn_ProductosVendidosPeriodo('2024-01-01', '2024-01-17') as TotalVendidos

-- =============================================
-- FUNCION DE TABLA
-- =============================================

-- 3. Función tabla para productos con stock bajo
CREATE FUNCTION fn_ProductosStockBajo
(
    @StockMinimo INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.id_producto,
        p.nombre,
        p.stockActual,
        p.precio,
        c.nombre as categoria
    FROM Productos p
    INNER JOIN Categorias c ON p.fk_categoria = c.id_categoria
    WHERE p.stockActual <= @StockMinimo
);

-- Consultar productos con bajo stock
SELECT * FROM fn_ProductosStockBajo(10)

-- =============================================
-- PROCEDIMIENTO ALMACENADO
-- =============================================

-- 4. Procedimiento para registrar venta
CREATE PROCEDURE sp_RegistrarVenta
    @ClienteID INT,
    @MetodoPagoID INT,
    @ProductoID INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(10,2)
AS
BEGIN
    -- Crear la venta
    INSERT INTO Ventas (total, fk_cliente, fk_metodoPago)
    VALUES (@Cantidad * @PrecioUnitario, @ClienteID, @MetodoPagoID)
    
    -- Registrar productos vendidos
    INSERT INTO rel_ProductosVentas (fk_producto, fk_venta, cantidad, precioUnitario)
    VALUES (@ProductoID, SCOPE_IDENTITY(), @Cantidad, @PrecioUnitario)
END;

-- Registrar una venta
EXEC sp_RegistrarVenta 1, 1, 1, 2, 100.00

-- 5. Procedimiento para registrar compra
CREATE PROCEDURE sp_RegistrarCompra
    @ProveedorID INT,
    @ProductoID INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(10,2)
AS
BEGIN
    -- Crear la compra
    INSERT INTO Compras (total, fk_proveedor)
    VALUES (@Cantidad * @PrecioUnitario, @ProveedorID)
    
    -- Registrar productos comprados
    INSERT INTO rel_ProductosCompras (fk_producto, fk_compra, cantidad, precioUnitario)
    VALUES (@ProductoID, SCOPE_IDENTITY(), @Cantidad, @PrecioUnitario)
END;

-- Registrar una compra
EXEC sp_RegistrarCompra 1, 1, 5, 80.00

-- =============================================
-- VISTAS
-- =============================================

-- 6. Vista de productos con categorías y stock
CREATE VIEW vw_ProductosStock AS
SELECT 
    p.id_producto,
    p.nombre as producto,
    p.precio,
    p.stockActual,
    c.nombre as categoria
FROM Productos p
INNER JOIN Categorias c ON p.fk_categoria = c.id_categoria;

SELECT * FROM vw_ProductosStock

-- 7. Vista de ventas por cliente y fecha
CREATE VIEW vw_VentasClientesFecha AS
SELECT 
    v.id_venta,
    v.fechaVenta,
    c.nombre as cliente,
    v.total,
    mp.nombre as metodoPago
FROM Ventas v
INNER JOIN Clientes c ON v.fk_cliente = c.id_cliente
INNER JOIN MetodosPagos mp ON v.fk_metodoPago = mp.id_metodoPago;

-- Ver ventas por cliente
SELECT * FROM vw_VentasClientesFecha

-- 8. Vista de compras por proveedor y fecha
CREATE VIEW vw_ComprasProveedoresFecha AS
SELECT 
    com.id_compra,
    com.fechaCompra,
    p.nombre as proveedor,
    com.total
FROM Compras com
INNER JOIN Proveedores p ON com.fk_proveedor = p.id_proveedor;

-- Ver compras por proveedor
SELECT * FROM vw_ComprasProveedoresFecha

-- =============================================
-- TRIGGER
-- =============================================

-- 9. Trigger para actualizar stock después de venta
CREATE TRIGGER tr_ActualizarStockVenta
ON rel_ProductosVentas
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET stockActual = p.stockActual - i.cantidad
    FROM Productos p
    INNER JOIN inserted i ON p.id_producto = i.fk_producto
END;

-- El trigger se activa automáticamente después de:
INSERT INTO rel_ProductosVentas (fk_producto, fk_venta, cantidad, precioUnitario)
VALUES (1, 1, 5, 99.99);

-- 10. Trigger para actualizar stock después de compra
CREATE TRIGGER tr_ActualizarStockCompra
ON rel_ProductosCompras
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET stockActual = p.stockActual + i.cantidad
    FROM Productos p
    INNER JOIN inserted i ON p.id_producto = i.fk_producto
END;

-- El trigger se activa automáticamente después de:
INSERT INTO rel_ProductosCompras (fk_producto, fk_compra, cantidad, precioUnitario)
VALUES (1, 1, 50, 75.00);