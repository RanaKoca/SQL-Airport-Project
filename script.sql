USE [master]
GO
/****** Object:  Database [RanaAir]    Script Date: 13/06/2024 18:50:14 ******/
CREATE DATABASE [RanaAir]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RanaAir', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RanaAir.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RanaAir_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RanaAir_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RanaAir] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RanaAir].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RanaAir] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RanaAir] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RanaAir] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RanaAir] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RanaAir] SET ARITHABORT OFF 
GO
ALTER DATABASE [RanaAir] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RanaAir] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RanaAir] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RanaAir] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RanaAir] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RanaAir] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RanaAir] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RanaAir] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RanaAir] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RanaAir] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RanaAir] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RanaAir] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RanaAir] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RanaAir] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RanaAir] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RanaAir] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RanaAir] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RanaAir] SET RECOVERY FULL 
GO
ALTER DATABASE [RanaAir] SET  MULTI_USER 
GO
ALTER DATABASE [RanaAir] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RanaAir] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RanaAir] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RanaAir] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RanaAir] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RanaAir] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RanaAir', N'ON'
GO
ALTER DATABASE [RanaAir] SET QUERY_STORE = ON
GO
ALTER DATABASE [RanaAir] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RanaAir]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] NOT NULL,
	[Ad] [varchar](50) NULL,
	[Soyad] [varchar](50) NULL,
	[DogumTarihi] [date] NULL,
	[Cinsiyet] [varchar](10) NULL,
	[Telefon] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Adres] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalismaSaatleri]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalismaSaatleri](
	[CalismaID] [int] NOT NULL,
	[PersonelID] [int] NULL,
	[BaslangicSaat] [time](7) NULL,
	[BitisSaat] [time](7) NULL,
	[Gun] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CalismaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_PersonelCalisma]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PersonelCalisma] AS
SELECT p.PersonelID, p.Ad, p.Soyad, c.BaslangicSaat, c.BitisSaat, c.Gun
FROM Personel p
INNER JOIN CalismaSaatleri c ON p.PersonelID = c.PersonelID;
GO
/****** Object:  Table [dbo].[HavaalaniBilgileri]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HavaalaniBilgileri](
	[HavaalaniID] [int] NOT NULL,
	[HavaalaniAdi] [varchar](50) NULL,
	[Sehir] [varchar](50) NULL,
	[Ulke] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[HavaalaniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HavaDurumuRaporlari]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HavaDurumuRaporlari](
	[RaporID] [int] NOT NULL,
	[Tarih] [datetime] NULL,
	[Durum] [varchar](50) NULL,
	[Sicaklik] [int] NULL,
	[NemOrani] [int] NULL,
	[RuzgarHizi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RaporID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_HavaDurumuHavaalani]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_HavaDurumuHavaalani] AS
SELECT h.RaporID, h.Tarih, h.Durum, h.Sicaklik, h.NemOrani, h.RuzgarHizi, a.HavaalaniAdi, a.Sehir, a.Ulke
FROM HavaDurumuRaporlari h
INNER JOIN HavaalaniBilgileri a ON h.RaporID = a.HavaalaniID;
GO
/****** Object:  Table [dbo].[YolcuBilgileri]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YolcuBilgileri](
	[YolcuID] [int] NOT NULL,
	[UcusID] [int] NULL,
	[Ad] [varchar](50) NULL,
	[Soyad] [varchar](50) NULL,
	[KoltukNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[YolcuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_HavaalaniYolcu]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_HavaalaniYolcu] AS
SELECT h.HavaalaniID, h.HavaalaniAdi, h.Sehir, h.Ulke, y.YolcuID, y.Ad, y.Soyad
FROM HavaalaniBilgileri h
INNER JOIN YolcuBilgileri y ON h.HavaalaniID = y.UcusID;
GO
/****** Object:  Table [dbo].[Gorevler]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gorevler](
	[GorevID] [int] NOT NULL,
	[GorevAdi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GorevID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HavaalaniSunucusu]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HavaalaniSunucusu](
	[UcusID] [int] NOT NULL,
	[YolcuID] [int] NOT NULL,
	[HavaalaniID] [int] NOT NULL,
	[PersonelID] [int] NOT NULL,
	[CalismaID] [int] NOT NULL,
	[GorevID] [int] NOT NULL,
	[MaasID] [int] NOT NULL,
	[KontrolorID] [int] NOT NULL,
	[RaporID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UcusID] ASC,
	[YolcuID] ASC,
	[HavaalaniID] ASC,
	[PersonelID] ASC,
	[CalismaID] ASC,
	[GorevID] ASC,
	[MaasID] ASC,
	[KontrolorID] ASC,
	[RaporID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maaslar]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maaslar](
	[MaasID] [int] NOT NULL,
	[PersonelID] [int] NULL,
	[MaasMiktari] [decimal](10, 2) NULL,
	[MaasTarihi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrafikBilgisi]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrafikBilgisi](
	[UcusID] [int] NOT NULL,
	[KalkisYeri] [varchar](50) NULL,
	[VarisYeri] [varchar](50) NULL,
	[KalkisTarihi] [datetime] NULL,
	[VarisTarihi] [datetime] NULL,
	[KontrolorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UcusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrafikKontrolorleri]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrafikKontrolorleri](
	[KontrolorID] [int] NOT NULL,
	[Ad] [varchar](50) NULL,
	[Soyad] [varchar](50) NULL,
	[Pozisyon] [varchar](50) NULL,
	[Departman] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[KontrolorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UcusBilgileri]    Script Date: 13/06/2024 18:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UcusBilgileri](
	[UcusID] [int] NOT NULL,
	[KalkisYeri] [varchar](50) NULL,
	[VarisYeri] [varchar](50) NULL,
	[UcakModeli] [varchar](50) NULL,
	[YolcuKapasitesi] [int] NULL,
	[GecikmeSuresi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UcusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (1, 1, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Pazartesi')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (2, 2, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Sali')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (3, 3, CAST(N'07:30:00' AS Time), CAST(N'16:30:00' AS Time), N'Çarsamba')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (4, 4, CAST(N'08:30:00' AS Time), CAST(N'17:30:00' AS Time), N'Persembe')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (5, 5, CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Cuma')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (6, 6, CAST(N'07:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Cumartesi')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (7, 7, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Pazar')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (8, 8, CAST(N'09:30:00' AS Time), CAST(N'18:30:00' AS Time), N'Pazartesi')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (9, 9, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Sali')
INSERT [dbo].[CalismaSaatleri] ([CalismaID], [PersonelID], [BaslangicSaat], [BitisSaat], [Gun]) VALUES (10, 10, CAST(N'07:30:00' AS Time), CAST(N'16:30:00' AS Time), N'Çarsamba')
GO
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (1, N'Pilot')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (2, N'Kabin Görevlisi')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (3, N'Güvenlik')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (4, N'Gise Görevlisi')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (5, N'Temizlik Görevlisi')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (6, N'Pilot')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (7, N'Kabin Görevlisi')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (8, N'Güvenlik')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (9, N'Gise Görevlisi')
INSERT [dbo].[Gorevler] ([GorevID], [GorevAdi]) VALUES (10, N'Temizlik Görevlisi')
GO
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (1, N'Esenboga Havalimani', N'Ankara', N'Türkiye')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (2, N'Istanbul Havalimani', N'Istanbul', N'Türkiye')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (3, N'Charles de Gaulle Havalimani', N'Paris', N'Fransa')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (4, N'John F. Kennedy Uluslararasi Havalimani', N'New York', N'ABD')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (5, N'Narita Uluslararasi Havalimani', N'Tokyo', N'Japonya')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (6, N'Heathrow Havalimani', N'Londra', N'Ingiltere')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (7, N'Dubai Uluslararasi Havalimani', N'Dubai', N'Birlesik Arap Emirlikleri')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (8, N'Sheremetyevo Uluslararasi Havalimani', N'Moskova', N'Rusya')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (9, N'Sydney Havalimani', N'Sydney', N'Avustralya')
INSERT [dbo].[HavaalaniBilgileri] ([HavaalaniID], [HavaalaniAdi], [Sehir], [Ulke]) VALUES (10, N'Cairo Uluslararasi Havalimani', N'Kahire', N'Misir')
GO
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (1, CAST(N'2023-03-01T08:00:00.000' AS DateTime), N'Günesli', 22, 65, 10)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (2, CAST(N'2023-03-01T10:00:00.000' AS DateTime), N'Parçali Bulutlu', 18, 70, 15)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (3, CAST(N'2023-03-01T12:00:00.000' AS DateTime), N'Yagmurlu', 14, 80, 20)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (4, CAST(N'2023-03-01T14:00:00.000' AS DateTime), N'Karli', 0, 90, 5)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (5, CAST(N'2023-03-01T16:00:00.000' AS DateTime), N'Firtinali', 25, 75, 30)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (6, CAST(N'2023-03-02T08:00:00.000' AS DateTime), N'Bulutlu', 20, 60, 12)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (7, CAST(N'2023-03-02T10:00:00.000' AS DateTime), N'Günesli', 24, 55, 18)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (8, CAST(N'2023-03-02T12:00:00.000' AS DateTime), N'Parçali Bulutlu', 17, 68, 25)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (9, CAST(N'2023-03-02T14:00:00.000' AS DateTime), N'Yagmurlu', 13, 78, 22)
INSERT [dbo].[HavaDurumuRaporlari] ([RaporID], [Tarih], [Durum], [Sicaklik], [NemOrani], [RuzgarHizi]) VALUES (10, CAST(N'2023-03-02T16:00:00.000' AS DateTime), N'Rüzgarli', 19, 72, 28)
GO
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (1, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (2, 2, CAST(4500.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (3, 3, CAST(5500.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (4, 4, CAST(4800.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (5, 5, CAST(5200.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (6, 6, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (7, 7, CAST(5100.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (8, 8, CAST(4700.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (9, 9, CAST(5300.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [MaasMiktari], [MaasTarihi]) VALUES (10, 10, CAST(4600.00 AS Decimal(10, 2)), CAST(N'2023-01-31' AS Date))
GO
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (1, N'Ahmet', N'Yilmaz', CAST(N'1990-05-15' AS Date), N'Erkek', N'555-1234', N'ahmet.yilmaz@email.com', N'Istanbul')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (2, N'Ayse', N'Kaya', CAST(N'1985-08-20' AS Date), N'Kadin', N'555-5678', N'ayse.kaya@email.com', N'Ankara')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (3, N'Mustafa', N'Demir', CAST(N'1992-03-10' AS Date), N'Erkek', N'555-9876', N'mustafa.demir@email.com', N'Izmir')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (4, N'Zeynep', N'Çelik', CAST(N'1988-12-05' AS Date), N'Kadin', N'555-6543', N'zeynep.celik@email.com', N'Adana')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (5, N'Emre', N'Yildirim', CAST(N'1995-06-25' AS Date), N'Erkek', N'555-2345', N'emre.yildirim@email.com', N'Bursa')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (6, N'Fatma', N'Sahin', CAST(N'1983-09-14' AS Date), N'Kadin', N'555-8765', N'fatma.sahin@email.com', N'Antalya')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (7, N'Mehmet', N'Aydin', CAST(N'1991-02-28' AS Date), N'Erkek', N'555-5432', N'mehmet.aydin@email.com', N'Eskisehir')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (8, N'Seda', N'Tekin', CAST(N'1987-11-07' AS Date), N'Kadin', N'555-4321', N'seda.tekin@email.com', N'Trabzon')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (9, N'Yasin', N'Aktas', CAST(N'1994-07-18' AS Date), N'Erkek', N'555-7890', N'yasin.aktas@email.com', N'Gaziantep')
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [DogumTarihi], [Cinsiyet], [Telefon], [Email], [Adres]) VALUES (10, N'Elif', N'Koç', CAST(N'1986-04-03' AS Date), N'Kadin', N'555-2109', N'elif.koc@email.com', N'Konya')
GO
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (1, N'IST', N'ANK', CAST(N'2023-03-01T08:00:00.000' AS DateTime), CAST(N'2023-03-01T10:00:00.000' AS DateTime), 1)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (2, N'ADA', N'ESB', CAST(N'2023-03-01T09:30:00.000' AS DateTime), CAST(N'2023-03-01T11:30:00.000' AS DateTime), 2)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (3, N'IST', N'ADB', CAST(N'2023-03-01T11:00:00.000' AS DateTime), CAST(N'2023-03-01T13:00:00.000' AS DateTime), 3)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (4, N'AYT', N'IST', CAST(N'2023-03-01T12:30:00.000' AS DateTime), CAST(N'2023-03-01T14:30:00.000' AS DateTime), 4)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (5, N'ESB', N'TRN', CAST(N'2023-03-01T14:00:00.000' AS DateTime), CAST(N'2023-03-01T16:00:00.000' AS DateTime), 5)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (6, N'ADB', N'LHR', CAST(N'2023-03-01T15:30:00.000' AS DateTime), CAST(N'2023-03-01T17:30:00.000' AS DateTime), 6)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (7, N'IST', N'CDG', CAST(N'2023-03-01T17:00:00.000' AS DateTime), CAST(N'2023-03-01T19:00:00.000' AS DateTime), 7)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (8, N'SAW', N'FRA', CAST(N'2023-03-01T18:30:00.000' AS DateTime), CAST(N'2023-03-01T20:30:00.000' AS DateTime), 8)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (9, N'IST', N'AMS', CAST(N'2023-03-01T20:00:00.000' AS DateTime), CAST(N'2023-03-01T22:00:00.000' AS DateTime), 9)
INSERT [dbo].[TrafikBilgisi] ([UcusID], [KalkisYeri], [VarisYeri], [KalkisTarihi], [VarisTarihi], [KontrolorID]) VALUES (10, N'ESB', N'MAD', CAST(N'2023-03-01T21:30:00.000' AS DateTime), CAST(N'2023-03-01T23:30:00.000' AS DateTime), 10)
GO
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (1, N'Ahmet', N'Yilmaz', N'Bas Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (2, N'Ayse', N'Kaya', N'Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (3, N'Mehmet', N'Demir', N'Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (4, N'Zeynep', N'Çelik', N'Bas Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (5, N'Emre', N'Yildirim', N'Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (6, N'Fatma', N'Sahin', N'Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (7, N'Mustafa', N'Aydin', N'Bas Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (8, N'Seda', N'Tekin', N'Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (9, N'Yasin', N'Aktas', N'Kontrolör', N'Hava Trafik Kontrol')
INSERT [dbo].[TrafikKontrolorleri] ([KontrolorID], [Ad], [Soyad], [Pozisyon], [Departman]) VALUES (10, N'Elif', N'Koç', N'Bas Kontrolör', N'Hava Trafik Kontrol')
GO
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (1, N'Ankara', N'Istanbul', N'Boeing 737', 150, 0)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (2, N'Istanbul', N'Paris', N'Airbus A320', 180, 30)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (3, N'New York', N'Los Angeles', N'Boeing 777', 300, 15)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (4, N'Tokyo', N'Seoul', N'Airbus A350', 250, 5)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (5, N'London', N'Berlin', N'Boeing 767', 200, 10)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (6, N'Dubai', N'Riyadh', N'Airbus A330', 220, 0)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (7, N'Moscow', N'Beijing', N'Boeing 747', 400, 45)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (8, N'Sydney', N'Auckland', N'Airbus A380', 500, 20)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (9, N'Cairo', N'Johannesburg', N'Boeing 757', 180, 8)
INSERT [dbo].[UcusBilgileri] ([UcusID], [KalkisYeri], [VarisYeri], [UcakModeli], [YolcuKapasitesi], [GecikmeSuresi]) VALUES (10, N'Toronto', N'Vancouver', N'Airbus A319', 160, 12)
GO
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (1, 1, N'Ahmet', N'Yilmaz', 10)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (2, 1, N'Ayse', N'Demir', 15)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (3, 2, N'Mehmet', N'Kaya', 22)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (4, 3, N'Fatma', N'Celik', 5)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (5, 4, N'Can', N'Yuce', 18)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (6, 5, N'Zeynep', N'Acar', 7)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (7, 6, N'Omer', N'Turan', 14)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (8, 7, N'Elif', N'Erdem', 30)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (9, 8, N'Burak', N'Koc', 25)
INSERT [dbo].[YolcuBilgileri] ([YolcuID], [UcusID], [Ad], [Soyad], [KoltukNo]) VALUES (10, 9, N'Gul', N'Aydin', 12)
GO
ALTER TABLE [dbo].[CalismaSaatleri]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([CalismaID])
REFERENCES [dbo].[CalismaSaatleri] ([CalismaID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([GorevID])
REFERENCES [dbo].[Gorevler] ([GorevID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([HavaalaniID])
REFERENCES [dbo].[HavaalaniBilgileri] ([HavaalaniID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([KontrolorID])
REFERENCES [dbo].[TrafikKontrolorleri] ([KontrolorID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([MaasID])
REFERENCES [dbo].[Maaslar] ([MaasID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([RaporID])
REFERENCES [dbo].[HavaDurumuRaporlari] ([RaporID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([UcusID])
REFERENCES [dbo].[UcusBilgileri] ([UcusID])
GO
ALTER TABLE [dbo].[HavaalaniSunucusu]  WITH CHECK ADD FOREIGN KEY([YolcuID])
REFERENCES [dbo].[YolcuBilgileri] ([YolcuID])
GO
ALTER TABLE [dbo].[Maaslar]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[TrafikBilgisi]  WITH CHECK ADD FOREIGN KEY([KontrolorID])
REFERENCES [dbo].[TrafikKontrolorleri] ([KontrolorID])
GO
ALTER TABLE [dbo].[TrafikBilgisi]  WITH CHECK ADD  CONSTRAINT [FK_TrafikBilgisi_UcusBilgileri] FOREIGN KEY([UcusID])
REFERENCES [dbo].[UcusBilgileri] ([UcusID])
GO
ALTER TABLE [dbo].[TrafikBilgisi] CHECK CONSTRAINT [FK_TrafikBilgisi_UcusBilgileri]
GO
ALTER TABLE [dbo].[YolcuBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_UcusID] FOREIGN KEY([UcusID])
REFERENCES [dbo].[UcusBilgileri] ([UcusID])
GO
ALTER TABLE [dbo].[YolcuBilgileri] CHECK CONSTRAINT [FK_UcusID]
GO
USE [master]
GO
ALTER DATABASE [RanaAir] SET  READ_WRITE 
GO
