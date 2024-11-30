/********************************************************************** 
* Curso: Fundamentos de Bases de Datos
* Profesor: Brayner Salmeron Castillo
* Proyecto: Sistema de inventario para tienda de tecnologia
* Descripcion: Script para optimizacion de busquedas mediante indices
* Autor: Maria Isabel Vallejos Rodriguez
* Fecha: Noviembre 2024 
***********************************************************************/

USE DB_TiendaTecnologia;

-- Tabla Productos
-- Indice en nombre para busquedas rapidas por nombre de producto
CREATE INDEX idx_Productos_Nombre ON Productos(nombre);

-- Indice en fk_categoria para mejorar las consultas que involucren categorias
CREATE INDEX idx_Productos_Categoria ON Productos(fk_categoria);

-- Tabla Ventas
-- Indice en fechaVenta para mejorar las consultas por fecha
CREATE INDEX idx_Ventas_FechaVenta ON Ventas(fechaVenta);

-- Tabla Compras
-- Indice en fechaCompra para mejorar las consultas por fecha
CREATE INDEX idx_Compras_FechaCompra ON Compras(fechaCompra);





