create database Uber;

use Uber;


create table Tipo_Vehiculo(
id_Tipo_Vehiculo int primary key,
Nombre varchar (20) not null,
Descripcion varchar (30)not null
)

create table Vehiculo(
id_Vehiculo int primary key,
Placas varchar (7) not null,
Modelo varchar (4)not null,
id_Tipo_Vehiculo int not null,
)

create table Asig_Vehiculo_Conductor(
id_Asig_Vehiculo_Coductor int primary key,
id_Conductor int not null,
id_Vehiculo int not null,
Fecha date not null
)

create table Conductor(
id_Conductor int primary key,
Nombre varchar (30) not null,
Licencia varchar (13)not null,
Puntuacion decimal(1,1) not null,
Usuario_Co varchar(20)not null,
Contraseña_Co varchar (20) not  null,
)

create table Viaje(
id_Viaje int primary key,
DistanciaTotal_km Decimal (6,2) not null,
Costo_Total Decimal (8,2)not null,
id_Conductor int not null,
id_Vehiculo int not null,
id_Servicio int not null,
Fecha Datetime not null,
)

create table Asig_Viaje_Cliente(
id_Asig_Viaje_Cliente int primary key,
Direccion_Inicio varchar (30) not null,
Direccion_Fin varchar (30)not null,
Distancia_Km decimal (6,2) not null,
Pago decimal (8,2)not null,
Puntuacion_Conductor decimal (1,1) not null,
Puntuacion_Pasajero decimal (1,1) not null,
id_Cliente integer not null,
id_Viaje int not null

)


create table Cliente(
id_Cliente int primary key,
Nombre varchar (30) not null,
Puntuacion decimal(1,1) not null,
Usuario_Cl varchar(20)not null,
Contraseña_Cl varchar (20) not  null,
No_Viajes int not null
)


create table Servicio(
id_Servicio int primary key,
Nombre varchar (20) not null,
Descripcion varchar (30)not null,
Tarifa_Km decimal (6,2)not null
)


alter table Vehiculo
Add constraint FK_TipoVehiculo__Vehiculo
foreign key (id_Tipo_Vehiculo) references Tipo_Vehiculo (id_Tipo_Vehiculo)
on update cascade
on delete cascade

alter table Asig_Vehiculo_Conductor
Add constraint FK_Asig_Vehiculo_conductor_Conductor
foreign key (id_Conductor) references Conductor (id_Conductor)
on update cascade
on delete cascade,
constraint FK_Asig_Vehiculo_conductor_Vehiculo
foreign key (id_Vehiculo) references Vehiculo (id_Vehiculo)
on update cascade
on delete cascade
