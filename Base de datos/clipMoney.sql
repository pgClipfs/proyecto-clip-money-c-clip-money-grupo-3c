USE [master]
GO
/****** Object:  Database [clipMoney]    Script Date: 04/10/2020 20:42:25 ******/
CREATE DATABASE [clipMoney] ON  PRIMARY 
( NAME = N'clipMoney', FILENAME = N'C:\CLIP\1\clipMoney.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'clipMoney_log', FILENAME = N'C:\CLIP\1\clipMoney_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [clipMoney] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clipMoney].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clipMoney] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clipMoney] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clipMoney] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clipMoney] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clipMoney] SET ARITHABORT OFF 
GO
ALTER DATABASE [clipMoney] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clipMoney] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clipMoney] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clipMoney] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clipMoney] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clipMoney] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clipMoney] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clipMoney] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clipMoney] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clipMoney] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clipMoney] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clipMoney] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clipMoney] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clipMoney] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clipMoney] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clipMoney] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clipMoney] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clipMoney] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clipMoney] SET  MULTI_USER 
GO
ALTER DATABASE [clipMoney] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clipMoney] SET DB_CHAINING OFF 
GO
USE [clipMoney]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[nroCuenta] [int] NOT NULL,
	[usuarioId] [int] NULL,
	[cvu] [int] NULL,
	[alias] [varchar](max) NULL,
	[tipoMoneda] [int] NULL,
	[saldo] [numeric](38, 9) NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[nroCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datosUsuario]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datosUsuario](
	[usuarioId] [int] NOT NULL,
	[telefono] [int] NULL,
	[celular] [int] NULL,
	[domicilio] [varchar](max) NULL,
	[localidad] [varchar](150) NULL,
	[provincia] [varchar](100) NULL,
	[pais] [varchar](50) NULL,
	[cp] [smallint] NULL,
 CONSTRAINT [PK_datosUsuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[fechaVencimiento] [smalldatetime] NULL,
	[valor] [float] NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inversion]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inversion](
	[id] [int] NOT NULL,
	[cuentaId] [int] NULL,
	[usuarioId] [int] NULL,
	[movimientoId] [int] NULL,
	[nombre] [varchar](100) NULL,
	[tipoMoneda] [int] NULL,
	[taza] [float] NULL,
	[fechaInicio] [smalldatetime] NULL,
	[fechaFin] [smalldatetime] NULL,
	[renovacion] [bit] NULL,
 CONSTRAINT [PK_inversion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimiento]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento](
	[id] [int] NOT NULL,
	[cuentaId] [int] NULL,
	[tipoMovimiento] [int] NULL,
	[monto] [numeric](38, 9) NULL,
	[fecha] [smalldatetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_movimiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagoServicio]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagoServicio](
	[id] [int] NOT NULL,
	[servicioId] [int] NULL,
	[movimientoId] [int] NULL,
 CONSTRAINT [PK_pagoServicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password](
	[id] [int] NOT NULL,
	[usuarioId] [int] NULL,
	[valor] [varchar](max) NULL,
	[fecha] [smalldatetime] NULL,
 CONSTRAINT [PK_password] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[facturaId] [int] NULL,
 CONSTRAINT [PK_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMoneda]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMoneda](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[signo] [char](10) NULL,
 CONSTRAINT [PK_tipoMoneda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMovimiento]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMovimiento](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [PK_tipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 04/10/2020 20:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[dni] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[frente] [varchar](max) NULL,
	[dorso] [varchar](max) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_tipoMoneda] FOREIGN KEY([tipoMoneda])
REFERENCES [dbo].[tipoMoneda] ([id])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_tipoMoneda]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_usuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuario] ([dni])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_usuario]
GO
ALTER TABLE [dbo].[datosUsuario]  WITH CHECK ADD  CONSTRAINT [FK_datosUsuario_usuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuario] ([dni])
GO
ALTER TABLE [dbo].[datosUsuario] CHECK CONSTRAINT [FK_datosUsuario_usuario]
GO
ALTER TABLE [dbo].[inversion]  WITH CHECK ADD  CONSTRAINT [FK_inversion_cuenta] FOREIGN KEY([cuentaId])
REFERENCES [dbo].[cuenta] ([nroCuenta])
GO
ALTER TABLE [dbo].[inversion] CHECK CONSTRAINT [FK_inversion_cuenta]
GO
ALTER TABLE [dbo].[inversion]  WITH CHECK ADD  CONSTRAINT [FK_inversion_movimiento1] FOREIGN KEY([movimientoId])
REFERENCES [dbo].[movimiento] ([id])
GO
ALTER TABLE [dbo].[inversion] CHECK CONSTRAINT [FK_inversion_movimiento1]
GO
ALTER TABLE [dbo].[inversion]  WITH CHECK ADD  CONSTRAINT [FK_inversion_tipoMoneda] FOREIGN KEY([tipoMoneda])
REFERENCES [dbo].[tipoMoneda] ([id])
GO
ALTER TABLE [dbo].[inversion] CHECK CONSTRAINT [FK_inversion_tipoMoneda]
GO
ALTER TABLE [dbo].[inversion]  WITH CHECK ADD  CONSTRAINT [FK_inversion_usuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuario] ([dni])
GO
ALTER TABLE [dbo].[inversion] CHECK CONSTRAINT [FK_inversion_usuario]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_cuenta] FOREIGN KEY([cuentaId])
REFERENCES [dbo].[cuenta] ([nroCuenta])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_cuenta]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_tipoMovimiento] FOREIGN KEY([tipoMovimiento])
REFERENCES [dbo].[tipoMovimiento] ([id])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_tipoMovimiento]
GO
ALTER TABLE [dbo].[pagoServicio]  WITH CHECK ADD  CONSTRAINT [FK_pagoServicio_movimiento] FOREIGN KEY([movimientoId])
REFERENCES [dbo].[movimiento] ([id])
GO
ALTER TABLE [dbo].[pagoServicio] CHECK CONSTRAINT [FK_pagoServicio_movimiento]
GO
ALTER TABLE [dbo].[pagoServicio]  WITH CHECK ADD  CONSTRAINT [FK_pagoServicio_servicio] FOREIGN KEY([servicioId])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[pagoServicio] CHECK CONSTRAINT [FK_pagoServicio_servicio]
GO
ALTER TABLE [dbo].[password]  WITH CHECK ADD  CONSTRAINT [FK_password_usuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuario] ([dni])
GO
ALTER TABLE [dbo].[password] CHECK CONSTRAINT [FK_password_usuario]
GO
ALTER TABLE [dbo].[servicio]  WITH CHECK ADD  CONSTRAINT [FK_servicio_factura] FOREIGN KEY([facturaId])
REFERENCES [dbo].[factura] ([id])
GO
ALTER TABLE [dbo].[servicio] CHECK CONSTRAINT [FK_servicio_factura]
GO
USE [master]
GO
ALTER DATABASE [clipMoney] SET  READ_WRITE 
GO
