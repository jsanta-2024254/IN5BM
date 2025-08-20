drop database if exists DB_zapateria;
create database DB_zapateria;
use DB_zapateria;

-- Tabla Zapatos
create table Zapatos (
    idZapato int auto_increment,
    nombreZapato varchar(100) not null,
    precioZapato decimal(10,2) not null,
    stockZapato int not null,
    tallaZapato varchar(10) not null,
    constraint pk_Zapatos primary key (idZapato)
);

-- Tabla Ventas (sin llave foránea)
create table Ventas (
    idVenta int auto_increment,
    fechaVenta date not null,
    clienteNombre varchar(100) not null,
    idZapato int not null,
    cantidad int not null,
    total decimal(10,2) not null,
    constraint pk_Ventas primary key (idVenta)
);

-- Procedimientos almacenados para Zapatos
Delimiter //
create procedure sp_AgregarZapato(
    in nomZap varchar(100),
    in preZap decimal(10,2),
    in stockZap int,
    in tallaZap varchar(10)
)
begin
    insert into Zapatos(nombreZapato, precioZapato, stockZapato, tallaZapato)
    values(nomZap, preZap, stockZap, tallaZap);
end//
Delimiter ;

Delimiter //
create procedure sp_EditarZapato(
    in idZap int,
    in nomZap varchar(100),
    in preZap decimal(10,2),
    in stockZap int,
    in tallaZap varchar(10)
)
begin
    update Zapatos
    set nombreZapato = nomZap,
        precioZapato = preZap,
        stockZapato = stockZap,
        tallaZapato = tallaZap
    where idZapato = idZap;
end//
Delimiter ;

Delimiter //
create procedure sp_EliminarZapato(
    in idZap int
)
begin
    delete from Zapatos
    where idZapato = idZap;
end//
Delimiter ;

Delimiter //
create procedure sp_BuscarZapato(
    in idZap int
)
begin
    select * from Zapatos
    where idZapato = idZap;
end//
Delimiter ;

Delimiter //
create procedure sp_ListarZapatos()
begin
    select * from Zapatos;
end//
Delimiter ;

-- Procedimientos almacenados para Ventas
Delimiter //
create procedure sp_AgregarVenta(
    in _fechaVenta date,
    in _clienteNombre varchar(100),
    in _idZap int,
    in _cantidad int,
    in _total decimal(10,2)
)
begin
    insert into Ventas(fechaVenta, clienteNombre, idZapato, cantidad, total)
    values(_fechaVenta, _clienteNombre, _idZap, _cantidad, _total);
end//
Delimiter ;

Delimiter //
create procedure sp_ListarVentas()
begin
    select v.idVenta,
           v.fechaVenta,
           v.clienteNombre,
           v.idZapato,
           v.cantidad,
           v.total
    from Ventas v;
end//
Delimiter ;

Delimiter //
create procedure sp_BuscarVenta(
    in idVen int
)
begin
    select * from Ventas
    where idVenta = idVen;
end//
Delimiter ;

-- Eliminar venta por id
Delimiter //
create procedure sp_EliminarVenta(
    in idVen int
)
begin
    delete from Ventas
    where idVenta = idVen;
end//
Delimiter ;

Delimiter //
create procedure sp_EditarVenta(
    in idVen int,
    in _fechaVenta date,
    in _clienteNombre varchar(100),
    in _idZap int,
    in _cantidad int,
    in _total decimal(10,2)
)
begin
    update Ventas
    set fechaVenta = _fechaVenta,
        clienteNombre = _clienteNombre,
        idZapato = _idZap,
        cantidad = _cantidad,
        total = _total
    where idVenta = idVen;
end//
Delimiter ;

-- 10 tuplas para Zapatos
call sp_AgregarZapato('Tenis Deportivos', 150.00, 50, '42');
call sp_AgregarZapato('Botas de Cuero', 250.00, 30, '41');
call sp_AgregarZapato('Sandalias', 75.00, 80, '40');
call sp_AgregarZapato('Zapatos Formales', 200.00, 25, '43');
call sp_AgregarZapato('Tenis Running', 180.00, 40, '44');
call sp_AgregarZapato('Zapatillas Casual', 120.00, 60, '42');
call sp_AgregarZapato('Botines Mujer', 220.00, 35, '39');
call sp_AgregarZapato('Tacones Elegantes', 300.00, 20, '38');
call sp_AgregarZapato('Mocasines', 160.00, 45, '41');
call sp_AgregarZapato('Chanclas Playera', 50.00, 100, '40');

-- 10 tuplas para Ventas
call sp_AgregarVenta('2025-08-19', 'Juan Pérez', 1, 2, 300.00);
call sp_AgregarVenta('2025-08-19', 'María López', 4, 1, 200.00);
call sp_AgregarVenta('2025-08-20', 'Carlos Ruiz', 2, 1, 250.00);
call sp_AgregarVenta('2025-08-20', 'Ana Gómez', 5, 2, 360.00);
call sp_AgregarVenta('2025-08-21', 'Luis Martínez', 3, 3, 225.00);
call sp_AgregarVenta('2025-08-21', 'Sofía Hernández', 6, 1, 120.00);
call sp_AgregarVenta('2025-08-22', 'Pedro Ramírez', 7, 1, 220.00);
call sp_AgregarVenta('2025-08-22', 'Laura Díaz', 8, 1, 300.00);
call sp_AgregarVenta('2025-08-23', 'Ricardo Flores', 9, 2, 320.00);
call sp_AgregarVenta('2025-08-23', 'Carolina Morales', 10, 4, 200.00);

-- Mostrar todo
select * from Zapatos;
select * from Ventas;
