USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 14.01.2025 16:30:16 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[LoginStatus]    Script Date: 14.01.2025 16:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginStatus](
	[id] [int] NOT NULL,
	[LoginStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoginStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14.01.2025 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sex]    Script Date: 14.01.2025 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sex](
	[id] [int] NOT NULL,
	[Sex] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sex] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14.01.2025 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[idRole] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](100) NOT NULL,
	[PassportSeries] [nvarchar](100) NOT NULL,
	[PassportNumber] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[LastEnter] [date] NULL,
	[idLoginStatus] [int] NULL,
	[idSex] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoginStatus] ([id], [LoginStatus]) VALUES (1, N'Неуспешно')
INSERT [dbo].[LoginStatus] ([id], [LoginStatus]) VALUES (2, N'Успешно ')
GO
INSERT [dbo].[Role] ([id], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([id], [Role]) VALUES (2, N'Исполнитель')
INSERT [dbo].[Role] ([id], [Role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Sex] ([id], [Sex]) VALUES (1, N'ж')
INSERT [dbo].[Sex] ([id], [Sex]) VALUES (2, N'м')
GO
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (1, 3, N'Акимов Ян Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'7 817 855 837', N'2367', N'558134', CAST(N'1993-07-03' AS Date), NULL, 2, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (2, 2, N'Гончарова Ульяна Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'230 906-8815', N'7101', N'669343', CAST(N'1975-06-22' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (3, 1, N'Анохина Елизавета Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'5 554 448 316', N'3455', N'719630', CAST(N'1991-08-16' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (4, 3, N'Николаев Илья Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'3 926 824 442', N'2377', N'871623', CAST(N'1970-12-22' AS Date), NULL, 2, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (5, 2, N'Уткин Дмитрий Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'8 364 290 386', N'8755', N'921148', CAST(N'1999-05-04' AS Date), NULL, 1, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (6, 2, N'Куликова Стефания Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'2 839 453 092', N'4355', N'104594', CAST(N'1994-12-06' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (7, 2, N'Волков Егор Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'6 213 593 669', N'2791', N'114390', CAST(N'1995-03-28' AS Date), NULL, 2, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (8, 1, N'Соколова Софья Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'4 405 610 314', N'5582', N'126286', CAST(N'1977-03-27' AS Date), NULL, 1, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (9, 3, N'Голубева Полина Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'3 319 182 434', N'2978', N'133653', CAST(N'1975-04-12' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (10, 3, N'Вишневская Мария Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'4 932 193 942', N'7512', N'141956', CAST(N'1975-12-23' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (11, 3, N'Васильева Арина Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'4 074 855 030', N'5046', N'158433', CAST(N'2000-01-22' AS Date), NULL, 1, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (12, 3, N'Павлов Дмитрий Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'9 194 782 497', N'2460', N'169505', CAST(N'1983-10-03' AS Date), NULL, 1, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (13, 2, N'Горбунова Мирослава Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'4 828 029 580', N'3412', N'174593', CAST(N'1998-03-03' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (14, 3, N'Демина София Романовна', N'"deummecillummu-4992@mail.ru', N'deminasr
', N'D%DVKyDN
', N'4 559 446 449
', N'4950
', N'183034
', CAST(N'1993-06-08' AS Date), NULL, 1, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (15, 2, N'Петрова Алина Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'7 103 882 563', N'5829', N'219464', CAST(N'1980-09-23' AS Date), NULL, 2, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (16, 2, N'Плотников Григорий Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'7 594 523 846', N'6443', N'208059', CAST(N'1991-03-13' AS Date), NULL, 2, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (17, 2, N'Прохорова Есения Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'6 878 011 332', N'7079', N'213265', CAST(N'1998-04-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (18, 2, N'Чернов Алексей Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'7 425 783-2253', N'8207', N'522702', CAST(N'1980-04-16' AS Date), NULL, 2, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (19, 3, N'Горбунов Степан Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'7 889 449-4391', N'9307', N'232158', CAST(N'1993-07-23' AS Date), NULL, 2, 2)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (20, 2, N'Рябинина Софья Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'7 825 301-8250', N'1357', N'242839', CAST(N'1990-06-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (21, 2, N'Козлова Яна Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'7 397 334-2086', N'1167', N'256636', CAST(N'1987-12-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (22, 3, N'Лукьянова Ульяна Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'7 241 570-3040', N'1768', N'266986', CAST(N'1981-10-22' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (23, 2, N'Кондрашова Арина Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'7 713 462-8265', N'1710', N'427875', CAST(N'1976-12-22' AS Date), NULL, 1, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (24, 3, N'Быкова Виктория Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'7 854 822-2331', N'1806', N'289145', CAST(N'1973-06-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [idRole], [Name], [Email], [Login], [Password], [PhoneNumber], [PassportSeries], [PassportNumber], [Birthday], [LastEnter], [idLoginStatus], [idSex]) VALUES (25, 2, N'Гуляев Тимофей Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'7 439 713-6117', N'1587', N'291249', CAST(N'1987-02-05' AS Date), CAST(N'2025-01-14' AS Date), 1, 2)
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_LoginStatus] FOREIGN KEY([idLoginStatus])
REFERENCES [dbo].[LoginStatus] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_LoginStatus]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Sex] FOREIGN KEY([idSex])
REFERENCES [dbo].[Sex] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Sex]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
