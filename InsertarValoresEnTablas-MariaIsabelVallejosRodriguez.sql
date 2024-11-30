/********************************************************** 
* Curso: Fundamentos de Bases de Datos
* Profesor: Brayner Salmeron Castillo
* Proyecto: Sistema de inventario para tienda de tecnologia
* Descripcion: Script para popular las tablas creadas 
* Autor: Maria Isabel Vallejos Rodriguez
* Fecha: Noviembre 2024 
***********************************************************/

USE DB_TiendaTecnologia

-- Insertar Categorías
INSERT INTO Categorias (nombre, descripcion) VALUES
('Laptops', 'Computadoras portátiles de diferentes marcas'),
('Smartphones', 'Teléfonos inteligentes de última generación'),
('Tablets', 'Tabletas de diversos tamaños y marcas'),
('Accesorios', 'Periféricos y accesorios varios'),
('Monitores', 'Pantallas y monitores de diferentes tamaños'),
('Componentes PC', 'Componentes para computadoras de escritorio'),
('Audio', 'Equipos de sonido y audio'),
('Gaming', 'Productos para videojuegos'),
('Almacenamiento', 'Dispositivos de almacenamiento'),
('Redes', 'Equipos de conectividad y redes');

-- Insertar Métodos de Pago
INSERT INTO MetodosPagos (nombre, descripcion) VALUES
('Efectivo', 'Pago en efectivo al momento de la compra'),
('Tarjeta Crédito', 'Pago con tarjeta de crédito'),
('Tarjeta Débito', 'Pago con tarjeta de débito'),
('PayPal', 'Pago a través de cuenta PayPal'),
('Transferencia', 'Transferencia bancaria'),
('Bitcoin', 'Pago con criptomoneda Bitcoin'),
('Financiamiento', 'Pago en cuotas con financiamiento'),
('Cheque', 'Pago con cheque bancario'),
('Mercado Pago', 'Pago a través de Mercado Pago'),
('Google Pay', 'Pago mediante Google Pay');

-- Insertar Proveedores
INSERT INTO Proveedores (nombre, direccion, contactoPrincipal, telefono) VALUES
('TechWorld Inc', 'Av. Silicon Valley 123, CA', 'John Smith', '+1-555-0123'),
('Electrónica Global', 'Calle Principal 456, Madrid', 'María García', '+34-612345678'),
('AsiaComp', 'Dragon Street 789, Hong Kong', 'Lee Wong', '+852-98765432'),
('InnoTech', 'Tech Park 321, Seúl', 'Kim Lee', '+82-1012345678'),
('Digital Solutions', 'Digital Ave 654, Toronto', 'Mike Johnson', '+1-416-555-0199'),
('MegaComp', 'Tech Boulevard 987, Berlín', 'Hans Mueller', '+49-30-12345678'),
('ElectroMex', 'Reforma 246, CDMX', 'Carlos Ruiz', '+52-55-12345678'),
('TechnoIndia', 'Tech Park 111, Bangalore', 'Raj Patel', '+91-9876543210'),
('BrasilTech', 'Av Paulista 333, São Paulo', 'Pedro Santos', '+55-11-98765432'),
('ArgentinaDigital', 'Av Corrientes 555, Buenos Aires', 'Laura Pérez', '+54-911-12345678');

-- Insertar Clientes
INSERT INTO Clientes (nombre, direccion, email, telefono) VALUES
('Ana Martínez', 'Calle 123, Ciudad', 'ana.martinez@email.com', '+1-555-1234'),
('Pedro González', 'Av Principal 456', 'pedro.g@email.com', '+34-612345677'),
('María López', 'Plaza Mayor 789', 'maria.lopez@email.com', '+52-55-87654321'),
('Juan Rodríguez', 'Carrera 10 #45', 'juan.r@email.com', '+57-310-1234567'),
('Carlos Silva', 'Rua Augusta 123', 'carlos.s@email.com', '+55-11-12345678'),
('Laura Torres', 'Av Libertador 456', 'laura.t@email.com', '+54-911-87654321'),
('José Ramírez', 'Calle Real 789', 'jose.r@email.com', '+51-999-123456'),
('Andrea Castro', 'Av República 321', 'andrea.c@email.com', '+56-9-87654321'),
('Miguel Flores', 'Calle Luna 654', 'miguel.f@email.com', '+593-99-1234567'),
('Carmen Díaz', 'Av Sol 987', 'carmen.d@email.com', '+58-414-1234567');

-- Insertar Productos
INSERT INTO Productos (nombre, precio, stockActual, fk_categoria) VALUES
('Laptop Dell XPS 13', 1299.99, 15, 1),
('iPhone 15 Pro', 999.99, 25, 2),
('Samsung Galaxy Tab S9', 649.99, 20, 3),
('Logitech MX Master 3', 99.99, 30, 4),
('LG 27" 4K Monitor', 399.99, 10, 5),
('AMD Ryzen 9 5950X', 549.99, 8, 6),
('Sony WH-1000XM4', 349.99, 12, 7),
('PlayStation 5', 499.99, 5, 8),
('Samsung 1TB SSD', 129.99, 40, 9),
('TP-Link Archer AX6000', 299.99, 15, 10);

-- Insertar Ventas
INSERT INTO Ventas (fechaVenta, total, fk_cliente, fk_metodoPago) VALUES
('2024-01-15 10:30:00', 1499.99, 1, 2),
('2024-01-16 15:45:00', 999.99, 2, 1),
('2024-01-17 12:20:00', 749.99, 3, 3),
('2024-01-18 16:30:00', 1299.99, 4, 4),
('2024-01-19 11:15:00', 449.99, 5, 2),
('2024-01-20 14:40:00', 899.99, 6, 1),
('2024-01-21 13:25:00', 599.99, 7, 3),
('2024-01-22 17:10:00', 1099.99, 8, 5),
('2024-01-23 10:55:00', 799.99, 9, 2),
('2024-01-24 15:30:00', 649.99, 10, 4);

-- Insertar Compras
INSERT INTO Compras (fechaCompra, total, fk_proveedor) VALUES
('2024-01-10 09:00:00', 5000.00, 1),
('2024-01-11 10:30:00', 7500.00, 2),
('2024-01-12 11:45:00', 3500.00, 3),
('2024-01-13 14:20:00', 6000.00, 4),
('2024-01-14 16:15:00', 4500.00, 5),
('2024-01-15 13:30:00', 8000.00, 6),
('2024-01-16 15:45:00', 3000.00, 7),
('2024-01-17 12:10:00', 5500.00, 8),
('2024-01-18 10:25:00', 4000.00, 9),
('2024-01-19 11:50:00', 6500.00, 10);

-- Insertar Productos-Ventas
INSERT INTO rel_ProductosVentas (fk_producto, fk_venta, cantidad, precioUnitario) VALUES
(1, 1, 1, 1299.99),
(2, 2, 1, 999.99),
(3, 3, 1, 649.99),
(4, 4, 2, 99.99),
(5, 5, 1, 399.99),
(6, 6, 1, 549.99),
(7, 7, 1, 349.99),
(8, 8, 2, 499.99),
(9, 9, 3, 129.99),
(10, 10, 1, 299.99);

-- Insertar Productos-Compras
INSERT INTO rel_ProductosCompras (fk_producto, fk_compra, cantidad, precioUnitario) VALUES
(1, 1, 5, 1000.00),
(2, 2, 10, 750.00),
(3, 3, 7, 500.00),
(4, 4, 15, 75.00),
(5, 5, 5, 300.00),
(6, 6, 4, 400.00),
(7, 7, 6, 250.00),
(8, 8, 3, 400.00),
(9, 9, 20, 100.00),
(10, 10, 8, 200.00);

-- Insertar Productos-Proveedores
INSERT INTO rel_ProductosProveedores (fk_producto, fk_proveedor, precioCompra) VALUES
(1, 1, 1000.00),
(2, 2, 750.00),
(3, 3, 500.00),
(4, 4, 75.00),
(5, 5, 300.00),
(6, 6, 400.00),
(7, 7, 250.00),
(8, 8, 400.00),
(9, 9, 100.00),
(10, 10, 200.00);

-- Insertar Devoluciones
INSERT INTO Devoluciones (fechaDevolucion, motivo, fk_venta, fk_producto) VALUES
('2024-01-17 11:30:00', 'Producto defectuoso', 1, 1),
('2024-01-18 14:45:00', 'No cumple expectativas', 2, 2),
('2024-01-19 16:20:00', 'Error en el pedido', 3, 3),
('2024-01-20 13:15:00', 'Producto dañado en transporte', 4, 4),
('2024-01-21 15:40:00', 'Falla técnica', 5, 5),
('2024-01-22 12:25:00', 'Incompatibilidad de sistema', 6, 6),
('2024-01-23 17:10:00', 'Producto incorrecto', 7, 7),
('2024-01-24 10:55:00', 'No funciona correctamente', 8, 8),
('2024-01-25 14:30:00', 'Daño físico', 9, 9),
('2024-01-26 16:15:00', 'Insatisfacción del cliente', 10, 10);