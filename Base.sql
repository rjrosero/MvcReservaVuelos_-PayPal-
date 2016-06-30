/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVA') and o.name = 'FK_RESERVA_RESERVA_X_USUARIO')
alter table RESERVA
   drop constraint FK_RESERVA_RESERVA_X_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TARIFA') and o.name = 'FK_TARIFA_TARIFA_X__AGENCIA')
alter table TARIFA
   drop constraint FK_TARIFA_TARIFA_X__AGENCIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VUELO') and o.name = 'FK_VUELO_VUELO_X_A_AGENCIA')
alter table VUELO
   drop constraint FK_VUELO_VUELO_X_A_AGENCIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VUELO_RESERVA') and o.name = 'FK_VUELO_RE_VUELO_RES_RESERVA')
alter table VUELO_RESERVA
   drop constraint FK_VUELO_RE_VUELO_RES_RESERVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VUELO_RESERVA') and o.name = 'FK_VUELO_RE_VUELO_RES_VUELO')
alter table VUELO_RESERVA
   drop constraint FK_VUELO_RE_VUELO_RES_VUELO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AGENCIA')
            and   type = 'U')
   drop table AGENCIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVA')
            and   name  = 'RESERVA_X_USUARIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVA.RESERVA_X_USUARIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESERVA')
            and   type = 'U')
   drop table RESERVA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TARIFA')
            and   name  = 'TARIFA_X_AGENCIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index TARIFA.TARIFA_X_AGENCIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TARIFA')
            and   type = 'U')
   drop table TARIFA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USUARIO')
            and   type = 'U')
   drop table USUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VUELO')
            and   name  = 'VUELO_X_AGENCIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index VUELO.VUELO_X_AGENCIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VUELO')
            and   type = 'U')
   drop table VUELO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VUELO_RESERVA')
            and   name  = 'VUELO_RESERVA_X_RESERVA_FK'
            and   indid > 0
            and   indid < 255)
   drop index VUELO_RESERVA.VUELO_RESERVA_X_RESERVA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VUELO_RESERVA')
            and   name  = 'VUELO_RESERVA_X_VUELO_FK'
            and   indid > 0
            and   indid < 255)
   drop index VUELO_RESERVA.VUELO_RESERVA_X_VUELO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VUELO_RESERVA')
            and   type = 'U')
   drop table VUELO_RESERVA
go

/*==============================================================*/
/* Table: AGENCIA                                               */
/*==============================================================*/
create table AGENCIA (
   AGENCIA_CODIGO       int                  identity,
   AGENCIA_NOMBRE       varchar(128)         not null,
   AGENCIA_DIRECCION    varchar(256)         null,
   AGENCIA_TELEFONO     varchar(16)          null,
   constraint PK_AGENCIA primary key nonclustered (AGENCIA_CODIGO)
)
go

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   RESERVA_CODIGO       int                  identity,
   USUARIO_CODIGO       int                  null,
   RESERVA_FECHA        datetime             not null,
   constraint PK_RESERVA primary key nonclustered (RESERVA_CODIGO)
)
go

/*==============================================================*/
/* Index: RESERVA_X_USUARIO_FK                                  */
/*==============================================================*/
create index RESERVA_X_USUARIO_FK on RESERVA (
USUARIO_CODIGO ASC
)
go

/*==============================================================*/
/* Table: TARIFA                                                */
/*==============================================================*/
create table TARIFA (
   TARIFA_CODIGO        int                  identity,
   AGENCIA_CODIGO       int                  null,
   TARIFA_TIPO          varchar(32)          not null,
   TARIFA_COSTO         numeric(6,2)         not null,
   TARIFA_DESCRIPCION   varchar(256)         not null,
   TARIFA_PORCENTAJE    numeric(5,2)         null,
   constraint PK_TARIFA primary key nonclustered (TARIFA_CODIGO)
)
go

/*==============================================================*/
/* Index: TARIFA_X_AGENCIA_FK                                   */
/*==============================================================*/
create index TARIFA_X_AGENCIA_FK on TARIFA (
AGENCIA_CODIGO ASC
)
go

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   USUARIO_CODIGO       int                  identity,
   USUARIO_NOMBRE       varchar(128)         not null,
   USUARIO_CORREO       varchar(128)         not null,
   USUARIO_CONTRASENA   varchar(256)         not null,
   USUARIO_ROL          varchar(32)          not null,
   USUARIO_TELEFONO     varchar(16)          not null,
   constraint PK_USUARIO primary key nonclustered (USUARIO_CODIGO)
)
go

/*==============================================================*/
/* Table: VUELO                                                 */
/*==============================================================*/
create table VUELO (
   VUELO_CODIGO         int                  identity,
   AGENCIA_CODIGO       int                  null,
   VUELO_ORIGEN         varchar(32)          not null,
   VUELO_DESTINO        varchar(32)          not null,
   VUELO_NUMERO         varchar(8)           not null,
   VUELO_SALIDA         datetime             not null,
   VUELO_LLEGADA        datetime             not null,
   VUELO_CAPACIDAD      int                  not null,
   VUELO_DISPONIBLES    int                  null,
   constraint PK_VUELO primary key nonclustered (VUELO_CODIGO)
)
go

/*==============================================================*/
/* Index: VUELO_X_AGENCIA_FK                                    */
/*==============================================================*/
create index VUELO_X_AGENCIA_FK on VUELO (
AGENCIA_CODIGO ASC
)
go

/*==============================================================*/
/* Table: VUELO_RESERVA                                         */
/*==============================================================*/
create table VUELO_RESERVA (
   VUELO_CODIGO         int                  not null,
   RESERVA_CODIGO       int                  not null,
   VR_NUM_ASIENTOS      int                  not null,
   COSTO_TOTAL          numeric(10,2)        null,
   constraint PK_VUELO_RESERVA primary key nonclustered (VUELO_CODIGO, RESERVA_CODIGO)
)
go

/*==============================================================*/
/* Index: VUELO_RESERVA_X_VUELO_FK                              */
/*==============================================================*/
create index VUELO_RESERVA_X_VUELO_FK on VUELO_RESERVA (
VUELO_CODIGO ASC
)
go

/*==============================================================*/
/* Index: VUELO_RESERVA_X_RESERVA_FK                            */
/*==============================================================*/
create index VUELO_RESERVA_X_RESERVA_FK on VUELO_RESERVA (
RESERVA_CODIGO ASC
)
go

alter table RESERVA
   add constraint FK_RESERVA_RESERVA_X_USUARIO foreign key (USUARIO_CODIGO)
      references USUARIO (USUARIO_CODIGO)
go

alter table TARIFA
   add constraint FK_TARIFA_TARIFA_X__AGENCIA foreign key (AGENCIA_CODIGO)
      references AGENCIA (AGENCIA_CODIGO)
go

alter table VUELO
   add constraint FK_VUELO_VUELO_X_A_AGENCIA foreign key (AGENCIA_CODIGO)
      references AGENCIA (AGENCIA_CODIGO)
go

alter table VUELO_RESERVA
   add constraint FK_VUELO_RE_VUELO_RES_RESERVA foreign key (RESERVA_CODIGO)
      references RESERVA (RESERVA_CODIGO)
go

alter table VUELO_RESERVA
   add constraint FK_VUELO_RE_VUELO_RES_VUELO foreign key (VUELO_CODIGO)
      references VUELO (VUELO_CODIGO)
go

