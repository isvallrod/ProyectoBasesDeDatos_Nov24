/********************************************************** 
* Curso: Fundamentos de Bases de Datos
* Profesor: Brayner Salmeron Castillo
* Proyecto: Sistema de inventario para tienda de tecnologia
* Descripcion: Script para crear la base de datos
* para la tienda de tecnologia
* Autor: Maria Isabel Vallejos Rodriguez
* Fecha: Noviembre 2024 
***********************************************************/

-- Creación de la base de datos
CREATE DATABASE DB_TiendaTecnologia

USE DB_TiendaTecnologia

-- Tabla de Categorías
CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- Tabla de Métodos de Pago
CREATE TABLE MetodosPagos (
    id_metodoPago INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    contactoPrincipal VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla de Productos
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    precio DECIMAL(10,2) NOT NULL,
    stockActual INT NOT NULL DEFAULT 0,
    fk_categoria INT NOT NULL,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (fk_categoria) 
        REFERENCES Categorias (id_categoria)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    fechaVenta DATETIME DEFAULT GETDATE(),
    total DECIMAL(12,2) NOT NULL,
    fk_cliente INT NOT NULL,
    fk_metodoPago INT NOT NULL,
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (fk_cliente) 
        REFERENCES Clientes (id_cliente),
    CONSTRAINT FK_Venta_MetodoPago FOREIGN KEY (fk_metodoPago) 
        REFERENCES MetodosPagos (id_metodoPago)
);

-- Tabla de Compras
CREATE TABLE Compras (
    id_compra INT IDENTITY(1,1) PRIMARY KEY,
    fechaCompra DATETIME DEFAULT GETDATE(),
    total DECIMAL(12,2) NOT NULL,
    fk_proveedor INT NOT NULL,
    CONSTRAINT FK_Compra_Proveedor FOREIGN KEY (fk_proveedor) 
        REFERENCES Proveedores (id_proveedor)
);

-- Tabla de Devoluciones
CREATE TABLE Devoluciones (
    id_devolucion INT IDENTITY(1,1) PRIMARY KEY,
    fechaDevolucion DATETIME DEFAULT GETDATE(),
    motivo VARCHAR(500) NOT NULL,
    fk_venta INT NOT NULL,
    fk_producto INT NOT NULL,
    CONSTRAINT FK_Devolucion_Venta FOREIGN KEY (fk_venta) 
        REFERENCES Ventas (id_venta),
    CONSTRAINT FK_Devolucion_Producto FOREIGN KEY (fk_producto) 
        REFERENCES Productos (id_producto)
);

-- Tabla de relación Productos-Ventas
CREATE TABLE rel_ProductosVentas (
    id_producto_venta INT IDENTITY(1,1) PRIMARY KEY,
    fk_producto INT NOT NULL,
    fk_venta INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_ProductoVenta_Producto FOREIGN KEY (fk_producto) 
        REFERENCES Productos (id_producto),
    CONSTRAINT FK_ProductoVenta_Venta FOREIGN KEY (fk_venta) 
        REFERENCES Ventas (id_venta)
);

-- Tabla de relación Productos-Compras
CREATE TABLE rel_ProductosCompras (
    id_producto_compra INT IDENTITY(1,1) PRIMARY KEY,
    fk_producto INT NOT NULL,
    fk_compra INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_ProductoCompra_Producto FOREIGN KEY (fk_producto) 
        REFERENCES Productos (id_producto),
    CONSTRAINT FK_ProductoCompra_Compra FOREIGN KEY (fk_compra) 
        REFERENCES Compras (id_compra)
);

-- Tabla de relación Productos-Proveedores
CREATE TABLE rel_ProductosProveedores (
    id_producto_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    fk_producto INT NOT NULL,
    fk_proveedor INT NOT NULL,
    precioCompra DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_ProductoProveedor_Producto FOREIGN KEY (fk_producto) 
        REFERENCES Productos (id_producto),
    CONSTRAINT FK_ProductoProveedor_Proveedor FOREIGN KEY (fk_proveedor) 
        REFERENCES Proveedores (id_proveedor)
);

-- Crea BackUp de la Base de Datos
BACKUP DATABASE DB_TiendaTecnologia
TO DISK = 'C:\BasesDeDatos\Proyecto_MariaIsabelVallejosRodriguez.bak'
WITH FORMAT, 
    NAME = 'Backup Completo DB_TiendaTecnologia',
    DESCRIPTION = 'Backup de la base de datos de la tienda de tecnología';