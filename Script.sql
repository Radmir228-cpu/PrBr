USE [master]
GO
/****** Object:  Database [br]    Script Date: 07.12.2024 1:18:34 ******/
CREATE DATABASE [br]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'br', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\br.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'br_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\br_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [br] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [br].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [br] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [br] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [br] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [br] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [br] SET ARITHABORT OFF 
GO
ALTER DATABASE [br] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [br] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [br] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [br] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [br] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [br] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [br] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [br] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [br] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [br] SET  ENABLE_BROKER 
GO
ALTER DATABASE [br] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [br] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [br] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [br] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [br] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [br] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [br] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [br] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [br] SET  MULTI_USER 
GO
ALTER DATABASE [br] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [br] SET DB_CHAINING OFF 
GO
ALTER DATABASE [br] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [br] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [br] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [br] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [br] SET QUERY_STORE = ON
GO
ALTER DATABASE [br] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [br]
GO
/****** Object:  Table [dbo].[equipment]    Script Date: 07.12.2024 1:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[code] [nvarchar](255) NULL,
	[price_per_day] [decimal](10, 2) NULL,
 CONSTRAINT [PK__equipmen__3213E83F79E7DEF9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 07.12.2024 1:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NULL,
	[order_date] [date] NULL,
	[order_time] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[return_date] [date] NULL,
	[time] [nvarchar](255) NULL,
	[id_equipment] [int] NULL,
	[id_users] [int] NULL,
	[id_staff] [int] NULL,
 CONSTRAINT [PK__orders__3213E83F010F08C5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 07.12.2024 1:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[role] [nvarchar](255) NULL,
	[surname] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[patronymic] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 07.12.2024 1:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[surname] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[patronymic] [nvarchar](255) NULL,
	[date_of_brt] [date] NULL,
	[series] [nvarchar](255) NULL,
	[number] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK__users__3213E83F4D8F9494] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[equipment] ON 

INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (1, N'Аренда беседки', N'BSFBHV63', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (2, N'Аренда лодки', N'DHBGFY563', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (3, N'Аренда шезлонга', N'HJBUJE21J', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (4, N'Инструктор по катанию на велосипеде', N'DJHGBS982', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (5, N'Инструктор по катанию на лодке', N'638VVNQ3', CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (6, N'Инструктор по катанию на роликах', N'JHVSJF6', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (7, N'Прокат велоколяски', N'OIJNB12', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (8, N'Прокат велосипеда', N'8HFJHG443', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (9, N'Прокат набора защитного оборудования', N'JUR8R', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (10, N'Прокат роликов', N'JKFBJ09', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (11, N'Прокат самоката', N'63748HF', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (12, N'Прокат шлема', N'87FDJKHJ', CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([id], [name], [code], [price_per_day]) VALUES (13, N'Прокат электросамоката', N'JFH7382', CAST(1200.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (1, N'1', CAST(N'2022-03-12' AS Date), N'9:10', N'Новая', NULL, N'120', 1, 1, 1)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (2, N'2', CAST(N'2022-03-13' AS Date), N'10:10', N'В прокате', NULL, N'600', 2, 2, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (3, N'3', CAST(N'2022-03-14' AS Date), N'11:10', N'В прокате', NULL, N'120', 3, 3, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (4, N'4', CAST(N'2022-03-15' AS Date), N'12:10', N'Новая', NULL, N'600', 4, 4, 4)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (5, N'5', CAST(N'2022-03-16' AS Date), N'13:10', N'Закрыта', CAST(N'2022-04-16' AS Date), N'320', 5, 5, 5)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (6, N'6', CAST(N'2022-03-17' AS Date), N'14:10', N'Новая', NULL, N'480', 6, 6, 6)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (7, N'7', CAST(N'2022-03-18' AS Date), N'15:10', N'Новая', NULL, N'240', 7, 7, 7)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (8, N'8', CAST(N'2022-03-19' AS Date), N'16:10', N'В прокате', NULL, N'360', 8, 8, 8)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (9, N'9', CAST(N'2022-03-20' AS Date), N'10:00', N'В прокате', NULL, N'720', 9, 9, 9)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (10, N'10', CAST(N'2022-03-21' AS Date), N'11:00', N'Новая', NULL, N'120', 10, 10, 10)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (11, N'11', CAST(N'2022-03-22' AS Date), N'12:00', N'Закрыта', CAST(N'2022-03-22' AS Date), N'600', 11, 11, 1)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (12, N'12', CAST(N'2022-03-23' AS Date), N'13:00', N'В прокате', NULL, N'120', 12, 12, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (13, N'13', CAST(N'2022-03-24' AS Date), N'14:00', N'В прокате', NULL, N'600', 13, 13, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (14, N'14', CAST(N'2022-03-25' AS Date), N'15:00', N'В прокате', NULL, N'320', 1, 14, 4)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (15, N'15', CAST(N'2022-03-26' AS Date), N'16:00', N'Закрыта', CAST(N'2022-04-26' AS Date), N'480', 2, 15, 5)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (16, N'16', CAST(N'2022-03-27' AS Date), N'17:00', N'Новая', NULL, N'240', 3, 16, 6)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (17, N'17', CAST(N'2022-03-28' AS Date), N'18:00', N'В прокате', NULL, N'360', 4, 17, 7)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (18, N'18', CAST(N'2022-03-29' AS Date), N'19:00', N'В прокате', NULL, N'720', 5, 18, 8)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (19, N'19', CAST(N'2022-03-30' AS Date), N'12:30', N'Новая', NULL, N'120', 6, 19, 9)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (20, N'20', CAST(N'2022-03-31' AS Date), N'13:30', N'Новая', NULL, N'600', 7, 20, 10)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (21, N'21', CAST(N'2022-04-01' AS Date), N'14:30', N'Закрыта', CAST(N'2022-04-01' AS Date), N'120', 8, 21, 1)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (22, N'22', CAST(N'2022-04-02' AS Date), N'15:30', N'Новая', NULL, N'600', 9, 22, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (23, N'23', CAST(N'2022-04-03' AS Date), N'16:30', N'Новая', NULL, N'320', 10, 23, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (24, N'24', CAST(N'2022-04-04' AS Date), N'17:30', N'В прокате', NULL, N'480', 11, 24, 4)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (25, N'25', CAST(N'2022-04-05' AS Date), N'18:30', N'В прокате', NULL, N'240', 12, 25, 5)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (26, N'26', CAST(N'2022-04-06' AS Date), N'15:30', N'В прокате', NULL, N'360', 13, 26, 6)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (27, N'27', CAST(N'2022-04-07' AS Date), N'16:30', N'В прокате', NULL, N'720', 1, 27, 7)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (28, N'28', CAST(N'2022-04-08' AS Date), N'17:30', N'Закрыта', CAST(N'2022-04-08' AS Date), N'120', 2, 28, 8)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (29, N'29', CAST(N'2022-04-09' AS Date), N'18:30', N'Новая', NULL, N'600', 3, 29, 9)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (30, N'30', CAST(N'2022-04-10' AS Date), N'19:30', N'В прокате', NULL, N'120', 4, 30, 10)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (31, N'31', CAST(N'2022-04-11' AS Date), N'10:30', N'В прокате', NULL, N'600', 5, 31, 1)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (32, N'32', CAST(N'2022-04-12' AS Date), N'11:30', N'Новая', NULL, N'320', 6, 32, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (33, N'33', CAST(N'2022-04-13' AS Date), N'12:30', N'Новая', NULL, N'480', 7, 33, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (34, N'34', CAST(N'2022-04-14' AS Date), N'13:30', N'Новая', NULL, N'240', 8, 34, 4)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (35, N'35', CAST(N'2022-04-15' AS Date), N'14:30', N'В прокате', NULL, N'360', 9, 35, 5)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (36, N'36', CAST(N'2022-04-02' AS Date), N'15:30', N'В прокате', NULL, N'720', 10, 36, 6)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (37, N'37', CAST(N'2022-04-03' AS Date), N'16:30', N'В прокате', NULL, N'120', 11, 37, 7)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (38, N'38', CAST(N'2022-04-04' AS Date), N'17:30', N'Закрыта', CAST(N'2022-04-04' AS Date), N'600', 12, 38, 8)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (39, N'39', CAST(N'2022-04-05' AS Date), N'10:15', N'В прокате', NULL, N'120', 13, 39, 9)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (40, N'40', CAST(N'2022-04-06' AS Date), N'11:15', N'Новая', NULL, N'600', 1, 40, 10)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (41, N'41', CAST(N'2022-04-07' AS Date), N'12:15', N'Закрыта', CAST(N'2022-04-07' AS Date), N'320', 2, 41, 1)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (42, N'42', CAST(N'2022-04-08' AS Date), N'13:15', N'В прокате', NULL, N'480', 3, 42, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (43, N'43', CAST(N'2022-04-09' AS Date), N'14:15', N'В прокате', NULL, N'240', 4, 43, 2)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (44, N'44', CAST(N'2022-04-01' AS Date), N'15:15', N'В прокате', NULL, N'360', 5, 44, 4)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (45, N'45', CAST(N'2022-04-02' AS Date), N'16:15', N'В прокате', NULL, N'720', 6, 45, 5)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (46, N'46', CAST(N'2022-04-03' AS Date), N'10:45', N'В прокате', NULL, N'480', 7, 46, 6)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (47, N'47', CAST(N'2022-04-04' AS Date), N'11:45', N'Закрыта', CAST(N'2022-04-04' AS Date), N'320', 8, 47, 7)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (48, N'48', CAST(N'2022-04-05' AS Date), N'12:45', N'Новая', NULL, N'480', 9, 48, 8)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (49, N'49', CAST(N'2022-04-06' AS Date), N'13:45', N'Новая', NULL, N'240', 10, 49, 9)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (50, N'50', CAST(N'2022-04-07' AS Date), N'14:45', N'Новая', NULL, N'420', 11, 50, 10)
INSERT [dbo].[orders] ([id], [code], [order_date], [order_time], [status], [return_date], [time], [id_equipment], [id_users], [id_staff]) VALUES (54, N'51', CAST(N'2024-12-04' AS Date), N'12:12', N'В прокате', CAST(N'2024-12-14' AS Date), N'123', 2, 3, 8)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[staff] ON 

INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (1, N'Ivanov@namecomp.ru', N'2L6KZG', N'Продавец', N'Иванов', N'Иван', N'Иванович')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (2, N'petrov@namecomp.ru', N'uzWC67', N'Продавец', N'Петров', N'Петр', N'Петрович')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (3, N'fedorov@namecomp.ru', N'8ntwUp', N'Администратор', N'Федоров', N'Федор', N'Федорович')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (4, N'mironov@namecomp.ru', N'YOyhfR', N'Старший смены', N'Миронов', N'Венеомин', N'Куприянович')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (5, N'shiryev@namecomp.ru', N'RSbvHv', N'Старший смены', N'Ширяев', N'Ермолай', N'Венеоминович')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (6, N'ignatov@namecomp.ru', N'rwVDh9', N'Старший смены', N'Игнатов', N'Кассиан', N'Ваисльевич')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (7, N'hohlov@namecomp.ru', N'LdNyos', N'Продавец', N'Хохлов', N'Владимер', N'Мелсонович')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (8, N'strelkov@namecomp.ru', N'gynQMT', N'Продавец', N'Стрелков', N'Мстислав', N'Георгъевич')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (9, N'belyeva@@namecomp.ru', N'AtnDjr', N'Продавец', N'Беляева', N'Лилия', N'Наумовна')
INSERT [dbo].[staff] ([id], [login], [password], [role], [surname], [name], [patronymic]) VALUES (10, N'smirnova@@namecomp.ru', N'JlFRCZ', N'Продавец', N'Смирнова', N'Ульяна', N'Гордеевна')
SET IDENTITY_INSERT [dbo].[staff] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (1, N'lopezlisa@hotmail.com', N'Абрамова', N'Александра', N'Мироновна', CAST(N'1999-03-26' AS Date), N'1710', N'427875', N'410172, г. Санкт-Петербург, ул. Северная, 13, кв. 86')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (2, N'sethbishop@yahoo.com', N'Алексеев', N'Матвей', N'Викторович', CAST(N'1998-08-02' AS Date), N'1452', N'339539', N'450375, г. Санкт-Петербург, ул. Клубная, 44, кв. 80')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (3, N'damaris61@okon.com', N'Борисова', N'Елена', N'Михайловна', CAST(N'1976-05-23' AS Date), N'5086', N'666893', N'445685, г. Санкт-Петербург, ул. Зеленая, 7, кв. 47')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (4, N'yipraubaponou-5849@yopmail.com', N'Борисова', N'Ирина', N'Ивановна', CAST(N'1976-10-14' AS Date), N'8755', N'921148', N'454311, г. Санкт-Петербург, ул. Новая, 19, кв. 78')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (5, N'boyd.koss@yahoo.com', N'Борисова', N'Тамара', N'Данииловна', CAST(N'1993-05-29' AS Date), N'4658', N'621200', N'426083, г. Санкт-Петербург, ул. Механизаторов, 41, кв. 26')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (6, N'campbellkevin@gardner.com', N'Бочаров', N'Никита', N'Матвеевич', CAST(N'1997-06-29' AS Date), N'1587', N'291249', N'125061, г. Санкт-Петербург, ул. Подгорная, 8, кв. 74')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (7, N'carsontamara@gmail.com', N'Васильева', N'Валерия', N'Дмитриевна', CAST(N'1999-09-30' AS Date), N'1742', N'316556', N'614753, г. Санкт-Петербург, ул. Полевая, 35, кв. 39')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (8, N'grady.reilly@block.com', N'Васильева', N'Ксения', N'Константиновна', CAST(N'1999-08-01' AS Date), N'4783', N'612567', N'660590, г. Санкт-Петербург, ул. Дачная, 37, кв. 70')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (9, N'anabelle07@schultz.info', N'Виноградов', N'Вячеслав', N'Дмитриевич', CAST(N'1976-07-12' AS Date), N'2967', N'434531', N'410248, г. Санкт-Петербург, ул. Чкалова, 11, кв. 75')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (10, N'ziyeuddocrabri-4748@yopmail.com', N'Власов', N'Дмитрий', N'Александрович', CAST(N'1998-08-17' AS Date), N'3455', N'719630', N'625283, г. Санкт-Петербург, ул. Победы, 46, кв. 7')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (11, N'jsteele@rojas-robinson.net', N'Воробьева', N'Василиса', N'Евгеньевна', CAST(N'1999-01-13' AS Date), N'2460', N'169505', N'394060, г. Санкт-Петербург, ул. Фрунзе, 43, кв. 79')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (12, N'ron.treutel@quitzon.com', N'Герасимова', N'Дарья', N'Константиновна', CAST(N'1984-10-13' AS Date), N'5493', N'684572', N'426629, г. Санкт-Петербург, ул. Весенняя, 32, кв. 46')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (13, N'connelly.makayla@yahoo.com', N'Голубев', N'Даниэль', N'Александрович', CAST(N'1999-06-14' AS Date), N'3620', N'506034', N'450698, г. Санкт-Петербург, ул. Вокзальная, 14, кв. 37')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (14, N'deborah.christiansen@quigley.biz', N'Григорьев', N'Максим', N'Кириллович', CAST(N'1999-05-26' AS Date), N'3560', N'491260', N'644133, г. Санкт-Петербург, ул. Гагарина, 28, кв. 69')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (15, N'mariana.leannon@larkin.net', N'Гусев', N'Михаил', N'Дмитриевич', CAST(N'1999-11-23' AS Date), N'4445', N'581302', N'400646, г. Санкт-Петербург, ул. Октябрьская, 47, кв. 65')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (16, N'obartell@franecki.info', N'Дмитриев', N'Мирон', N'Ильич', CAST(N'1985-04-13' AS Date), N'4908', N'634613', N'410569, г. Санкт-Петербург, ул. Парковая, 36, кв. 17')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (17, N'bradly29@gmail.com', N'Зайцев', N'Владимир', N'Давидович', CAST(N'1998-01-26' AS Date), N'2376', N'443711', N'350501, г. Санкт-Петербург, ул. Парковая, 2, кв. 7')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (18, N'crapedocouca-3572@yopmail.com', N'Зайцев', N'Никита', N'Артёмович', CAST(N'1999-10-14' AS Date), N'4355', N'104594', N'660007, г. Санкт-Петербург, ул. Октябрьская, 19, кв. 42')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (19, N'bruen.eleanore@yahoo.com', N'Захаров', N'Матвей', N'Романович', CAST(N'1993-07-12' AS Date), N'2556', N'439376', N'644921, г. Санкт-Петербург, ул. Школьная, 46, кв. 37')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (20, N'johnathon.oberbrunner@yahoo.com', N'Захарова', N'Полина', N'Яновна', CAST(N'1976-04-21' AS Date), N'2687', N'363884', N'190949, г. Санкт-Петербург, ул. Мичурина, 26, кв. 93')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (21, N'cbradley@castro.com', N'Зимина', N'Агния', N'Александровна', CAST(N'1998-09-03' AS Date), N'6443', N'208059', N'400562, г. Санкт-Петербург, ул. Зеленая, 32, кв. 67')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (22, N'stark.cristina@hilpert.biz', N'Иванов', N'Виталий', N'Даниилович', CAST(N'1976-08-11' AS Date), N'2568', N'386237', N'450048, г. Санкт-Петербург, ул. Коммунистическая, 21, кв. 3')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (23, N'boippaxeufrepra-7093@yopmail.com', N'Иванов', N'Иван', N'Ильич', CAST(N'1998-10-01' AS Date), N'9120', N'554296', N'660540, г. Санкт-Петербург, ул. Солнечная, 25, кв. 78')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (24, N'rouzecroummegre-3899@yopmail.com', N'Иванов', N'Михаил', N'Владимирович', CAST(N'1985-11-04' AS Date), N'7101', N'669343', N'125703, г. Санкт-Петербург, ул. Партизанская, 49, кв. 84')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (25, N'percival.halvorson@yahoo.com', N'Иванов', N'Степан', N'Степанович', CAST(N'1998-09-19' AS Date), N'2737', N'407501', N'614228, г. Санкт-Петербург, ул. Дорожная, 36, кв. 54')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (26, N'poleifenevi-1560@yopmail.com', N'Калашникова', N'Арина', N'Максимовна', CAST(N'1999-08-13' AS Date), N'2978', N'133653', N'394782, г. Санкт-Петербург, ул. Чехова, 3, кв. 14')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (27, N'vhopkins@lewis-mullen.com', N'Калинин', N'Александр', N'Андреевич', CAST(N'1999-01-07' AS Date), N'3412', N'174593', N'410661, г. Санкт-Петербург, ул. Школьная, 50, кв. 53')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (28, N'ginaritter@schneider-buchanan.com', N'Карпова', N'София', N'Егоровна', CAST(N'1993-10-01' AS Date), N'1167', N'256636', N'603379, г. Санкт-Петербург, ул. Спортивная, 46, кв. 95')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (29, N'vern91@yahoo.com', N'Коновалов', N'Арсений', N'Максимович', CAST(N'1985-02-18' AS Date), N'4914', N'572471', N'445720, г. Санкт-Петербург, ул. Матросова, 50, кв. 67')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (30, N'yeimmeiwauzomo-7054@yopmail.com', N'Коротков', N'Кирилл', N'Алексеевич', CAST(N'1976-05-26' AS Date), N'5582', N'126286', N'450983, г. Санкт-Петербург, ул. Комсомольская, 26, кв. 60')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (31, N'pacocha.robbie@yahoo.com', N'Коршунов', N'Кирилл', N'Максимович', CAST(N'1985-05-22' AS Date), N'1308', N'703305', N'450750, г. Санкт-Петербург, ул. Клубная, 23, кв. 90')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (32, N'danika58@rath.com', N'Кудрявцев', N'Максим', N'Романович', CAST(N'1998-05-10' AS Date), N'4109', N'554053', N'394207, г. Санкт-Петербург, ул. Свердлова, 31, кв. 28')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (33, N'jessica84@hotmail.com', N'Кузнецова', N'Аиша', N'Михайловна', CAST(N'1998-10-04' AS Date), N'9307', N'232158', N'620839, г. Санкт-Петербург, ул. Цветочная, 8, кв. 100')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (34, N'nlewis@yahoo.com', N'Кузнецова', N'Милана', N'Владиславовна', CAST(N'1999-01-24' AS Date), N'4950', N'183032', N'625590, г. Санкт-Петербург, ул. Коммунистическая, 20, кв. 34')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (35, N'otha.wisozk@lubowitz.org', N'Кузнецова', N'Ульяна', N'Савельевна', CAST(N'1999-06-03' AS Date), N'3250', N'464705', N'614591, г. Санкт-Петербург, ул. Цветочная, 20, кв. 40')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (36, N'ohara.rebeka@yahoo.com', N'Кулаков', N'Константин', N'Даниилович', CAST(N'1993-06-20' AS Date), N'4021', N'541528', N'410181, г. Санкт-Петербург, ул. Механизаторов, 16, кв. 74')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (37, N'jessicapark@hotmail.com', N'Куликов', N'Никита', N'Георгиевич', CAST(N'1999-04-23' AS Date), N'1357', N'242839', N'443890, г. Санкт-Петербург, ул. Коммунистическая, 1, кв. 10')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (38, N'reina75@ferry.net', N'Лебедева', N'Анна', N'Александровна', CAST(N'1985-03-30' AS Date), N'5092', N'642468', N'443375, г. Санкт-Петербург, ул. Дзержинского, 50, кв. 95')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (39, N'kevinpatel@gmail.com', N'Макарова', N'Василиса', N'Андреевна', CAST(N'1999-04-08' AS Date), N'1474', N'326347', N'426030, г. Санкт-Петербург, ул. Маяковского, 44, кв. 93')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (40, N'ceigoixakaunni-9227@yopmail.com', N'Медведев', N'Святослав', N'Евгеньевич', CAST(N'1985-07-13' AS Date), N'2791', N'114390', N'603036, г. Санкт-Петербург, ул. Садовая, 4, кв. 13')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (41, N'kauprezofautei-6607@yopmail.com', N'Минина', N'Таисия', N'Кирилловна', CAST(N'1985-10-13' AS Date), N'7512', N'141956', N'603002, г. Санкт-Петербург, ул. Дзержинского, 28, кв. 56')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (42, N'tatum.collins@fay.org', N'Миронов', N'Юрий', N'Денисович', CAST(N'1985-01-26' AS Date), N'3774', N'511438', N'620653, г. Санкт-Петербург, ул. Западная, 15, кв. 25')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (43, N'olen79@yahoo.com', N'Михайлова', N'Мария', N'Марковна', CAST(N'1976-12-02' AS Date), N'5150', N'696226', N'603743, г. Санкт-Петербург, ул. Матросова, 19, кв. 20')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (44, N'carroll.jerod@hotmail.com', N'Моисеев', N'Камиль', N'Максимович', CAST(N'1999-06-17' AS Date), N'5333', N'675375', N'614505, г. Санкт-Петербург, ул. Нагорная, 37, кв. 31')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (45, N'lori17@hotmail.com', N'Наумов', N'Руслан', N'Михайлович', CAST(N'1999-10-11' AS Date), N'1806', N'289145', N'420151, г. Санкт-Петербург, ул. Вишневая, 32, кв. 81')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (46, N'quaffaullelourei-1667@yopmail.com', N'Наумов', N'Серафим', N'Романович', CAST(N'1999-04-15' AS Date), N'5046', N'158433', N'450558, г. Санкт-Петербург, ул. Набережная, 30, кв. 71')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (47, N'drollins@schultz-soto.net', N'Никитина', N'Полина', N'Александровна', CAST(N'1976-09-19' AS Date), N'2077', N'443480', N'625560, г. Санкт-Петербург, ул. Некрасова, 12, кв. 66')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (48, N'xawugosune-1385@yopmail.com', N'Николаев', N'Даниил', N'Всеволодович', CAST(N'2001-02-10' AS Date), N'2280', N'223523', N'614164, г. Санкт-Петербург, ул. Степная, 30, кв. 75')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (49, N'pblack@copeland-winters.org', N'Окулова', N'Олеся', N'Алексеевна', CAST(N'1999-04-03' AS Date), N'2147', N'357518', N'630201, г. Санкт-Петербург, ул. Комсомольская, 17, кв. 25')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (50, N'thomasmoore@wilson-singh.net', N'Орлов', N'Николай', N'Егорович', CAST(N'1985-07-27' AS Date), N'8207', N'522702', N'410542, г. Санкт-Петербург, ул. Светлая, 46, кв. 82')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (51, N'arjun39@hotmail.com', N'Орлова', N'Алиса', N'Михайловна', CAST(N'1997-02-24' AS Date), N'3084', N'535966', N'603653, г. Санкт-Петербург, ул. Молодежная, 2, кв. 45')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (52, N'damon.mcclure@mills.com', N'Орлова', N'Ясмина', N'Васильевна', CAST(N'1984-06-24' AS Date), N'4741', N'601821', N'400750, г. Санкт-Петербург, ул. Школьная, 36, кв. 71')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (53, N'karson28@hotmail.com', N'Пономарев', N'Артём', N'Маркович', CAST(N'1984-06-02' AS Date), N'5155', N'465274', N'614316, г. Санкт-Петербург, ул. Первомайская, 48, кв. 31')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (54, N'vconnelly@kautzer.com', N'Семенов', N'Даниил', N'Иванович', CAST(N'1976-01-04' AS Date), N'2675', N'427933', N'344990, г. Санкт-Петербург, ул. Красноармейская, 19, кв. 92')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (55, N'ketameissoinnei-1951@yopmail.com', N'Серова', N'Екатерина', N'Львовна', CAST(N'1984-10-24' AS Date), N'2377', N'871623', N'614611, г. Санкт-Петербург, ул. Молодежная, 50, кв. 78')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (56, N'may.kirlin@hotmail.com', N'Смирнова', N'Анна', N'Германовна', CAST(N'1997-07-18' AS Date), N'3392', N'471644', N'400260, г. Санкт-Петербург, ул. Больничная, 30, кв. 53')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (57, N'stephen99@yahoo.com', N'Смирнова', N'Дарья', N'Макаровна', CAST(N'1976-03-22' AS Date), N'1768', N'266986', N'603721, г. Санкт-Петербург, ул. Гоголя, 41, кв. 57')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (58, N'satrahuddusei-4458@yopmail.com', N'Снегирев', N'Макар', N'Иванович', CAST(N'1998-05-21' AS Date), N'4560', N'354155', N'394242, г. Санкт-Петербург, ул. Коммунистическая, 43, кв. 57')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (59, N'janae.bogan@gmail.com', N'Соболева', N'Кира', N'Фёдоровна', CAST(N'1998-03-14' AS Date), N'4537', N'564868', N'420633, г. Санкт-Петербург, ул. Матросова, 18, кв. 41')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (60, N'nitzsche.katlynn@yahoo.com', N'Соболева', N'Николь', N'Фёдоровна', CAST(N'1976-05-02' AS Date), N'3070', N'449655', N'400839, г. Санкт-Петербург, ул. 8 Марта, 46, кв. 44')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (61, N'morganhoward@clark.com', N'Соловьев', N'Давид', N'Ильич', CAST(N'1984-03-06' AS Date), N'1647', N'306372', N'630370, г. Санкт-Петербург, ул. Шоссейная, 24, кв. 81')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (62, N'vmoore@gmail.com', N'Суханова', N'Варвара', N'Матвеевна', CAST(N'1993-09-13' AS Date), N'4743', N'598180', N'644410, г. Санкт-Петербург, ул. Красная, 17, кв. 69')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (63, N'itzel73@anderson.com', N'Терехов', N'Михаил', N'Андреевич', CAST(N'1976-07-06' AS Date), N'3862', N'521377', N'644321, г. Санкт-Петербург, ул. Клубная, 32, кв. 10')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (64, N'cuevascatherine@carlson.biz', N'Титов', N'Андрей', N'Глебович', CAST(N'1985-10-23' AS Date), N'7079', N'213265', N'614510, г. Санкт-Петербург, ул. Маяковского, 47, кв. 72')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (65, N'corine16@von.com', N'Тихонова', N'Анна', N'Львовна', CAST(N'1985-03-23' AS Date), N'3108', N'451174', N'450539, г. Санкт-Петербург, ул. Заводская, 3, кв. 81')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (66, N'javonte71@kuhlman.biz', N'Ткачева', N'Милана', N'Тимуровна', CAST(N'1998-05-24' AS Date), N'2581', N'441645', N'350940, г. Санкт-Петербург, ул. Первомайская, 23, кв. 2')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (67, N'zapramaxesu-7741@yopmail.com', N'Филиппова', N'Анна', N'Глебовна', CAST(N'1976-05-31' AS Date), N'2367', N'558134', N'125837, г. Санкт-Петербург, ул. Шоссейная, 40, кв. 92')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (68, N'garciadavid@mckinney-mcbride.com', N'Фирсов', N'Егор', N'Романович', CAST(N'1993-09-02' AS Date), N'5829', N'219464', N'625683, г. Санкт-Петербург, ул. 8 Марта, 20, кв. 21')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (69, N'gohufreilagrau-3818@yopmail.com', N'Фролов', N'Андрей', N'Иванович', CAST(N'2001-07-14' AS Date), N'1180', N'176596', N'344288, г. Санкт-Петербург, ул. Чехова, 1, кв. 34')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (70, N'bryana.kautzer@yahoo.com', N'Черепанова', N'Анна', N'Давидовна', CAST(N'1985-11-06' AS Date), N'3497', N'487819', N'660924, г. Санкт-Петербург, ул. Молодежная, 32, кв. 59')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (71, N'vit', N'Днепровский', N'Виталий', N'Сергеевич', CAST(N'0001-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (72, N'fgbfg', N'fgb', N'fgbf', N'fgb', CAST(N'2024-12-04' AS Date), N'1231', N'123123', N'feddfvdfv')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (73, N'fghfgh', N'fhgfg', N'fghfgh', N'fghfgh', CAST(N'2024-12-26' AS Date), N'1233', N'124123', N'dfbgdh')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (74, N'hhh', N'hhh', N'hhh', N'hhh', CAST(N'2003-08-08' AS Date), N'1234', N'123123', N'fgbfgbgf')
INSERT [dbo].[users] ([id], [email], [surname], [name], [patronymic], [date_of_brt], [series], [number], [address]) VALUES (75, N'dfgdfg', N'dfgdf', N'dfgdfg', N'dfgdfg', CAST(N'2024-12-18' AS Date), N'1231', N'123123', N'gfedgdfgd')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__id_equip__4F7CD00D] FOREIGN KEY([id_equipment])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__id_equip__4F7CD00D]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__id_staff__5165187F] FOREIGN KEY([id_staff])
REFERENCES [dbo].[staff] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__id_staff__5165187F]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__id_users__5070F446] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__id_users__5070F446]
GO
USE [master]
GO
ALTER DATABASE [br] SET  READ_WRITE 
GO
