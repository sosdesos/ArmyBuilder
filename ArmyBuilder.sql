USE [master]
GO
/****** Object:  Database [ArmyBuilder]    Script Date: 10/14/2019 3:12:46 PM ******/
CREATE DATABASE [ArmyBuilder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CampaignTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CampaignTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CampaignTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CampaignTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ArmyBuilder] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArmyBuilder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArmyBuilder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArmyBuilder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArmyBuilder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArmyBuilder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArmyBuilder] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArmyBuilder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArmyBuilder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArmyBuilder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArmyBuilder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArmyBuilder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArmyBuilder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArmyBuilder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArmyBuilder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArmyBuilder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArmyBuilder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArmyBuilder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArmyBuilder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArmyBuilder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArmyBuilder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArmyBuilder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArmyBuilder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArmyBuilder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArmyBuilder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ArmyBuilder] SET  MULTI_USER 
GO
ALTER DATABASE [ArmyBuilder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArmyBuilder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArmyBuilder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArmyBuilder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ArmyBuilder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ArmyBuilder] SET QUERY_STORE = OFF
GO
USE [ArmyBuilder]
GO
/****** Object:  Table [dbo].[Armies]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armies](
	[ArmyID] [int] IDENTITY(1,1) NOT NULL,
	[ArmyName] [nvarchar](200) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Armies] PRIMARY KEY CLUSTERED 
(
	[ArmyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArmyModels]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArmyModels](
	[ArmyID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
 CONSTRAINT [PK_ArmyModels] PRIMARY KEY CLUSTERED 
(
	[ArmyID] ASC,
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factions]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factions](
	[FactionID] [int] IDENTITY(1,1) NOT NULL,
	[FactionName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Factions] PRIMARY KEY CLUSTERED 
(
	[FactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [nvarchar](200) NOT NULL,
	[FactionID] [int] NULL,
	[JackPoints] [int] NULL,
	[PointCost] [int] NULL,
	[FullCrewPointCost] [int] NULL,
	[AttachesToModelID] [int] NULL,
	[FieldAllowence] [int] NULL,
	[WillWorkWith] [int] NULL,
	[Speed] [int] NULL,
	[MAT] [int] NULL,
	[RAT] [int] NULL,
	[DEF] [int] NULL,
	[ARM] [int] NULL,
	[RangedRNG1] [nvarchar](200) NULL,
	[RangedRNG2] [nvarchar](200) NULL,
	[ROF1] [int] NULL,
	[ROF2] [int] NULL,
	[AOE1] [int] NULL,
	[AOE2] [int] NULL,
	[RangedPOW1] [int] NULL,
	[RangedPOW2] [int] NULL,
	[MeleeRNG1] [int] NULL,
	[MeleeRNG2] [int] NULL,
	[MeleePOW1] [int] NULL,
	[MeleePOW2] [int] NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[RoleID] [int] NULL,
	[Hash] [nvarchar](200) NULL,
	[Salt] [nvarchar](200) NULL,
	[EmailAdress] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_EmailAdress]    Script Date: 10/14/2019 3:12:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_EmailAdress] ON [dbo].[Users]
(
	[EmailAdress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_UserName]    Script Date: 10/14/2019 3:12:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Armies]  WITH CHECK ADD  CONSTRAINT [FK_Armies_Users1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Armies] CHECK CONSTRAINT [FK_Armies_Users1]
GO
ALTER TABLE [dbo].[ArmyModels]  WITH CHECK ADD  CONSTRAINT [FK_ArmyModels_Armies] FOREIGN KEY([ArmyID])
REFERENCES [dbo].[Armies] ([ArmyID])
GO
ALTER TABLE [dbo].[ArmyModels] CHECK CONSTRAINT [FK_ArmyModels_Armies]
GO
ALTER TABLE [dbo].[ArmyModels]  WITH CHECK ADD  CONSTRAINT [FK_ArmyModels_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[ArmyModels] CHECK CONSTRAINT [FK_ArmyModels_Models]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Factions] FOREIGN KEY([FactionID])
REFERENCES [dbo].[Factions] ([FactionID])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Factions]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Models] FOREIGN KEY([AttachesToModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Models]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[RoleCreate]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[RoleCreate]
-- this returns the RoleID as return value
@RoleName nvarchar(200)
as
begin
  declare @data int
  insert into roles (RoleName) values (@RoleName)
 
  SELECT	'Return Value' = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[RoleDelete]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleDelete]	
@RoleID int
as
begin
delete from Roles
where RoleID = @RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[RoleFindByID]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleFindByID]
@roleID int
as
begin
	select RoleID, RoleName from Roles
	where RoleID = @RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[RolesGetAll]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RolesGetAll]
@skip int,
@take int
as
begin
	select RoleID, RoleName from Roles 
	order by RoleID
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[RolesObtainCount]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RolesObtainCount]
as
begin
	select count(*) from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[RoleUpdate]    Script Date: 10/14/2019 3:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RoleUpdate]
@RoleID   int, 
@RoleName nvarchar(200)
as
begin
	update Roles set RoleName = @Rolename
	where  RoleID = @RoleID
end
GO
USE [master]
GO
ALTER DATABASE [ArmyBuilder] SET  READ_WRITE 
GO
