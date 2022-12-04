-- DMD Segunda Entrega 
-- ETL 

create database PVehicular
use PVehicular 
go

create table [DataPVehicular](
    [TIPO_PLACA] NVARCHAR(50),
    [CANTIDAD_DE_CILINDROS] NUMERIC(20,0),
    [CANTIDAD_DE_PUERTAS] NUMERIC(20,0),
    [VALOR_DEL_VEHICULO] DECIMAL(28,0),
    [FECHA_DE_INGRESO] DATE,
    [ANIO_INGRESO] BIGINT,
    [MES_INGRESO] BIGINT,
    [CLASE]NVARCHAR(50),
    [PERTENENCIA] NVARCHAR(50),
    [MARCA] NVARCHAR(50),
    [MODELO] NVARCHAR(50),
    [CAPACIDAD] DECIMAL(28,0),
    [DES_CAPACIDAD] NVARCHAR(50),
    [COMBUSTIBLE] NVARCHAR(50),
    [CONDICION_INGRESO] NVARCHAR(50),
    [PROPIETARIO_DEPARTAMENTO] NVARCHAR(50),
    [PROPIETARIO_MUNICIPIO] NVARCHAR(50),
    [ESTADO] NVARCHAR(50),

)

create table Vehiculo(
    ID_VEHICULO INT IDENTITY(1,1) PRIMARY KEY,
    CLASE NVARCHAR(50),
    MARCA NVARCHAR(50),
    MODELO NVARCHAR(50),
    COMBUSTIBLE NVARCHAR(50),
)

create table FechaImportacion(
    ID_FECHA INT IDENTITY(1,1) PRIMARY KEY,
    FECHA DATE,
    MES VARCHAR(15),
    A�O INT,
    DIA INT,
    TRIMESTRE INT,
)

create table Tipo_Condiciones(
    ID_PERTENENCIA INT IDENTITY(1,1) PRIMARY KEY,
    TIPO_PLACA NVARCHAR(50),
    PERTENENCIA NVARCHAR(50),
    CONDICION_INGRESO NVARCHAR(50),
    ESTADO NVARCHAR(50),
)

create table Propietario(
    ID_PROPIETARIO INT IDENTITY (1,1) PRIMARY KEY,
    PROPIETARIO_DEPARTAMENTO NVARCHAR(50),
    PROPIETARIO_MUNICIPIO NVARCHAR(50),
)

create table Capacidad(
    ID_CAPACIDAD INT IDENTITY(1,1) PRIMARY KEY,
    CAPACIDAD NVARCHAR(50),
)

create table ParqueVehicular(
    ID_PVEHICULAR INT IDENTITY(1,1) PRIMARY KEY,
    ID_VEHICULOS INT FOREIGN KEY REFERENCES Vehiculo(ID_VEHICULO),
    ID_FECHAS INT FOREIGN KEY REFERENCES FechaImportacion(ID_FECHA),
    ID_PERTENENCIAS INT FOREIGN KEY REFERENCES Tipo_Condiciones(ID_PERTENENCIA),
    ID_PROPIETARIOS INT FOREIGN KEY REFERENCES Propietario(ID_PROPIETARIO),
    ID_CAPACIDADES INT FOREIGN KEY REFERENCES Capacidad(ID_CAPACIDAD),
    CANTIDAD_DE_CILINDROS numeric (20,0) ,
    CANTIDAD_DE_PUERTAS numeric (20,0) ,
    VALOR_DEL_VEHICULO DECIMAL (28,0),
    CAPACIDAD decimal (28,0),
)