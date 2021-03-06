USE [master]
GO
/****** Object:  Database [BikeOggy]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE DATABASE [BikeOggy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeOggy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BikeOggy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BikeOggy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BikeOggy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BikeOggy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeOggy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeOggy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeOggy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeOggy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeOggy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeOggy] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeOggy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeOggy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeOggy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeOggy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeOggy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeOggy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeOggy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeOggy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeOggy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeOggy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BikeOggy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeOggy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeOggy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeOggy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeOggy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeOggy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeOggy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeOggy] SET RECOVERY FULL 
GO
ALTER DATABASE [BikeOggy] SET  MULTI_USER 
GO
ALTER DATABASE [BikeOggy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeOggy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeOggy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeOggy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BikeOggy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BikeOggy', N'ON'
GO
USE [BikeOggy]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccount](
	[AccoutnId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[RoleId] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[DateOfBirth] [date] NULL,
	[FullName] [varchar](250) NOT NULL,
	[ShopId] [bigint] NULL,
 CONSTRAINT [PK_tblaccount] PRIMARY KEY CLUSTERED 
(
	[AccoutnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBike]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBike](
	[BikeId] [bigint] IDENTITY(1,1) NOT NULL,
	[BikeName] [nvarchar](50) NOT NULL,
	[BikeType] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[Owner] [bigint] NOT NULL,
	[LicensePlates] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblbike] PRIMARY KEY CLUSTERED 
(
	[BikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBooking](
	[BookingId] [bigint] IDENTITY(1,1) NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[BikeId] [bigint] NOT NULL,
	[Worker] [bigint] NOT NULL,
	[ShopServiceId] [bigint] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[StatusBooking] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblbooking] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[FeedbackID] [bigint] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[BookingId] [bigint] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblFeedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [varchar](50) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblrole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblService]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblService](
	[ServiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblservice] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblShop]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblShop](
	[ShopId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShopName] [varchar](50) NOT NULL,
	[Addresss] [varchar](250) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Manager] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblshop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblShopService]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShopService](
	[ShopServiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShopId] [bigint] NOT NULL,
	[ServiceId] [bigint] NOT NULL,
 CONSTRAINT [PK_tblshopservice] PRIMARY KEY CLUSTERED 
(
	[ShopServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatusBooking]    Script Date: 7/27/2020 12:28:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatusBooking](
	[StatusId] [varchar](50) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (1, N'admin', N'123', N'1234', N'address 1', N'admin', 1, NULL, N'Admin 1', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (3, N'shop1', N'123', N'12312', N'address 1', N'shop', 1, NULL, N'Shop 1', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (5, N'woker1', N'123', N'345345', N'address 1', N'worker', 1, NULL, N'Worker 1', 1)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (26, N'knowledge user', N'sketlwPo', N'224-587-9759', N'48 Petterle Point', N'biker', 1, CAST(N'1994-04-04' AS Date), N'Wynny Lapere', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (27, N'dedicated', N'VZYln7alZ0', N'814-775-6994', N'8823 Trailsway Court', N'biker', 1, CAST(N'1992-06-05' AS Date), N'Ricky Francom', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (28, N'Ameliorated', N'Two4smr3', N'909-894-1958', N'40 Anderson Street', N'biker', 1, CAST(N'1997-08-19' AS Date), N'Rosemarie Melbury', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (29, N'toolset', N'1DJY1VIxcyY', N'197-641-5345', N'24001 Chinook Street', N'biker', 1, CAST(N'1993-11-13' AS Date), N'Jareb Hattrick', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (30, N'coherent', N'hA8Xnl', N'392-175-8541', N'8 Graedel Pass', N'biker', 1, CAST(N'1994-11-10' AS Date), N'Verney Chieco', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (31, N'holistic', N'uN52w5xCy', N'613-316-2289', N'7 Huxley Point', N'biker', 1, CAST(N'1993-02-19' AS Date), N'Modestia Perks', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (32, N'process improvement', N'5myFsgUD', N'127-907-6370', N'80639 Monica Court', N'biker', 1, CAST(N'1996-11-03' AS Date), N'Ronna Possell', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (33, N'Centralized', N'oWAwCAejaFdZ', N'254-101-4329', N'541 Dwight Trail', N'biker', 1, CAST(N'1993-10-04' AS Date), N'Myranda Lightbown', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (34, N'24/7', N'Cl2YeG9q', N'589-264-9794', N'440 Haas Road', N'biker', 1, CAST(N'1992-06-25' AS Date), N'Raye Delouch', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (35, N'software', N'epBChrNmANOf', N'145-269-5448', N'819 Havey Hill', N'biker', 1, CAST(N'1990-11-17' AS Date), N'Orelle Gladbeck', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (36, N'optimizing', N'5by81AV', N'602-122-3941', N'04913 Katie Pass', N'biker', 1, CAST(N'1993-06-27' AS Date), N'Malina Budget', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (37, N'full-range', N'OccRdhhpb', N'397-775-4331', N'12 Duke Park', N'biker', 1, CAST(N'1991-04-19' AS Date), N'Miguela Scholey', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (38, N'Team-oriented', N'YYgdY0', N'973-379-4821', N'8 Mayer Road', N'biker', 1, CAST(N'1993-10-08' AS Date), N'Dianemarie Mabb', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (39, N'challenge', N'JWwtRLN', N'655-230-5377', N'88956 Oak Drive', N'biker', 1, CAST(N'1995-11-29' AS Date), N'Carly Deeming', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (40, N'eco-centric', N'ssIBCc2lt', N'646-915-6082', N'7393 Transport Junction', N'biker', 1, CAST(N'1998-04-28' AS Date), N'Kirsten McKinless', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (41, N'Graphic Interface', N'375aZeojx8x', N'910-765-2584', N'8 Truax Lane', N'biker', 1, CAST(N'1996-04-03' AS Date), N'Bobby Neesham', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (42, N'approach', N'XLPJKy3', N'975-569-2561', N'7648 Erie Terrace', N'biker', 1, CAST(N'1993-10-09' AS Date), N'Marlin Metschke', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (43, N'adapter', N'0yRNS7B', N'166-227-7192', N'5959 Commercial Center', N'biker', 1, CAST(N'1995-09-05' AS Date), N'Cara Vicar', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (44, N'zero administration', N'3DB7a4jXqu', N'801-585-4038', N'5092 Nancy Road', N'biker', 1, CAST(N'1998-01-30' AS Date), N'Wandie Hoofe', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (45, N'disintermediate', N'0oTz0Z56bcn', N'831-776-2178', N'076 Russell Drive', N'biker', 1, CAST(N'1993-02-12' AS Date), N'Myca Moakler', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (46, N'shop2', N'123', N'021515551', N'Quan 2', N'shop', 1, NULL, N'Shop 2', NULL)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (47, N'woker2', N'123', N'345345', N'address 1', N'worker', 1, NULL, N'Worker 2', 2)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (48, N'woker3', N'123', N'345345', N'address 2', N'worker', 1, NULL, N'Worker 3', 1)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (49, N'woker4', N'123', N'345345', N'address 2', N'worker', 1, NULL, N'Worker 4', 2)
INSERT [dbo].[tblAccount] ([AccoutnId], [UserName], [Password], [Phone], [Address], [RoleId], [Status], [DateOfBirth], [FullName], [ShopId]) VALUES (50, N'woker5', N'123', N'345345', N'address 2', N'worker', 1, NULL, N'Worker 5', 2)
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
SET IDENTITY_INSERT [dbo].[tblBike] ON 

INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (5, N'''Goldwing''', N'''Moto''', 1, 30, N'59OU-11215')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (6, N'''SH 125i/150i''', N'''Moto''', 1, 35, N'59DF-76847')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (7, N'''Sh Mode 125''', N'''Moto''', 0, 32, N'59YX-67094')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (8, N'''Sh Mode 125''', N'''Moto''', 1, 28, N'59XF-04601')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (9, N'''WinnerX''', N'''PKL''', 0, 27, N'59VQ-01323')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (10, N'''WinnerX''', N'''Moto''', 1, 41, N'59CD-38744')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (11, N'''Goldwing''', N'''Xe máy''', 0, 44, N'59IW-65519')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (12, N'''SH 125i/150i''', N'''PKL''', 1, 43, N'59UE-38256')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (13, N'''WinnerX''', N'''PKL''', 0, 33, N'59GG-99006')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (14, N'''CB500X''', N'''PKL''', 1, 33, N'59YP-54305')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (15, N'''Goldwing''', N'''Xe máy''', 1, 42, N'59HZ-38987')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (16, N'''Goldwing''', N'''Xe máy''', 1, 33, N'59WS-67846')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (17, N'''WinnerX''', N'''Moto''', 1, 36, N'59MR-89443')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (18, N'''Goldwing''', N'''PKL''', 0, 42, N'59BC-05427')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (19, N'''SH 125i/150i''', N'''Xe máy''', 0, 35, N'59PZ-33082')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (20, N'''WinnerX''', N'''PKL''', 0, 43, N'59VY-24576')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (21, N'''SH 125i/150i''', N'''Xe máy''', 1, 41, N'59ZW-48158')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (22, N'''Sh Mode 125''', N'''Xe máy''', 0, 43, N'59RB-36405')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (23, N'''WinnerX''', N'''Moto''', 1, 28, N'59EI-57631')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (24, N'''SH 125i/150i''', N'''Xe máy''', 0, 35, N'59XV-80552')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (25, N'''SH 125i/150i''', N'''PKL''', 0, 42, N'59LK-38211')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (26, N'''SH 125i/150i''', N'''Moto''', 0, 44, N'59TL-60036')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (27, N'''Sh Mode 125''', N'''Xe máy''', 1, 32, N'59EN-29376')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (28, N'''WinnerX''', N'''PKL''', 0, 35, N'59OA-59199')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (29, N'''CB500X''', N'''Xe máy''', 0, 34, N'59WX-33511')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (30, N'''Sh Mode 125''', N'''Moto''', 0, 44, N'59VK-55434')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (31, N'''Goldwing''', N'''Xe máy''', 1, 35, N'59QP-54297')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (32, N'''Goldwing''', N'''Moto''', 0, 35, N'59FB-46916')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (33, N'''CB500X''', N'''Moto''', 1, 29, N'59RO-64386')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (34, N'''Sh Mode 125''', N'''PKL''', 1, 36, N'59OS-15808')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (35, N'''SH 125i/150i''', N'''Moto''', 0, 34, N'59AL-08250')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (36, N'''Goldwing''', N'''Moto''', 1, 45, N'59UB-18082')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (37, N'''Goldwing''', N'''Xe máy''', 1, 30, N'59UI-97816')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (38, N'''Goldwing''', N'''Moto''', 0, 28, N'59NN-94429')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (39, N'''Goldwing''', N'''PKL''', 0, 39, N'59BS-01338')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (40, N'''Sh Mode 125''', N'''PKL''', 1, 34, N'59YJ-29948')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (41, N'''WinnerX''', N'''Moto''', 0, 27, N'59IX-14259')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (42, N'''WinnerX''', N'''Xe máy''', 0, 32, N'59LU-80022')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (43, N'''SH 125i/150i''', N'''Moto''', 1, 30, N'59CO-82334')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (44, N'''Goldwing''', N'''Xe máy''', 0, 33, N'59RL-06814')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (45, N'''SH 125i/150i''', N'''PKL''', 1, 27, N'59SI-46798')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (46, N'''Goldwing''', N'''Xe máy''', 0, 36, N'59SY-47816')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (47, N'''Goldwing''', N'''PKL''', 0, 45, N'59ZF-03492')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (48, N'''SH 125i/150i''', N'''Moto''', 0, 32, N'59FV-35133')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (49, N'''SH 125i/150i''', N'''Xe máy''', 1, 37, N'59II-11926')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (50, N'''CB500X''', N'''Moto''', 0, 40, N'59CU-92721')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (51, N'''CB500X''', N'''PKL''', 0, 32, N'59SE-55120')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (52, N'''Sh Mode 125''', N'''Xe máy''', 0, 39, N'59PG-16143')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (53, N'''CB500X''', N'''Xe máy''', 1, 37, N'59YA-25579')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (54, N'''Sh Mode 125''', N'''PKL''', 1, 31, N'59UG-49230')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (55, N'''SH 125i/150i''', N'''PKL''', 1, 44, N'59KF-23115')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (56, N'''Sh Mode 125''', N'''Moto''', 0, 44, N'59BJ-20154')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (57, N'''WinnerX''', N'''PKL''', 1, 29, N'59AC-02429')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (58, N'''Goldwing''', N'''PKL''', 1, 26, N'59ZF-43455')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (59, N'''CB500X''', N'''Xe máy''', 0, 29, N'59MP-57358')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (60, N'''Sh Mode 125''', N'''Xe máy''', 1, 44, N'59KD-19647')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (61, N'''Sh Mode 125''', N'''Moto''', 1, 29, N'59TP-83651')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (62, N'''CB500X''', N'''PKL''', 0, 31, N'59TK-83746')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (63, N'''SH 125i/150i''', N'''Xe máy''', 1, 39, N'59IT-02888')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (64, N'''SH 125i/150i''', N'''PKL''', 0, 36, N'59DF-43310')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (65, N'''Goldwing''', N'''Xe máy''', 0, 38, N'59UH-68513')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (66, N'''SH 125i/150i''', N'''PKL''', 1, 38, N'59YF-14422')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (67, N'''CB500X''', N'''PKL''', 0, 40, N'59NF-30788')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (68, N'''Sh Mode 125''', N'''PKL''', 1, 34, N'59GA-92678')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (69, N'''Goldwing''', N'''PKL''', 0, 29, N'59IT-97257')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (70, N'''WinnerX''', N'''PKL''', 1, 27, N'59QO-17786')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (71, N'''SH 125i/150i''', N'''PKL''', 1, 28, N'59JC-61793')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (72, N'''Sh Mode 125''', N'''Xe máy''', 1, 29, N'59QQ-58473')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (73, N'''WinnerX''', N'''PKL''', 0, 39, N'59IY-66602')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (74, N'''Sh Mode 125''', N'''Xe máy''', 1, 28, N'59SX-46311')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (75, N'''WinnerX''', N'''Moto''', 1, 32, N'59YX-11111')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (76, N'''SH 125i/150i''', N'''PKL''', 0, 45, N'59QS-17021')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (77, N'''CB500X''', N'''PKL''', 1, 40, N'59ES-10845')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (78, N'''CB500X''', N'''PKL''', 0, 43, N'59PK-00942')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (79, N'''SH 125i/150i''', N'''Moto''', 0, 42, N'59MB-81091')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (80, N'''CB500X''', N'''Xe máy''', 0, 38, N'59RL-88737')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (81, N'''SH 125i/150i''', N'''Moto''', 0, 41, N'59MX-49636')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (82, N'''Goldwing''', N'''Xe máy''', 1, 34, N'59PG-53912')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (83, N'''SH 125i/150i''', N'''Xe máy''', 1, 37, N'59RD-82723')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (84, N'''CB500X''', N'''Moto''', 1, 32, N'59RA-82651')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (85, N'''CB500X''', N'''Moto''', 0, 28, N'59OZ-02061')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (86, N'''Goldwing''', N'''Moto''', 1, 27, N'59IK-32041')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (87, N'''Goldwing''', N'''Xe máy''', 1, 27, N'59XS-08229')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (88, N'''Goldwing''', N'''Moto''', 0, 43, N'59JA-54877')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (89, N'''SH 125i/150i''', N'''PKL''', 0, 29, N'59OT-75705')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (90, N'''Sh Mode 125''', N'''Xe máy''', 1, 40, N'59WC-40380')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (91, N'''WinnerX''', N'''Moto''', 0, 30, N'59QW-62550')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (92, N'''CB500X''', N'''Xe máy''', 0, 39, N'59DV-86314')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (93, N'''WinnerX''', N'''Moto''', 0, 45, N'59OL-54839')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (94, N'''CB500X''', N'''Moto''', 1, 29, N'59CU-16129')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (95, N'''Goldwing''', N'''Xe máy''', 0, 34, N'59GQ-66861')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (96, N'''SH 125i/150i''', N'''Moto''', 0, 43, N'59IZ-62382')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (97, N'''CB500X''', N'''Moto''', 1, 43, N'59AC-47610')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (98, N'''SH 125i/150i''', N'''Moto''', 0, 44, N'59WN-20501')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (99, N'''Sh Mode 125''', N'''PKL''', 1, 30, N'59QF-34473')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (100, N'''WinnerX''', N'''Xe máy''', 0, 39, N'59UJ-40108')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (101, N'''Sh Mode 125''', N'''Xe máy''', 0, 45, N'59CW-77228')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (102, N'''Goldwing''', N'''Moto''', 1, 37, N'59AT-01480')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (103, N'''CB500X''', N'''PKL''', 0, 38, N'59IZ-09597')
GO
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (104, N'''Goldwing''', N'''Xe máy''', 0, 28, N'59YR-43873')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (105, N'''Goldwing''', N'''Moto''', 1, 39, N'59JA-41958')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (106, N'''SH 125i/150i''', N'''Moto''', 0, 45, N'59DH-40744')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (107, N'''Goldwing''', N'''Moto''', 0, 40, N'59NH-33688')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (108, N'''SH 125i/150i''', N'''Moto''', 0, 45, N'59LQ-28858')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (109, N'''WinnerX''', N'''PKL''', 1, 26, N'59UY-52021')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (110, N'''WinnerX''', N'''Moto''', 1, 44, N'59VL-47939')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (111, N'''Goldwing''', N'''Xe máy''', 0, 43, N'59MW-69652')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (112, N'''SH 125i/150i''', N'''Moto''', 0, 34, N'59HF-77818')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (113, N'''SH 125i/150i''', N'''PKL''', 1, 43, N'59CN-16841')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (114, N'''Sh Mode 125''', N'''Xe máy''', 0, 37, N'59VL-04958')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (115, N'''SH 125i/150i''', N'''PKL''', 0, 35, N'59AI-84043')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (116, N'''WinnerX''', N'''Moto''', 0, 44, N'59ZT-90638')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (117, N'''Sh Mode 125''', N'''PKL''', 1, 44, N'59LT-74333')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (118, N'''Sh Mode 125''', N'''Moto''', 1, 36, N'59FA-98646')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (119, N'''CB500X''', N'''Moto''', 1, 41, N'59SG-97956')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (120, N'''SH 125i/150i''', N'''PKL''', 1, 42, N'59PK-30350')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (121, N'''WinnerX''', N'''Moto''', 0, 36, N'59OY-19244')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (122, N'''Goldwing''', N'''Moto''', 1, 37, N'59NX-77312')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (123, N'''Goldwing''', N'''Xe máy''', 0, 38, N'59VO-10541')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (124, N'''Goldwing''', N'''Moto''', 0, 40, N'59UE-28837')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (125, N'''Sh Mode 125''', N'''PKL''', 1, 39, N'59IX-44822')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (126, N'''Goldwing''', N'''Xe máy''', 1, 43, N'59FU-72950')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (127, N'''Sh Mode 125''', N'''Xe máy''', 0, 32, N'59BU-18622')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (128, N'''Goldwing''', N'''PKL''', 1, 29, N'59YC-76903')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (129, N'''Sh Mode 125''', N'''Moto''', 0, 31, N'59TJ-20660')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (130, N'''Sh Mode 125''', N'''PKL''', 1, 36, N'59HG-13703')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (131, N'''CB500X''', N'''Moto''', 1, 37, N'59ZH-38904')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (132, N'''Goldwing''', N'''PKL''', 1, 43, N'59AH-23780')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (133, N'''Sh Mode 125''', N'''Moto''', 0, 38, N'59AK-78614')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (134, N'''Goldwing''', N'''Moto''', 0, 30, N'59XG-60493')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (135, N'''Goldwing''', N'''Xe máy''', 0, 33, N'59UY-53348')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (136, N'''Goldwing''', N'''Xe máy''', 1, 41, N'59IA-50864')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (137, N'''WinnerX''', N'''Moto''', 1, 41, N'59IR-12967')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (138, N'''Goldwing''', N'''Moto''', 1, 42, N'59CW-42152')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (139, N'''Goldwing''', N'''Xe máy''', 1, 29, N'59XC-90157')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (140, N'''SH 125i/150i''', N'''Moto''', 0, 42, N'59DA-02491')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (141, N'''WinnerX''', N'''PKL''', 1, 37, N'59VL-48165')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (142, N'''WinnerX''', N'''PKL''', 0, 27, N'59EC-57049')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (143, N'''SH 125i/150i''', N'''PKL''', 0, 32, N'59OZ-44848')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (144, N'''Sh Mode 125''', N'''Moto''', 1, 37, N'59QJ-98489')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (145, N'''CB500X''', N'''Xe máy''', 1, 29, N'59FA-17793')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (146, N'''WinnerX''', N'''Moto''', 1, 32, N'59NY-55986')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (147, N'''CB500X''', N'''Xe máy''', 1, 36, N'59NE-05540')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (148, N'''CB500X''', N'''Xe máy''', 1, 37, N'59KV-21403')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (149, N'''Goldwing''', N'''Moto''', 0, 39, N'59YO-25760')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (150, N'''CB500X''', N'''PKL''', 1, 31, N'59ZS-52206')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (151, N'''Goldwing''', N'''Xe máy''', 1, 30, N'59XF-65118')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (152, N'''WinnerX''', N'''Moto''', 1, 43, N'59NR-69589')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (153, N'''CB500X''', N'''PKL''', 1, 36, N'59PH-63738')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (154, N'''Goldwing''', N'''Moto''', 1, 29, N'59YE-06701')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (155, N'''Sh Mode 125''', N'''Moto''', 0, 45, N'59FU-31335')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (156, N'''CB500X''', N'''PKL''', 1, 28, N'59YW-45809')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (157, N'''WinnerX''', N'''Xe máy''', 0, 42, N'59EF-97862')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (158, N'''WinnerX''', N'''Moto''', 1, 39, N'59IR-36687')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (159, N'''CB500X''', N'''Moto''', 0, 42, N'59NS-10135')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (160, N'''Sh Mode 125''', N'''Moto''', 0, 29, N'59RJ-62547')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (161, N'''WinnerX''', N'''PKL''', 1, 27, N'59II-31782')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (162, N'''CB500X''', N'''PKL''', 1, 41, N'59JV-04477')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (163, N'''CB500X''', N'''Moto''', 1, 37, N'59CM-41605')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (164, N'''CB500X''', N'''PKL''', 0, 32, N'59AW-40064')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (165, N'''SH 125i/150i''', N'''Xe máy''', 0, 44, N'59DA-06439')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (166, N'''SH 125i/150i''', N'''Xe máy''', 0, 30, N'59NT-19628')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (167, N'''WinnerX''', N'''PKL''', 0, 43, N'59CT-43210')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (168, N'''Sh Mode 125''', N'''Moto''', 1, 45, N'59TJ-66919')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (169, N'''Goldwing''', N'''PKL''', 0, 28, N'59UC-26055')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (170, N'''Goldwing''', N'''Moto''', 1, 32, N'59UA-97551')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (171, N'''SH 125i/150i''', N'''Xe máy''', 0, 34, N'59IF-08497')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (172, N'''Sh Mode 125''', N'''Moto''', 1, 32, N'59VN-87551')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (173, N'''Goldwing''', N'''PKL''', 0, 42, N'59OO-04222')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (174, N'''WinnerX''', N'''Moto''', 0, 38, N'59CQ-45057')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (175, N'''Goldwing''', N'''Xe máy''', 0, 33, N'59OR-08904')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (176, N'''WinnerX''', N'''Moto''', 1, 41, N'59MY-33843')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (177, N'''CB500X''', N'''Xe máy''', 0, 44, N'59OF-33954')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (178, N'''CB500X''', N'''Xe máy''', 1, 45, N'59CE-03336')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (179, N'''WinnerX''', N'''PKL''', 1, 29, N'59XM-91684')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (180, N'''Sh Mode 125''', N'''Xe máy''', 0, 45, N'59MN-95962')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (181, N'''Sh Mode 125''', N'''PKL''', 0, 29, N'59BW-60062')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (182, N'''Goldwing''', N'''PKL''', 1, 43, N'59QF-34044')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (183, N'''SH 125i/150i''', N'''Xe máy''', 1, 41, N'59JA-91042')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (184, N'''Goldwing''', N'''Xe máy''', 1, 31, N'59GL-22663')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (185, N'''Sh Mode 125''', N'''Xe máy''', 0, 41, N'59KC-55894')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (186, N'''Goldwing''', N'''PKL''', 1, 27, N'59SE-58921')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (187, N'''CB500X''', N'''PKL''', 0, 40, N'59LV-40764')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (188, N'''WinnerX''', N'''Xe máy''', 0, 32, N'59TK-56418')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (189, N'''Sh Mode 125''', N'''Moto''', 0, 32, N'59ZL-25034')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (190, N'''SH 125i/150i''', N'''Xe máy''', 1, 41, N'59SG-25728')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (191, N'''Goldwing''', N'''PKL''', 1, 40, N'59JN-78631')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (192, N'''SH 125i/150i''', N'''PKL''', 1, 37, N'59TP-86406')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (193, N'''SH 125i/150i''', N'''Moto''', 1, 38, N'59RT-69363')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (194, N'''SH 125i/150i''', N'''Moto''', 0, 39, N'59LP-98297')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (195, N'''WinnerX''', N'''Moto''', 0, 29, N'59MU-58879')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (196, N'''WinnerX''', N'''Xe máy''', 1, 34, N'59PZ-49168')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (197, N'''WinnerX''', N'''PKL''', 0, 37, N'59TH-41268')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (198, N'''Sh Mode 125''', N'''Moto''', 1, 26, N'59ML-66627')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (199, N'''CB500X''', N'''Xe máy''', 1, 33, N'59WD-38548')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (200, N'''CB500X''', N'''Xe máy''', 0, 30, N'59XN-96734')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (201, N'''CB500X''', N'''Xe máy''', 0, 33, N'59UF-57111')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (202, N'''CB500X''', N'''Xe máy''', 1, 43, N'59IS-61862')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (203, N'''Sh Mode 125''', N'''Xe máy''', 1, 30, N'59PG-48892')
GO
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (204, N'''Sh Mode 125''', N'''Moto''', 0, 43, N'59BE-12607')
INSERT [dbo].[tblBike] ([BikeId], [BikeName], [BikeType], [Status], [Owner], [LicensePlates]) VALUES (205, N'''SH 125i/150i''', N'''PKL''', 0, 40, N'59QE-13833')
SET IDENTITY_INSERT [dbo].[tblBike] OFF
SET IDENTITY_INSERT [dbo].[tblBooking] ON 

INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (1, CAST(N'2020-03-02 00:00:00.000' AS DateTime), 1, 5, 48, 1, 1000, N'Quan 2', N'first')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (2, CAST(N'2019-09-30 17:23:54.000' AS DateTime), 1, 133, 5, 2, 82283, N'59726 Knutson Park', N'first')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (3, CAST(N'2020-06-22 11:20:51.000' AS DateTime), 1, 102, 5, 1, 52963, N'66328 Caliangt Junction', N'first')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (4, CAST(N'2019-10-03 13:03:10.000' AS DateTime), 1, 13, 47, 1, 97609, N'1937 Maryland Road', N'first')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (5, CAST(N'2020-05-03 23:08:13.000' AS DateTime), 1, 94, 5, 1, 52917, N'70 Barby Plaza', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (6, CAST(N'2020-05-14 08:52:00.000' AS DateTime), 0, 17, 47, 2, 90886, N'5529 Boyd Crossing', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (7, CAST(N'2020-03-22 18:22:21.000' AS DateTime), 0, 167, 5, 2, 56101, N'33 Pleasure Road', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (8, CAST(N'2020-02-04 21:07:44.000' AS DateTime), 0, 151, 48, 1, 56837, N'4 Russell Place', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (9, CAST(N'2020-01-02 08:49:22.000' AS DateTime), 1, 67, 47, 1, 59831, N'36 Heffernan Park', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (10, CAST(N'2019-09-11 20:19:14.000' AS DateTime), 0, 103, 5, 2, 60004, N'15 Lindbergh Lane', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (11, CAST(N'2019-09-18 22:47:31.000' AS DateTime), 0, 71, 5, 2, 90858, N'86 Main Way', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (12, CAST(N'2019-08-01 19:02:31.000' AS DateTime), 0, 38, 47, 1, 82743, N'7552 Green Drive', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (13, CAST(N'2020-05-21 02:48:27.000' AS DateTime), 0, 125, 5, 1, 75515, N'75 Gateway Center', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (14, CAST(N'2019-09-30 18:53:17.000' AS DateTime), 0, 191, 47, 1, 61876, N'48486 Village Green Avenue', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (15, CAST(N'2019-08-22 00:25:59.000' AS DateTime), 1, 147, 47, 2, 59829, N'27285 La Follette Point', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (16, CAST(N'2019-12-25 05:07:50.000' AS DateTime), 1, 173, 48, 1, 72997, N'65 Mcbride Parkway', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (17, CAST(N'2019-10-15 06:43:06.000' AS DateTime), 0, 192, 47, 2, 74753, N'710 Glacier Hill Court', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (18, CAST(N'2020-01-01 17:25:14.000' AS DateTime), 1, 172, 5, 2, 68687, N'5519 Ohio Hill', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (19, CAST(N'2020-05-31 09:35:18.000' AS DateTime), 0, 32, 47, 2, 62638, N'89 Oakridge Drive', N'finish')
INSERT [dbo].[tblBooking] ([BookingId], [DateCreate], [Status], [BikeId], [Worker], [ShopServiceId], [TotalPrice], [Address], [StatusBooking]) VALUES (20, CAST(N'2020-02-24 14:15:49.000' AS DateTime), 0, 189, 5, 2, 70918, N'9 Anzinger Court', N'finish')
SET IDENTITY_INSERT [dbo].[tblBooking] OFF
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([FeedbackID], [Rank], [Description], [BookingId], [Status]) VALUES (1, 5, N'OK', 4, 1)
INSERT [dbo].[tblFeedback] ([FeedbackID], [Rank], [Description], [BookingId], [Status]) VALUES (2, 5, N'Good', 5, 1)
INSERT [dbo].[tblFeedback] ([FeedbackID], [Rank], [Description], [BookingId], [Status]) VALUES (3, 4, N'Good', 6, 1)
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (N'admin', N'Admin')
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (N'biker', N'Biker')
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (N'shop', N'Shop Manager')
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (N'worker', N'Worker')
SET IDENTITY_INSERT [dbo].[tblService] ON 

INSERT [dbo].[tblService] ([ServiceId], [ServiceName], [Description], [Price], [Status]) VALUES (1, N'Vá xe', N'Vá xe nè ', 50000, 1)
INSERT [dbo].[tblService] ([ServiceId], [ServiceName], [Description], [Price], [Status]) VALUES (2, N'Thổi Bugi', N'Vô nước', 100000, 1)
INSERT [dbo].[tblService] ([ServiceId], [ServiceName], [Description], [Price], [Status]) VALUES (3, N'Sửa Oto', N'Máy', 80000, 1)
SET IDENTITY_INSERT [dbo].[tblService] OFF
SET IDENTITY_INSERT [dbo].[tblShop] ON 

INSERT [dbo].[tblShop] ([ShopId], [ShopName], [Addresss], [Phone], [Manager], [Status]) VALUES (1, N'Shop 1', N'ahihi', N'20392039', 3, 1)
INSERT [dbo].[tblShop] ([ShopId], [ShopName], [Addresss], [Phone], [Manager], [Status]) VALUES (2, N'Shop 2', N'Quan 2', N'02222222', 46, 1)
SET IDENTITY_INSERT [dbo].[tblShop] OFF
SET IDENTITY_INSERT [dbo].[tblShopService] ON 

INSERT [dbo].[tblShopService] ([ShopServiceId], [ShopId], [ServiceId]) VALUES (1, 1, 1)
INSERT [dbo].[tblShopService] ([ShopServiceId], [ShopId], [ServiceId]) VALUES (2, 1, 2)
INSERT [dbo].[tblShopService] ([ShopServiceId], [ShopId], [ServiceId]) VALUES (3, 2, 3)
SET IDENTITY_INSERT [dbo].[tblShopService] OFF
INSERT [dbo].[tblStatusBooking] ([StatusId], [StatusName]) VALUES (N'finish', N'Send Rescue To The Store')
INSERT [dbo].[tblStatusBooking] ([StatusId], [StatusName]) VALUES (N'first', N'Send Rescue To The Store')
INSERT [dbo].[tblStatusBooking] ([StatusId], [StatusName]) VALUES (N'match', N'Matched')
INSERT [dbo].[tblStatusBooking] ([StatusId], [StatusName]) VALUES (N'search', N'Searching')
SET ANSI_PADDING ON

GO
/****** Object:  Index [fkIdx_15]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_15] ON [dbo].[tblAccount]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_54]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_54] ON [dbo].[tblBike]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_63]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_63] ON [dbo].[tblBooking]
(
	[BikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_67]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_67] ON [dbo].[tblBooking]
(
	[Worker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_70]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_70] ON [dbo].[tblBooking]
(
	[ShopServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_26]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_26] ON [dbo].[tblShop]
(
	[Manager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_42]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_42] ON [dbo].[tblShopService]
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_45]    Script Date: 7/27/2020 12:28:15 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_45] ON [dbo].[tblShopService]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_15] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_15]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblShop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[tblShop] ([ShopId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblShop]
GO
ALTER TABLE [dbo].[tblBike]  WITH CHECK ADD  CONSTRAINT [FK_54] FOREIGN KEY([Owner])
REFERENCES [dbo].[tblAccount] ([AccoutnId])
GO
ALTER TABLE [dbo].[tblBike] CHECK CONSTRAINT [FK_54]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_63] FOREIGN KEY([BikeId])
REFERENCES [dbo].[tblBike] ([BikeId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_63]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_67] FOREIGN KEY([Worker])
REFERENCES [dbo].[tblAccount] ([AccoutnId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_67]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_70] FOREIGN KEY([ShopServiceId])
REFERENCES [dbo].[tblShopService] ([ShopServiceId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_70]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblStatus] FOREIGN KEY([StatusBooking])
REFERENCES [dbo].[tblStatusBooking] ([StatusId])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblStatus]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedback_tblBooking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[tblBooking] ([BookingId])
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK_tblFeedback_tblBooking]
GO
ALTER TABLE [dbo].[tblShop]  WITH CHECK ADD  CONSTRAINT [FK_26] FOREIGN KEY([Manager])
REFERENCES [dbo].[tblAccount] ([AccoutnId])
GO
ALTER TABLE [dbo].[tblShop] CHECK CONSTRAINT [FK_26]
GO
ALTER TABLE [dbo].[tblShopService]  WITH CHECK ADD  CONSTRAINT [FK_42] FOREIGN KEY([ShopId])
REFERENCES [dbo].[tblShop] ([ShopId])
GO
ALTER TABLE [dbo].[tblShopService] CHECK CONSTRAINT [FK_42]
GO
ALTER TABLE [dbo].[tblShopService]  WITH CHECK ADD  CONSTRAINT [FK_45] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[tblService] ([ServiceId])
GO
ALTER TABLE [dbo].[tblShopService] CHECK CONSTRAINT [FK_45]
GO
USE [master]
GO
ALTER DATABASE [BikeOggy] SET  READ_WRITE 
GO
