USE [master]
GO
/****** Object:  Database [HotelDataBase]    Script Date: 09.06.2024 21:37:56 ******/
CREATE DATABASE [HotelDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelDataBase', FILENAME = N'D:\БД\Установка\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelDataBase_log', FILENAME = N'D:\БД\Установка\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelDataBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelDataBase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelDataBase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelDataBase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HotelDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [HotelDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelDataBase] SET QUERY_STORE = OFF
GO
USE [HotelDataBase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accommodation]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accommodation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HabitationId] [int] NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NULL,
	[PassportData] [nvarchar](max) NULL,
	[InternationalPassport] [nvarchar](max) NULL,
	[BirthCertificate] [nvarchar](max) NULL,
	[Registration] [nvarchar](max) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_Accommodation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employment]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[BookingDate] [datetime2](7) NOT NULL,
	[DateOfArrival] [date] NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[UserId] [int] NOT NULL,
	[NumberOfPeople] [int] NOT NULL,
	[NumberOfChildren] [int] NULL,
	[Cost] [int] NULL,
	[Prepayment] [int] NULL,
	[Cheque] [nvarchar](max) NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Employment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitation]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[DateStart] [datetime2](7) NOT NULL,
	[DateEnd] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[EmploymentId] [int] NOT NULL,
	[StatustId] [int] NOT NULL,
	[Payment] [int] NULL,
 CONSTRAINT [PK_Habitation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Url] [nvarchar](max) NOT NULL,
	[RoomId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomPrice]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomPrice](
	[DateStartOfPeriod] [datetime2](7) NOT NULL,
	[DateEndOfPeriod] [datetime2](7) NOT NULL,
	[MainPrice] [int] NOT NULL,
	[LessPrice] [int] NULL,
	[IdCategory] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomOnTheFloor] [int] NOT NULL,
	[MainPhoto] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomOnTheFloor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomsCategory]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomsCategory](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MaxNumberOfPeople] [int] NOT NULL,
	[MinNumberOfPeople] [int] NOT NULL,
 CONSTRAINT [PK_RoomsCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09.06.2024 21:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Discount] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240425150930_DataBaseHotel', N'7.0.0')
GO
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (1, N'Ирина', N'Сапрыкина', N'Игоревна', N'IrinaAdmin@mail.ru', N'irina1967', N'742u7djd', 1)
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (2, N'Всеволод', N'Николаев', N'Олегович', N'VsevManager@mail.ru', N'Vsev1988', N'1988qwer', 2)
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronymic], [Email], [Login], [Password], [RoleId]) VALUES (3, N'Максим', N'Баринов', N'Викторович', N'MaxManager1999', N'MaxManag741', N'741085209630', 2)
GO
SET IDENTITY_INSERT [dbo].[Employment] ON 

INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (1, 101, CAST(N'2024-02-24T00:00:00.0000000' AS DateTime2), CAST(N'2024-03-05' AS Date), CAST(N'2024-03-15' AS Date), 3, 1, 0, 19900, 5970, N'31.pdf', 2)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (2, 102, CAST(N'2024-02-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-05' AS Date), CAST(N'2024-04-15' AS Date), 3, 1, 1, 26000, 7800, N'32.pdf', 3)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (3, 105, CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-21' AS Date), CAST(N'2024-06-01' AS Date), 3, 1, 1, 71880, 21564, N'33.pdf', 3)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (4, 208, CAST(N'2024-05-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-15' AS Date), CAST(N'2024-06-21' AS Date), 1, 2, 2, 36470, 10941, N'14.pdf', 2)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (5, 107, CAST(N'2024-06-04T23:54:30.1631484' AS DateTime2), CAST(N'2024-06-12' AS Date), CAST(N'2024-06-21' AS Date), 3, 1, 2, 80910, 24273, N'35.pdf', 1)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (6, 301, CAST(N'2024-06-07T14:15:22.0743431' AS DateTime2), CAST(N'2024-06-29' AS Date), CAST(N'2024-07-03' AS Date), 2, 2, 0, 67960, 20388, N'26.pdf', 1)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (7, 309, CAST(N'2024-06-09T11:34:51.4356819' AS DateTime2), CAST(N'2024-07-09' AS Date), CAST(N'2024-07-19' AS Date), 4, 2, 0, 160000, 48000, N'47.pdf', 1)
INSERT [dbo].[Employment] ([Id], [RoomId], [BookingDate], [DateOfArrival], [DepartureDate], [UserId], [NumberOfPeople], [NumberOfChildren], [Cost], [Prepayment], [Cheque], [StatusId]) VALUES (8, 105, CAST(N'2024-06-09T20:50:19.3670600' AS DateTime2), CAST(N'2024-06-21' AS Date), CAST(N'2024-06-25' AS Date), 8, 1, 1, 23960, 0, N'88.pdf', 2)
SET IDENTITY_INSERT [dbo].[Employment] OFF
GO
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_101.jpg', 101)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_101.jpg', 101)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_101.jpg', 101)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 101)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_102.jpg', 102)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_102.jpg', 102)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 102)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_103.jpg', 103)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_103.jpg', 103)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 103)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_104.jpg', 104)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_104.jpg', 104)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 104)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_105.jpg', 105)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_105.jpg', 105)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 105)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_106.jpg', 106)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_106.jpg', 106)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 106)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 106)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_107.jpg', 107)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_107.jpg', 107)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 107)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 107)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_108.jpg', 108)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_108.jpg', 108)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 108)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_108.jpg', 108)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_109.jpg', 109)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_109.jpg', 109)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 109)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 109)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_110.jpg', 110)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_110.jpg', 110)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 110)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_111.jpg', 111)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_111.jpg', 111)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 111)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_112.jpg', 112)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_112.jpg', 112)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 112)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 112)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_113.jpg', 113)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_113.jpg', 113)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 113)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 113)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_114.jpg', 114)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_114.jpg', 114)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 114)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_115.jpg', 115)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_115.jpg', 115)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 115)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_116.jpg', 116)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_116.jpg', 116)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 116)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_117.jpg', 117)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_117.jpg', 117)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 117)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_201.jpg', 201)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_201.jpg', 201)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 201)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 201)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_202.jpg', 202)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_202.jpg', 202)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 202)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_203.jpg', 203)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_203.jpg', 203)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 203)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_204.jpg', 204)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_204.jpg', 204)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 204)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Breakfast.jpg', 204)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_205.jpg', 205)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_205.jpg', 205)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Family.jpg', 205)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_206.jpg', 206)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_206.jpg', 206)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Family.jpg', 206)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_207.jpg', 207)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_207.jpg', 207)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Family.jpg', 207)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_208.jpg', 208)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_208.jpg', 208)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Family.jpg', 208)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_209.jpg', 209)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_209.jpg', 209)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Family.jpg', 209)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Bathroom.jpg', 209)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_210.jpg', 210)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_210.jpg', 210)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Breakfast.jpg', 210)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_211.jpg', 211)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_211.jpg', 211)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 211)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_212.jpg', 212)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_212.jpg', 212)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 212)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_213.jpg', 213)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_213.jpg', 213)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Family.jpg', 213)
GO
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_214.jpg', 214)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_214.jpg', 214)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Breakfast.jpg', 214)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_215.jpg', 215)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_215.jpg', 215)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Fruit.jpg', 215)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_216.jpg', 216)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_216.jpg', 216)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Breakfast.jpg', 216)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 216)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_217.jpg', 217)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_217.jpg', 217)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Breakfast.jpg', 217)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_301.jpg', 301)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_301.jpg', 301)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 301)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_302.jpg', 302)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_302.jpg', 302)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 302)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_303.jpg', 303)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_303.jpg', 303)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 303)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_304.jpg', 304)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_304.jpg', 304)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 304)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_305.jpg', 305)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_305.jpg', 305)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 305)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 305)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_306.jpg', 306)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_306.jpg', 306)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 306)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_307.jpg', 307)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_307.jpg', 307)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 307)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 307)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_308.jpg', 308)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_308.jpg', 308)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 308)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Breakfast.jpg', 308)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_309.jpg', 309)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_309.jpg', 309)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 309)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_309.jpg', 309)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_310.jpg', 310)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_310.jpg', 310)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 310)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_310.jpg', 310)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_311.jpg', 311)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_311.jpg', 311)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_311.jpg', 311)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 311)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_312.jpg', 312)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_312.jpg', 312)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 312)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_312.jpg', 312)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_313.jpg', 313)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_312.jpg', 313)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 313)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 313)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_314.jpg', 314)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_314.jpg', 314)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a2_314.jpg', 314)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_315.jpg', 315)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_315.jpg', 315)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 315)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_316.jpg', 316)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_316.jpg', 316)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 316)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Accessories.jpg', 316)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a_317.jpg', 317)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/a1_317.jpg', 317)
INSERT [dbo].[Images] ([Url], [RoomId]) VALUES (N'/images/Photo/Luxe.jpg', 317)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Администратор')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 2990, 0, 1)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 1990, 0, 1)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 3990, 0, 1)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 1590, 0, 1)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 4990, 1990, 2)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 3990, 1090, 2)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 5990, 2390, 2)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 3590, 1090, 2)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 7990, 2090, 3)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 6990, 1590, 3)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 8990, 2590, 3)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 6590, 1090, 3)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 10990, 5090, 4)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 9990, 4090, 4)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 11990, 5990, 4)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 9780, 4990, 4)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 8990, 1990, 5)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 7990, 1790, 5)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 9990, 2390, 5)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 7990, 1090, 5)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 15990, 4990, 6)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 14990, 3990, 6)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 16990, 5990, 6)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 14090, 4090, 6)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2023-12-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 19990, 5990, 7)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T00:00:00.0000000' AS DateTime2), 18990, 3590, 7)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 20990, 4990, 7)
INSERT [dbo].[RoomPrice] ([DateStartOfPeriod], [DateEndOfPeriod], [MainPrice], [LessPrice], [IdCategory]) VALUES (CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T00:00:00.0000000' AS DateTime2), 19790, 3090, 7)
GO
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (101, N'/images/rooms/main_101.jpg', 1)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (102, N'/images/rooms/main_102.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (103, N'/images/rooms/main_103.jpg', 1)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (104, N'/images/rooms/main_104.jpg', 1)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (105, N'/images/rooms/main_105.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (106, N'/images/rooms/main_106.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (107, N'/images/rooms/main_107.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (108, N'/images/rooms/main_108.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (109, N'/images/rooms/main_109.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (110, N'/images/rooms/main_110.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (111, N'/images/rooms/main_111.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (112, N'/images/rooms/main_112.jpg', 1)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (113, N'/images/rooms/main_113.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (114, N'/images/rooms/main_114.jpg', 4)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (115, N'/images/rooms/main_115.jpg', 4)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (116, N'/images/rooms/main_116.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (117, N'/images/rooms/main_117.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (201, N'/images/rooms/main_201.jpg', 4)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (202, N'/images/rooms/main_202.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (203, N'/images/rooms/main_203.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (204, N'/images/rooms/main_204.jpg', 4)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (205, N'/images/rooms/main_205.jpg', 5)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (206, N'/images/rooms/main_206.jpg', 5)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (207, N'/images/rooms/main_207.jpg', 5)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (208, N'/images/rooms/main_208.jpg', 5)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (209, N'/images/rooms/main_209.jpg', 5)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (210, N'/images/rooms/main_210.jpg', 4)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (211, N'/images/rooms/main_211.jpg', 4)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (212, N'/images/rooms/main_212.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (213, N'/images/rooms/main_213.jpg', 5)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (214, N'/images/rooms/main_214.jpg', 3)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (215, N'/images/rooms/main_215.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (216, N'/images/rooms/main_216.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (217, N'/images/rooms/main_217.jpg', 2)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (301, N'/images/rooms/main_301.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (302, N'/images/rooms/main_302.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (303, N'/images/rooms/main_303.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (304, N'/images/rooms/main_304.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (305, N'/images/rooms/main_305.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (306, N'/images/rooms/main_306.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (307, N'/images/rooms/main_307.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (308, N'/images/rooms/main_308.jpg', 6)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (309, N'/images/rooms/main_309.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (310, N'/images/rooms/main_310.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (311, N'/images/rooms/main_311.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (312, N'/images/rooms/main_312.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (313, N'/images/rooms/main_313.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (314, N'/images/rooms/main_314.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (315, N'/images/rooms/main_315.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (316, N'/images/rooms/main_316.jpg', 7)
INSERT [dbo].[Rooms] ([RoomOnTheFloor], [MainPhoto], [CategoryId]) VALUES (317, N'/images/rooms/main_317.jpg', 7)
GO
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (1, N'Одноместный', N'Номер состоит из одной комнаты, балкона и ванной. Площадь 12 м2.', 1, 1)
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (2, N'Двуместный', N'Номер состоит из одной комнаты, балкона и ванной. Площадь 15 м2.', 2, 1)
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (3, N'Комфорт', N'Номер состоит из одной комнаты, балкона и ванной. Площадь 18 м2.', 3, 1)
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (4, N'Бизнес класс', N'Номер состоит из одной комнаты, балкона и ванной. Площадь 25 м2.', 2, 1)
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (5, N'Семейный', N'Номер состоит из одной комнаты, балкона и ванной. Площадь 20 м2.', 6, 4)
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (6, N'Люкс', N'Номер состоит из нескольких комнат, балкона и ванной. Площадь 35 м2.', 2, 1)
INSERT [dbo].[RoomsCategory] ([Id], [Name], [Description], [MaxNumberOfPeople], [MinNumberOfPeople]) VALUES (7, N'Апартаменты', N'Номер состоит из нескольких комнат, балкона и ванной. Площадь 40 м2.', 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Активна')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Отменена')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Выполнена')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (1, N'Алина', N'allina1972@mail.com', N'1478523wed!!', N'+7 (991) 101 52 31', 0, 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (2, N'Илья', N'illzzzz@yandex.ru', N'zwer2004', N'+7 (991) 526 69 96', 0, 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (3, N'Люба', N'lyubag@gmail.com', N'1234567890', N'+7 (991) 203 60 00', 0, 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (4, N'Татьяна', N'tati1980@mail.ru', N'7539514862', N'+7 (916) 050 73 69', 0, 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (5, N'Елизавета', N'LissW@mail.com', N'74108520', N'+7 (916) 603 06 97', 0, 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (7, N'Иван', N'IvanovIvan1972@yandex.ru', N'qazwsx111', N'+7 (991) 520 78 90', 0, 3)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Phone], [Discount], [RoleId]) VALUES (8, N'Николай', N'nicola@inbox.ru', N'12qwaszx', N'+7 (888) 888 88 89', 0, 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Accommodation_UserId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Accommodation_UserId] ON [dbo].[Accommodation]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_RoleId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Employee_RoleId] ON [dbo].[Employee]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employment_RoomId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Employment_RoomId] ON [dbo].[Employment]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employment_StatustId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Employment_StatustId] ON [dbo].[Employment]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employment_UserId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Employment_UserId] ON [dbo].[Employment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Habitation_EmploymentId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Habitation_EmploymentId] ON [dbo].[Habitation]
(
	[EmploymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Habitation_RoomId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Habitation_RoomId] ON [dbo].[Habitation]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Habitation_StatustId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Habitation_StatustId] ON [dbo].[Habitation]
(
	[StatustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Habitation_UserId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Habitation_UserId] ON [dbo].[Habitation]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoomPrice_CategoryId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_RoomPrice_CategoryId] ON [dbo].[RoomPrice]
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_CategoryId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_CategoryId] ON [dbo].[Rooms]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 09.06.2024 21:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_Accommodation_Habitation] FOREIGN KEY([HabitationId])
REFERENCES [dbo].[Habitation] ([Id])
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_Accommodation_Habitation]
GO
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_Accommodation_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_Accommodation_Users_UserId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Roles_RoleId]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomOnTheFloor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Status_StatustId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Status_StatustId]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Users_UserId]
GO
ALTER TABLE [dbo].[Habitation]  WITH CHECK ADD  CONSTRAINT [FK_Habitation_Employment_EmploymentId] FOREIGN KEY([EmploymentId])
REFERENCES [dbo].[Employment] ([Id])
GO
ALTER TABLE [dbo].[Habitation] CHECK CONSTRAINT [FK_Habitation_Employment_EmploymentId]
GO
ALTER TABLE [dbo].[Habitation]  WITH CHECK ADD  CONSTRAINT [FK_Habitation_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomOnTheFloor])
GO
ALTER TABLE [dbo].[Habitation] CHECK CONSTRAINT [FK_Habitation_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Habitation]  WITH CHECK ADD  CONSTRAINT [FK_Habitation_Status_StatustId] FOREIGN KEY([StatustId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Habitation] CHECK CONSTRAINT [FK_Habitation_Status_StatustId]
GO
ALTER TABLE [dbo].[Habitation]  WITH CHECK ADD  CONSTRAINT [FK_Habitation_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Habitation] CHECK CONSTRAINT [FK_Habitation_Users_UserId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomOnTheFloor])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Rooms]
GO
ALTER TABLE [dbo].[RoomPrice]  WITH CHECK ADD  CONSTRAINT [FK_RoomPrice_RoomsCategory_CategoryId] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[RoomsCategory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoomPrice] CHECK CONSTRAINT [FK_RoomPrice_RoomsCategory_CategoryId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomsCategory_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[RoomsCategory] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomsCategory_CategoryId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [HotelDataBase] SET  READ_WRITE 
GO
