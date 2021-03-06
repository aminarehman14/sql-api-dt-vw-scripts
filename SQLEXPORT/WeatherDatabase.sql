USE [master]
GO
/****** Object:  Database [WeatherDatabase]    Script Date: 5/19/2021 9:52:06 AM ******/
CREATE DATABASE [WeatherDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeatherDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WeatherDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WeatherDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WeatherDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WeatherDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeatherDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeatherDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeatherDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeatherDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeatherDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeatherDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeatherDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeatherDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeatherDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeatherDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeatherDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeatherDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeatherDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeatherDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeatherDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeatherDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeatherDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeatherDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeatherDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeatherDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeatherDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeatherDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeatherDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeatherDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WeatherDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [WeatherDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeatherDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeatherDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeatherDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WeatherDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WeatherDatabase] SET QUERY_STORE = OFF
GO
USE [WeatherDatabase]
GO
/****** Object:  Schema [Weather]    Script Date: 5/19/2021 9:52:07 AM ******/
CREATE SCHEMA [Weather]
GO
/****** Object:  Table [Weather].[Coord]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Weather].[Coord](
	[id_pk] [int] IDENTITY(1,1) NOT NULL,
	[refNum] [int] NOT NULL,
	[lat] [nvarchar](50) NULL,
	[long] [nvarchar](50) NULL,
 CONSTRAINT [PK_Coord] PRIMARY KEY CLUSTERED 
(
	[id_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Weather].[List]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Weather].[List](
	[id_pk] [int] IDENTITY(1,1) NOT NULL,
	[refNum] [int] NULL,
	[list_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[dt] [nvarchar](50) NULL,
	[country] [nvarchar](250) NULL,
 CONSTRAINT [PK_List] PRIMARY KEY CLUSTERED 
(
	[id_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Weather].[Main]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Weather].[Main](
	[id_pk] [int] IDENTITY(1,1) NOT NULL,
	[refNum] [int] NOT NULL,
	[temp] [nvarchar](25) NULL,
	[feels_like] [nvarchar](25) NULL,
	[temp_min] [nvarchar](25) NULL,
	[temp_max] [nvarchar](25) NULL,
	[pressure] [nvarchar](25) NULL,
	[humidity] [nvarchar](25) NULL,
 CONSTRAINT [PK_Main] PRIMARY KEY CLUSTERED 
(
	[id_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Weather].[Root]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Weather].[Root](
	[id_pk] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](50) NULL,
	[cod] [nvarchar](50) NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_Root] PRIMARY KEY CLUSTERED 
(
	[id_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Weather].[Weather]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Weather].[Weather](
	[id_pk] [int] IDENTITY(1,1) NOT NULL,
	[refNum] [int] NOT NULL,
	[weather_id] [int] NULL,
	[main] [nvarchar](2500) NULL,
	[description] [nvarchar](2500) NULL,
	[icon] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Weather] PRIMARY KEY CLUSTERED 
(
	[id_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Weather].[Wind]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Weather].[Wind](
	[id_pk] [int] IDENTITY(1,1) NOT NULL,
	[refNum] [int] NOT NULL,
	[speed] [nvarchar](50) NULL,
	[deg] [int] NULL,
 CONSTRAINT [PK_Wind] PRIMARY KEY CLUSTERED 
(
	[id_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Weather].[Coord]  WITH CHECK ADD  CONSTRAINT [FK__Coord__refNum__4BAC3F29] FOREIGN KEY([refNum])
REFERENCES [Weather].[List] ([id_pk])
GO
ALTER TABLE [Weather].[Coord] CHECK CONSTRAINT [FK__Coord__refNum__4BAC3F29]
GO
ALTER TABLE [Weather].[List]  WITH CHECK ADD  CONSTRAINT [FK__List__refNum__5441852A] FOREIGN KEY([refNum])
REFERENCES [Weather].[Root] ([id_pk])
GO
ALTER TABLE [Weather].[List] CHECK CONSTRAINT [FK__List__refNum__5441852A]
GO
ALTER TABLE [Weather].[Main]  WITH CHECK ADD  CONSTRAINT [FK__Main__refNum__4CA06362] FOREIGN KEY([refNum])
REFERENCES [Weather].[List] ([id_pk])
GO
ALTER TABLE [Weather].[Main] CHECK CONSTRAINT [FK__Main__refNum__4CA06362]
GO
ALTER TABLE [Weather].[Weather]  WITH CHECK ADD  CONSTRAINT [FK__Weather__refNum__4E88ABD4] FOREIGN KEY([refNum])
REFERENCES [Weather].[List] ([id_pk])
GO
ALTER TABLE [Weather].[Weather] CHECK CONSTRAINT [FK__Weather__refNum__4E88ABD4]
GO
ALTER TABLE [Weather].[Wind]  WITH CHECK ADD  CONSTRAINT [FK__Wind__refNum__4D94879B] FOREIGN KEY([refNum])
REFERENCES [Weather].[List] ([id_pk])
GO
ALTER TABLE [Weather].[Wind] CHECK CONSTRAINT [FK__Wind__refNum__4D94879B]
GO
/****** Object:  StoredProcedure [Weather].[GetWeatherData]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Weather].[GetWeatherData] @lat nvarchar(50),  @lon nvarchar(50), @count nvarchar(50), @ResponseText varchar(8000) OUTPUT
as 

DECLARE @URL NVARCHAR(MAX) = 'http://api.openweathermap.org/data/2.5/find?lat='+@lat+'&lon='+@lon+'&cnt='+@count+'&appid=9e1682bbea28fc8a3465ba65eefe75a3';
Declare @Object as Int;
Declare @list NVARCHAR(MAX)


Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'get',
       @URL,
       'False'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT
return 0 
GO
/****** Object:  StoredProcedure [Weather].[usp_InsertCoord]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [Weather].[usp_InsertCoord] 
(
	@refNum int,  
	@lat nvarchar(50), 
	@lon nvarchar(50), 
	@err_msg varchar(512) = null OUTPUT
) 
AS 
BEGIN 

	set nocount on 
	--
	--LOCAL STORAGE
	---
	DECLARE @pc				int -- debugging var
	DECLARE @newid			int = 0 
	declare @this			varchar(128) -- error logging 
	select @this =			object_name(@@procid) 
	select @err_msg =		'' 
	---
	--add record
	--- 
	select @pc = 101 
	begin try 
		INSERT INTO [Weather].[Coord]
           ([refNum]
           ,[lat]
           ,[long]
		   ) 
		VALUES
		(
		@refNum
		,@lat
		,@lon
		)
		select @newid = SCOPE_IDENTITY()
	end try 
	begin catch 
		select @err_msg = concat(@this, 'Error inserting Weather.Coord : ', error_message(), ' Line ', error_line()) 
		return -@pc 
	end catch


	return @newid
END 
GO
/****** Object:  StoredProcedure [Weather].[usp_InsertList]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [Weather].[usp_InsertList] 
(
	@refNum int,  
	@list_id nvarchar(50), 
	@name nvarchar(50), 
	@dt nvarchar(50), 
	@country nvarchar(50), 
	@err_msg varchar(512) = null OUTPUT
) 
AS 
BEGIN 

	set nocount on 
	--
	--LOCAL STORAGE
	---
	DECLARE @pc				int -- debugging var
	DECLARE @newid			int = 0 
	declare @this			varchar(128) -- error logging 
	select @this =			object_name(@@procid) 
	select @err_msg =		'' 
	---
	--add record
	--- 
	select @pc = 101 
	begin try 
		INSERT INTO [Weather].[List]
           ([refNum]
           ,[list_id]
           ,[name]
           ,[dt]
           ,[country])
     VALUES
		(
		@refNum
		,@list_id
		,@name
		,@dt
		,@country
		)
		select @newid = SCOPE_IDENTITY()
	end try 
	begin catch 
		select @err_msg = concat(@this, 'Error inserting Weather.Root : ', error_message(), ' Line ', error_line()) 
		return -@pc 
	end catch


	return @newid
END 
GO
/****** Object:  StoredProcedure [Weather].[usp_InsertMain]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [Weather].[usp_InsertMain] 
(
	@refNum int,  
	@temp nvarchar(25), 
	@feels_like nvarchar(25), 
	@temp_min nvarchar(25), 
	@temp_max nvarchar(25), 
	@pressure nvarchar(25), 
	@humidity nvarchar(25), 
	@err_msg varchar(512) = null OUTPUT
) 
AS 
BEGIN 

	set nocount on 
	--
	--LOCAL STORAGE
	---
	DECLARE @pc				int -- debugging var
	DECLARE @newid			int = 0 
	declare @this			varchar(128) -- error logging 
	select @this =			object_name(@@procid) 
	select @err_msg =		'' 
	---
	--add record
	--- 
	select @pc = 101 
	begin try 
		INSERT INTO [Weather].[Main]
           ([refNum]
           ,[temp]
           ,[feels_like]
           ,[temp_min]
           ,[temp_max]
           ,[pressure]
           ,[humidity])
     VALUES
		(
		@refNum
		,@temp
		,@feels_like
		,@temp_min
		,@temp_max
		,@pressure
		,@humidity
		)
		select @newid = SCOPE_IDENTITY()
	end try 
	begin catch 
		select @err_msg = concat(@this, 'Error inserting Weather.Main : ', error_message(), ' Line ', error_line()) 
		return -@pc 
	end catch


	return @newid
END 
GO
/****** Object:  StoredProcedure [Weather].[usp_InsertRoot]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [Weather].[usp_InsertRoot] 
(
	@message nvarchar(50),  
	@cod nvarchar(50), 
	@count nvarchar(50), 
	@err_msg varchar(512) = null OUTPUT
) 
AS 
BEGIN 

	set nocount on 
	--
	--LOCAL STORAGE
	---
	DECLARE @pc				int -- debugging var
	DECLARE @newid			int = 0 
	declare @this			varchar(128) -- error logging 
	select @this =			object_name(@@procid) 
	select @err_msg =		'' 
	---
	--add record
	--- 
	select @pc = 101 
	begin try 
		INSERT INTO [Weather].[Root]
           ([message]
           ,[cod]
           ,[count])
     VALUES 
		(
		@message
		,@cod
		,@count
		)
		select @newid = SCOPE_IDENTITY()
	end try 
	begin catch 
		select @err_msg = concat(@this, 'Error inserting Weather.Root : ', error_message(), ' Line ', error_line()) 
		return -@pc 
	end catch


	return @newid
END 
GO
/****** Object:  StoredProcedure [Weather].[usp_InsertWeather]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [Weather].[usp_InsertWeather] 
(
	@refNum int,  
	@weather_id int, 
	@main nvarchar(2500), 
	@description nvarchar(2500), 
	@icon nvarchar(4000), 
	@err_msg varchar(512) = null OUTPUT
) 
AS 
BEGIN 

	set nocount on 
	--
	--LOCAL STORAGE
	---
	DECLARE @pc				int -- debugging var
	DECLARE @newid			int = 0 
	declare @this			varchar(128) -- error logging 
	select @this =			object_name(@@procid) 
	select @err_msg =		'' 
	---
	--add record
	--- 
	select @pc = 101 
	begin try 
		INSERT INTO [Weather].[Weather]
           ([refNum]
           ,[weather_id]
           ,[main]
           ,[description]
           ,[icon])
     VALUES
		(
		@refNum
        ,@weather_id
        ,@main
        ,@description
        ,@icon
		)
		select @newid = SCOPE_IDENTITY()
	end try 
	begin catch 
		select @err_msg = concat(@this, 'Error inserting Weather.Weather : ', error_message(), ' Line ', error_line()) 
		return -@pc 
	end catch


	return @newid
END 
GO
/****** Object:  StoredProcedure [Weather].[usp_InsertWind]    Script Date: 5/19/2021 9:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE procedure [Weather].[usp_InsertWind] 
(
	@refNum int,  
	@speed nvarchar(50), 
	@deg int, 
	@err_msg varchar(512) = null OUTPUT
) 
AS 
BEGIN 

	set nocount on 
	--
	--LOCAL STORAGE
	---
	DECLARE @pc				int -- debugging var
	DECLARE @newid			int = 0 
	declare @this			varchar(128) -- error logging 
	select @this =			object_name(@@procid) 
	select @err_msg =		'' 
	---
	--add record
	--- 
	select @pc = 101 
	begin try 
		INSERT INTO [Weather].[Wind]
           ([refNum]
           ,[speed]
           ,[deg])
     VALUES
		(
		@refNum
        ,@speed
        ,@deg
		)
		select @newid = SCOPE_IDENTITY()
	end try 
	begin catch 
		select @err_msg = concat(@this, 'Error inserting Weather.Wind : ', error_message(), ' Line ', error_line()) 
		return -@pc 
	end catch


	return @newid
END 
GO
USE [master]
GO
ALTER DATABASE [WeatherDatabase] SET  READ_WRITE 
GO
