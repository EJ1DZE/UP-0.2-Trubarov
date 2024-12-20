USE [master]
GO
/****** Object:  Database [Master_Pol]    Script Date: 19.12.2024 22:46:32 ******/
CREATE DATABASE [Master_Pol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Master_Pol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Master_Pol.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Master_Pol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Master_Pol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Master_Pol] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Master_Pol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Master_Pol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Master_Pol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Master_Pol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Master_Pol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Master_Pol] SET ARITHABORT OFF 
GO
ALTER DATABASE [Master_Pol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Master_Pol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Master_Pol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Master_Pol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Master_Pol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Master_Pol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Master_Pol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Master_Pol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Master_Pol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Master_Pol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Master_Pol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Master_Pol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Master_Pol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Master_Pol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Master_Pol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Master_Pol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Master_Pol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Master_Pol] SET RECOVERY FULL 
GO
ALTER DATABASE [Master_Pol] SET  MULTI_USER 
GO
ALTER DATABASE [Master_Pol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Master_Pol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Master_Pol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Master_Pol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Master_Pol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Master_Pol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Master_Pol', N'ON'
GO
ALTER DATABASE [Master_Pol] SET QUERY_STORE = ON
GO
ALTER DATABASE [Master_Pol] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Master_Pol]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 19.12.2024 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](255) NULL,
	[ScrapRate] [float] NULL,
 CONSTRAINT [PK__Material__3214EC2757FF6162] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 19.12.2024 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[partnerID] [int] NULL,
	[quantityProduct] [int] NULL,
	[dateSell] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 19.12.2024 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[partnerTypeID] [int] NULL,
	[partnerName] [nvarchar](100) NULL,
	[Director] [nvarchar](50) NULL,
	[partnerEmail] [nvarchar](50) NULL,
	[partnerPhone] [nvarchar](25) NULL,
	[partnerAdress] [nvarchar](max) NULL,
	[partnerINN] [nvarchar](10) NULL,
	[partnerRating] [int] NULL,
 CONSTRAINT [PK__Partners__3214EC272244394B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 19.12.2024 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2024 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[productTypeID] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[artikul] [nvarchar](7) NULL,
	[minCountForPartner] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Product__3214EC27C51702E5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.12.2024 22:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] NOT NULL,
	[productsType] [nvarchar](50) NULL,
	[kfTypeProducts] [float] NULL,
 CONSTRAINT [PK__ProductT__3214EC27329D702F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [typeName], [ScrapRate]) VALUES (1, N'Тип материала 1', 0.001)
INSERT [dbo].[MaterialType] ([ID], [typeName], [ScrapRate]) VALUES (2, N'Тип материала 2', 0.0095)
INSERT [dbo].[MaterialType] ([ID], [typeName], [ScrapRate]) VALUES (3, N'Тип материала 3', 0.0028)
INSERT [dbo].[MaterialType] ([ID], [typeName], [ScrapRate]) VALUES (4, N'Тип материала 4', 0.0055)
INSERT [dbo].[MaterialType] ([ID], [typeName], [ScrapRate]) VALUES (5, N'Тип материала 5', 0.0034)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProducts] ON 

INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [productID], [partnerID], [quantityProduct], [dateSell]) VALUES (17, 1, 6, 20000, CAST(N'2024-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [partnerTypeID], [partnerName], [Director], [partnerEmail], [partnerPhone], [partnerAdress], [partnerINN], [partnerRating]) VALUES (1, 1, N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 7)
INSERT [dbo].[Partners] ([ID], [partnerTypeID], [partnerName], [Director], [partnerEmail], [partnerPhone], [partnerAdress], [partnerINN], [partnerRating]) VALUES (2, 2, N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
INSERT [dbo].[Partners] ([ID], [partnerTypeID], [partnerName], [Director], [partnerEmail], [partnerPhone], [partnerAdress], [partnerINN], [partnerRating]) VALUES (3, 3, N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
INSERT [dbo].[Partners] ([ID], [partnerTypeID], [partnerName], [Director], [partnerEmail], [partnerPhone], [partnerAdress], [partnerINN], [partnerRating]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
INSERT [dbo].[Partners] ([ID], [partnerTypeID], [partnerName], [Director], [partnerEmail], [partnerPhone], [partnerAdress], [partnerINN], [partnerRating]) VALUES (5, 1, N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
INSERT [dbo].[Partners] ([ID], [partnerTypeID], [partnerName], [Director], [partnerEmail], [partnerPhone], [partnerAdress], [partnerINN], [partnerRating]) VALUES (6, 2, N'Кидалово', N'Некто Некто Нектович', N'kidalovo@yandex.ru', N'9856666666', N'Неизвестность', N'3213132134', 8)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 

INSERT [dbo].[PartnerType] ([ID], [typeName]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerType] ([ID], [typeName]) VALUES (2, N'ООО')
INSERT [dbo].[PartnerType] ([ID], [typeName]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnerType] ([ID], [typeName]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [productTypeID], [productName], [artikul], [minCountForPartner]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [productTypeID], [productName], [artikul], [minCountForPartner]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [productTypeID], [productName], [artikul], [minCountForPartner]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [productTypeID], [productName], [artikul], [minCountForPartner]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [productTypeID], [productName], [artikul], [minCountForPartner]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductType] ([ID], [productsType], [kfTypeProducts]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[ProductType] ([ID], [productsType], [kfTypeProducts]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[ProductType] ([ID], [productsType], [kfTypeProducts]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[ProductType] ([ID], [productsType], [kfTypeProducts]) VALUES (4, N'Пробковое покрытие', 1.5)
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK__PartnerPr__partn__4222D4EF] FOREIGN KEY([partnerID])
REFERENCES [dbo].[Partners] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK__PartnerPr__partn__4222D4EF]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK__PartnerPr__produ__412EB0B6] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK__PartnerPr__produ__412EB0B6]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD FOREIGN KEY([partnerTypeID])
REFERENCES [dbo].[PartnerType] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__product__3E52440B] FOREIGN KEY([productTypeID])
REFERENCES [dbo].[ProductType] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__product__3E52440B]
GO
USE [master]
GO
ALTER DATABASE [Master_Pol] SET  READ_WRITE 
GO
