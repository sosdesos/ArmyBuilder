USE [master]
GO
/****** Object:  Database [ArmyBuilder]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  Table [dbo].[Armies]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armies](
	[ArmyID] [int] IDENTITY(1,1) NOT NULL,
	[ArmyName] [nvarchar](200) NULL,
	[UserID] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[FactionID] [int] NULL,
 CONSTRAINT [PK_Armies] PRIMARY KEY CLUSTERED 
(
	[ArmyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArmyModels]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArmyModels](
	[ArmyID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[FullSquats] [int] NULL,
 CONSTRAINT [PK_ArmyModels] PRIMARY KEY CLUSTERED 
(
	[ArmyID] ASC,
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [nvarchar](250) NULL,
	[Trace] [nvarchar](max) NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factions]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factions](
	[FactionID] [int] IDENTITY(1,1) NOT NULL,
	[FactionName] [nvarchar](200) NULL,
	[BackGround] [nvarchar](max) NULL,
 CONSTRAINT [PK_Factions] PRIMARY KEY CLUSTERED 
(
	[FactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [nvarchar](200) NOT NULL,
	[FactionID] [int] NULL,
	[ModelType] [int] NULL,
	[PointCost] [int] NULL,
	[FullCrewPointCost] [int] NULL,
	[AttachesToModelID] [int] NULL,
	[FieldAllowence] [int] NULL,
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
	[MeleeRNG1] [float] NULL,
	[MeleeRNG2] [float] NULL,
	[MeleePOW1] [int] NULL,
	[MeleePOW2] [int] NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Hash] [nvarchar](200) NULL,
	[Salt] [nvarchar](200) NULL,
	[EmailAdress] [nvarchar](200) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Armies] ON 

INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (1, N'Cain''s Complaint desk', 1, N'(Cat''s Diary)Day ninety six of my captivity. The humans seem to favor the dog as they let him out of the prison multiple times a day. The dumb soul is not bright enough to leave when they do. To my opinion he was the one that snitched to the captors about my attempts to escape. Threatening the captors with small caught animals telling them what I will do to them once i make it into their bedroom when they sleep.  ', 1)
INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (1007, N'magnus', 1, N'No Comments', 6)
INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (1011, N'sorsca and Co', 1, N'testing', 3)
INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (2015, N'not bob', 1026, N'Chapter One
A Stop on the Salt Route
1000 B.C.
As they rounded a bend in the path that ran beside the river, Lara recognized the silhouette of a fig tree atop a nearby hill. The weather was hot and the days were long. The fig tree was in full leaf, but not yet bearing fruit.', 1)
INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (2016, N'reclaimer', 1026, N'test Army', 2)
INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (2022, N'sorsca and Co', 1026, N'bring it', 3)
INSERT [dbo].[Armies] ([ArmyID], [ArmyName], [UserID], [Comments], [FactionID]) VALUES (2028, N'not bob', 1, N'no', 1)
SET IDENTITY_INSERT [dbo].[Armies] OFF
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1, 23, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1, 1031, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1, 1044, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1, 1046, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1, 1049, 2, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1, 1050, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 28, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 29, 2, 1)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1039, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1041, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1077, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1078, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1082, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1083, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1007, 1085, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1011, 19, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (1011, 1061, 2, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2015, 18, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2015, 1044, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2015, 1046, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2016, 8, 2, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2016, 17, 2, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2016, 1032, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2016, 1052, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2016, 1057, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2028, 22, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2028, 1030, 1, 0)
INSERT [dbo].[ArmyModels] ([ArmyID], [ModelID], [Quantity], [FullSquats]) VALUES (2028, 1044, 1, 0)
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1, N'error not found', N'right here', CAST(N'2019-10-30T12:02:38.697' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Users_Roles". The conflict occurred in database "ArmyBuilder", table "dbo.Roles", column ''RoleID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.UserCreate(UserDAL user) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 157
   at BusinessLogicLayer.ContextBLL.UserCreate(UserBLL InputUser) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 70
   at WarcasterPub.Controllers.HomeController.Register(RegisterData NewUser) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 162', CAST(N'2019-10-30T14:56:36.140' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (3, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Users_Roles". The conflict occurred in database "ArmyBuilder", table "dbo.Roles", column ''RoleID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.UserCreate(UserDAL user) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 157
   at BusinessLogicLayer.ContextBLL.UserCreate(UserBLL InputUser) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 70
   at WarcasterPub.Controllers.HomeController.Register(RegisterData NewUser) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 162', CAST(N'2019-10-30T15:05:23.913' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (4, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Users_Roles". The conflict occurred in database "ArmyBuilder", table "dbo.Roles", column ''RoleID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.UserCreate(UserDAL user) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 157
   at BusinessLogicLayer.ContextBLL.UserCreate(UserBLL InputUser) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 70
   at WarcasterPub.Controllers.HomeController.Register(RegisterData NewUser) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 162', CAST(N'2019-10-31T13:30:22.557' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (5, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Users_Roles". The conflict occurred in database "ArmyBuilder", table "dbo.Roles", column ''RoleID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.UserCreate(UserDAL user) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 157
   at BusinessLogicLayer.ContextBLL.UserCreate(UserBLL InputUser) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 70
   at WarcasterPub.Controllers.HomeController.Register(RegisterData NewUser) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 162', CAST(N'2019-10-31T14:19:12.540' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (6, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Users_Roles". The conflict occurred in database "ArmyBuilder", table "dbo.Roles", column ''RoleID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.UserCreate(UserDAL user) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 157
   at BusinessLogicLayer.ContextBLL.UserCreate(UserBLL InputUser) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 70
   at WarcasterPub.Controllers.HomeController.Register(RegisterData NewUser) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 162', CAST(N'2019-10-31T14:19:34.430' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (7, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23', CAST(N'2019-10-31T17:18:42.003' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (8, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23
   at DataAccessLayer.Mapper.CheckOffset(SqlDataReader reader, String ColumnName, Int32 ExpectedOffset) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 39', CAST(N'2019-10-31T17:18:42.003' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (9, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23
   at DataAccessLayer.Mapper.CheckOffset(SqlDataReader reader, String ColumnName, Int32 ExpectedOffset) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 39
   at DataAccessLayer.FactionMapper..ctor(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\FactionMapper.cs:line 18
   at DataAccessLayer.ContextDAL.FactionsGetAll(Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 397', CAST(N'2019-10-31T17:18:42.007' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (10, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23
   at DataAccessLayer.Mapper.CheckOffset(SqlDataReader reader, String ColumnName, Int32 ExpectedOffset) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 39
   at DataAccessLayer.FactionMapper..ctor(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\FactionMapper.cs:line 18
   at DataAccessLayer.ContextDAL.FactionsGetAll(Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 397
   at BusinessLogicLayer.ContextBLL.FactionsGetAll(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 129
   at WarcasterPub.Controllers.FactionsController.Index() in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\FactionsController.cs:line 21', CAST(N'2019-10-31T17:18:42.050' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (11, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23', CAST(N'2019-10-31T17:18:45.463' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (12, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23
   at DataAccessLayer.Mapper.CheckOffset(SqlDataReader reader, String ColumnName, Int32 ExpectedOffset) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 39', CAST(N'2019-10-31T17:18:45.467' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (13, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23
   at DataAccessLayer.Mapper.CheckOffset(SqlDataReader reader, String ColumnName, Int32 ExpectedOffset) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 39
   at DataAccessLayer.FactionMapper..ctor(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\FactionMapper.cs:line 18
   at DataAccessLayer.ContextDAL.FactionsGetAll(Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 397', CAST(N'2019-10-31T17:18:45.467' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (14, N'The FactionName is 1, not 0 as expected', N'   at DataAccessLayer.Mapper.Assert(Boolean condition, String message) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 23
   at DataAccessLayer.Mapper.CheckOffset(SqlDataReader reader, String ColumnName, Int32 ExpectedOffset) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\Mapper.cs:line 39
   at DataAccessLayer.FactionMapper..ctor(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\FactionMapper.cs:line 18
   at DataAccessLayer.ContextDAL.FactionsGetAll(Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 397
   at BusinessLogicLayer.ContextBLL.FactionsGetAll(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 129
   at WarcasterPub.Controllers.FactionsController.Index() in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\FactionsController.cs:line 21', CAST(N'2019-10-31T17:18:45.467' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (15, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-10-31T18:06:52.233' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (16, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmiesController.Create(ArmyBLL NewArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmiesController.cs:line 82', CAST(N'2019-10-31T18:06:52.293' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1002, N'Procedure or function ''ArmyCreate'' expects parameter ''@ArmyName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-10-31T21:16:07.990' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1003, N'Procedure or function ''ArmyCreate'' expects parameter ''@ArmyName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmiesController.Create(ArmyBLL NewArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmiesController.cs:line 82', CAST(N'2019-10-31T21:16:08.023' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1004, N'Procedure or function ''ArmyCreate'' expects parameter ''@ArmyName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-10-31T21:17:39.540' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1005, N'Procedure or function ''ArmyCreate'' expects parameter ''@ArmyName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmiesController.Create(ArmyBLL NewArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmiesController.cs:line 82', CAST(N'2019-10-31T21:17:39.540' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1006, N'Procedure or function ''UserFindByName'' expects parameter ''@UserName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.UserFindByName(String UserName) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 301', CAST(N'2019-10-31T21:58:20.957' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1007, N'Procedure or function ''UserFindByName'' expects parameter ''@UserName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.UserFindByName(String UserName) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 301
   at BusinessLogicLayer.ContextBLL.UserFindByName(String UserName) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 100
   at WarcasterPub.Controllers.HomeController.Login(LoginData LogIn) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 51', CAST(N'2019-10-31T21:58:20.990' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1008, N'Procedure or function ''UserFindByName'' expects parameter ''@UserName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.UserFindByName(String UserName) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 301', CAST(N'2019-10-31T21:58:33.680' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1009, N'Procedure or function ''UserFindByName'' expects parameter ''@UserName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.UserFindByName(String UserName) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 301
   at BusinessLogicLayer.ContextBLL.UserFindByName(String UserName) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 100
   at WarcasterPub.Controllers.HomeController.Login(LoginData LogIn) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\HomeController.cs:line 51', CAST(N'2019-10-31T21:58:33.683' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1010, N'Procedure or function ''ArmyUpdate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyUpdate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 643', CAST(N'2019-10-31T22:29:56.700' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1011, N'Procedure or function ''ArmyUpdate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyUpdate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 643
   at BusinessLogicLayer.ContextBLL.ArmyUpdate(ArmyBLL ArmyToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 210
   at WarcasterPub.Controllers.ArmiesController.Edit(Int32 id, ArmyBLL ArmyToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmiesController.cs:line 121', CAST(N'2019-10-31T22:29:56.723' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1012, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-01T11:46:17.310' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1013, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmiesController.Create(ArmyBLL NewArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmiesController.cs:line 82', CAST(N'2019-11-01T11:46:17.350' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1014, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-01T11:46:27.020' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1015, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmiesController.Create(ArmyBLL NewArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmiesController.cs:line 82', CAST(N'2019-11-01T11:46:27.023' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1016, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354', CAST(N'2019-11-01T11:55:11.213' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1017, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354
   at BusinessLogicLayer.ContextBLL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 115
   at WarcasterPub.Controllers.UsersController.Delete(Int32 id, UserBLL UserToDelete) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\UsersController.cs:line 166', CAST(N'2019-11-01T11:55:11.217' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1018, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354', CAST(N'2019-11-01T11:55:17.433' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1019, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354
   at BusinessLogicLayer.ContextBLL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 115
   at WarcasterPub.Controllers.UsersController.Delete(Int32 id, UserBLL UserToDelete) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\UsersController.cs:line 166', CAST(N'2019-11-01T11:55:17.437' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1020, N'A public action method ''1'' was not found on controller ''WarcasterPub.Controllers.RolesController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-01T16:12:34.527' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1021, N'The controller for path ''/User/MyEEdit'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-02T00:08:01.950' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1022, N'The controller for path ''/User/MyEdit'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-02T00:09:16.170' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1023, N'The controller for path ''/User/MyDetails'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-02T00:09:43.880' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1024, N'A public action method ''MyDelete'' was not found on controller ''WarcasterPub.Controllers.UsersController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-02T00:18:22.003' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1025, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 44', CAST(N'2019-11-03T14:40:36.163' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1026, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 44
   at DataAccessLayer.ContextDAL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 924
   at BusinessLogicLayer.ContextBLL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 277
   at WarcasterPub.Controllers.ArmyModelsController.Details(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 45', CAST(N'2019-11-03T14:40:36.197' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1027, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 44', CAST(N'2019-11-03T14:40:43.333' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1028, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 44
   at DataAccessLayer.ContextDAL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 924
   at BusinessLogicLayer.ContextBLL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 277
   at WarcasterPub.Controllers.ArmyModelsController.Details(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 45', CAST(N'2019-11-03T14:40:43.337' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1029, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 44', CAST(N'2019-11-03T14:50:47.643' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1030, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 44
   at DataAccessLayer.ContextDAL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 924
   at BusinessLogicLayer.ContextBLL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 277
   at WarcasterPub.Controllers.ArmyModelsController.Details(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 45', CAST(N'2019-11-03T14:51:04.940' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1031, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 50', CAST(N'2019-11-03T15:01:56.337' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1032, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 50
   at DataAccessLayer.ContextDAL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 924
   at BusinessLogicLayer.ContextBLL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 277
   at WarcasterPub.Controllers.ArmyModelsController.Details(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 45', CAST(N'2019-11-03T15:01:56.377' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1033, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 50', CAST(N'2019-11-03T15:04:38.763' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1034, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at DataAccessLayer.ArmyModelMapper.ToArmyModel(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ArmyModelMapper.cs:line 50
   at DataAccessLayer.ContextDAL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 924
   at BusinessLogicLayer.ContextBLL.ArmyModelsFindByFactionID(Int32 ArmyID, Int32 FactionID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 277
   at WarcasterPub.Controllers.ArmyModelsController.Details(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 45', CAST(N'2019-11-03T15:04:43.867' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1035, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ArmyModels_Armies". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''ArmyID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyModelRecordCreate(ArmyModelRecordDAL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 898', CAST(N'2019-11-03T16:26:36.330' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1036, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ArmyModels_Armies". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''ArmyID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyModelRecordCreate(ArmyModelRecordDAL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 898
   at BusinessLogicLayer.ContextBLL.ArmyModelRecordCreate(ArmyModelRecordBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 302
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyModelRecordBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 98', CAST(N'2019-11-03T16:26:36.363' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1037, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ArmyModels_Armies". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''ArmyID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyModelRecordCreate(ArmyModelRecordDAL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 898', CAST(N'2019-11-03T16:39:01.080' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1038, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ArmyModels_Armies". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''ArmyID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyModelRecordCreate(ArmyModelRecordDAL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 898
   at BusinessLogicLayer.ContextBLL.ArmyModelRecordCreate(ArmyModelRecordBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 302
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyModelRecordBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 98', CAST(N'2019-11-03T16:39:01.097' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1039, N'Procedure or function ''ArmyUpdate'' expects parameter ''@ArmyName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyUpdate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 643', CAST(N'2019-11-04T11:11:53.317' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1040, N'Procedure or function ''ArmyUpdate'' expects parameter ''@ArmyName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyUpdate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 643
   at BusinessLogicLayer.ContextBLL.ArmyUpdate(ArmyBLL ArmyToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 210
   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id, FullArmyData Army) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 182', CAST(N'2019-11-04T11:11:53.353' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1041, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id, FullArmyData Army) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 185', CAST(N'2019-11-04T11:14:14.927' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1042, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id, FullArmyData Army) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 185', CAST(N'2019-11-04T11:16:33.880' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1043, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ArmyModels_Armies". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''ArmyID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyModelCreate(ArmyModelDAL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 898', CAST(N'2019-11-04T11:37:46.633' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1044, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ArmyModels_Armies". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''ArmyID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ArmyModelCreate(ArmyModelDAL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 898
   at BusinessLogicLayer.ContextBLL.ArmyModelCreate(ArmyModelBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 302
   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id, FullArmyData Army) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 195', CAST(N'2019-11-04T11:37:50.890' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1045, N'The controller for path ''/Logout/Home'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-04T14:28:43.980' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1046, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id, FullArmyData Army) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 185', CAST(N'2019-11-04T19:05:52.730' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1047, N'Procedure or function ArmiesFindByUserID has too many arguments specified.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.ArmiesFindByUserID(Int32 UserID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 617', CAST(N'2019-11-05T08:55:26.900' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1048, N'Procedure or function ArmiesFindByUserID has too many arguments specified.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.ArmiesFindByUserID(Int32 UserID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 617
   at BusinessLogicLayer.ContextBLL.ArmiesFindByUserID(Int32 UserID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 198
   at WarcasterPub.Controllers.ArmyModelsController.MyIndex() in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 46', CAST(N'2019-11-05T08:55:26.930' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1049, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354', CAST(N'2019-11-05T09:27:58.450' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1050, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Armies_Users1". The conflict occurred in database "ArmyBuilder", table "dbo.Armies", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354
   at BusinessLogicLayer.ContextBLL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 115
   at WarcasterPub.Controllers.UsersController.MyDelete(UserBLL Me) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\UsersController.cs:line 289', CAST(N'2019-11-05T09:27:58.493' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1051, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The DELETE statement conflicted with the REFERENCE constraint "FK_ArmyModels_Armies". The confli', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354', CAST(N'2019-11-05T12:08:43.493' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1052, N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The DELETE statement conflicted with the REFERENCE constraint "FK_ArmyModels_Armies". The confli', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 354
   at BusinessLogicLayer.ContextBLL.UserDelete(Int32 UserID) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 115
   at WarcasterPub.Controllers.UsersController.MyDelete(UserBLL Me) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\UsersController.cs:line 289', CAST(N'2019-11-05T12:08:43.497' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1053, N'Procedure or function ArmiesFindByUserID has too many arguments specified.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.ArmiesFindByUserID(Int32 UserID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 617', CAST(N'2019-11-05T14:28:42.010' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1054, N'Procedure or function ArmiesFindByUserID has too many arguments specified.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.ArmiesFindByUserID(Int32 UserID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 617
   at BusinessLogicLayer.ContextBLL.ArmiesFindByUserID(Int32 UserID, Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 198
   at WarcasterPub.Controllers.ArmyModelsController.MyIndex() in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 46', CAST(N'2019-11-05T14:28:47.650' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1055, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-05T16:11:17.803' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1056, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 123', CAST(N'2019-11-05T16:11:17.860' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1057, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-05T16:30:40.103' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1058, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 123', CAST(N'2019-11-05T16:30:40.103' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1059, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-05T16:49:12.847' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1060, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 123', CAST(N'2019-11-05T16:49:12.850' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1061, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-05T16:50:11.367' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1062, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 123', CAST(N'2019-11-05T16:50:11.370' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1063, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515', CAST(N'2019-11-05T16:51:30.490' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (1064, N'Procedure or function ''ArmyCreate'' expects parameter ''@Comments'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.ArmyCreate(ArmyDAL army) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 515
   at BusinessLogicLayer.ContextBLL.ArmyCreate(ArmyBLL InputArmy) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 168
   at WarcasterPub.Controllers.ArmyModelsController.Create(ArmyBLL Record) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 123', CAST(N'2019-11-05T16:51:30.493' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2050, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 170', CAST(N'2019-11-06T16:09:37.860' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2051, N'The controller for path ''/Content/Images/Porpoise'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T16:43:37.773' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2052, N'The controller for path ''/NotFound'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T16:57:57.173' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2053, N'The controller for path ''/NotFound'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T16:58:10.543' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2054, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 158', CAST(N'2019-11-06T16:58:39.593' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2055, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 158', CAST(N'2019-11-06T17:01:20.030' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2056, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 158', CAST(N'2019-11-06T17:02:58.750' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2057, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 158', CAST(N'2019-11-06T17:05:00.900' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2058, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 158', CAST(N'2019-11-06T17:45:21.573' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2059, N'Object reference not set to an instance of an object.', N'   at WarcasterPub.Controllers.ArmyModelsController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\ArmyModelsController.cs:line 158', CAST(N'2019-11-06T17:50:01.730' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2060, N'The controller for path ''/Form'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T21:02:58.360' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2061, N'The controller for path ''/Form'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T21:03:15.323' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2062, N'The controller for path ''/Form'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T21:04:35.950' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2063, N'The controller for path ''/Form'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-06T21:04:50.643' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2064, N'Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index', N'   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at WarcasterPub.Controllers.MiniaturesController.Edit(Int32 id) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\MiniaturesController.cs:line 180', CAST(N'2019-11-06T23:49:20.933' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2065, N'The UPDATE statement conflicted with the FOREIGN KEY SAME TABLE constraint "FK_Models_Models". The conflict occurred in database "ArmyBuilder", table "dbo.Models", column ''ModelID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelUpdate(ModelDAL model) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 859', CAST(N'2019-11-07T00:11:54.093' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2066, N'The UPDATE statement conflicted with the FOREIGN KEY SAME TABLE constraint "FK_Models_Models". The conflict occurred in database "ArmyBuilder", table "dbo.Models", column ''ModelID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelUpdate(ModelDAL model) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 859
   at BusinessLogicLayer.ContextBLL.ModelUpdate(ModelBLL ModelToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 265
   at WarcasterPub.Controllers.MiniaturesController.Edit(Int32 id, ModelBLL ModelToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\MiniaturesController.cs:line 207', CAST(N'2019-11-07T00:11:54.127' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2067, N'The UPDATE statement conflicted with the FOREIGN KEY SAME TABLE constraint "FK_Models_Models". The conflict occurred in database "ArmyBuilder", table "dbo.Models", column ''ModelID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelUpdate(ModelDAL model) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 859', CAST(N'2019-11-07T00:14:36.627' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2068, N'The UPDATE statement conflicted with the FOREIGN KEY SAME TABLE constraint "FK_Models_Models". The conflict occurred in database "ArmyBuilder", table "dbo.Models", column ''ModelID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelUpdate(ModelDAL model) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 859
   at BusinessLogicLayer.ContextBLL.ModelUpdate(ModelBLL ModelToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 265
   at WarcasterPub.Controllers.MiniaturesController.Edit(Int32 id, ModelBLL ModelToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\MiniaturesController.cs:line 207', CAST(N'2019-11-07T00:14:36.630' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2069, N'The UPDATE statement conflicted with the FOREIGN KEY SAME TABLE constraint "FK_Models_Models". The conflict occurred in database "ArmyBuilder", table "dbo.Models", column ''ModelID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelUpdate(ModelDAL model) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 859', CAST(N'2019-11-07T00:15:24.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2070, N'The UPDATE statement conflicted with the FOREIGN KEY SAME TABLE constraint "FK_Models_Models". The conflict occurred in database "ArmyBuilder", table "dbo.Models", column ''ModelID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelUpdate(ModelDAL model) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 859
   at BusinessLogicLayer.ContextBLL.ModelUpdate(ModelBLL ModelToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 265
   at WarcasterPub.Controllers.MiniaturesController.Edit(Int32 id, ModelBLL ModelToEdit) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\MiniaturesController.cs:line 207', CAST(N'2019-11-07T00:15:24.033' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2071, N'Maximum request length exceeded.', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.Mvc.HttpRequestExtensions.GetHttpMethodOverride(HttpRequestBase request)
   at System.Web.Mvc.AcceptVerbsAttribute.IsValidForRequest(ControllerContext controllerContext, MethodInfo methodInfo)
   at System.Web.Mvc.HttpPostAttribute.IsValidForRequest(ControllerContext controllerContext, MethodInfo methodInfo)
   at System.Web.Mvc.ActionMethodSelectorBase.IsValidMethodSelector(ReadOnlyCollection`1 attributes, ControllerContext controllerContext, MethodInfo method)
   at System.Web.Mvc.ActionMethodSelectorBase.RunSelectionFilters(ControllerContext controllerContext, List`1 methodInfos)
   at System.Web.Mvc.ActionMethodSelectorBase.FindActionMethods(ControllerContext controllerContext, String actionName)
   at System.Web.Mvc.ActionMethodSelectorBase.FindActionMethod(ControllerContext controllerContext, String actionName)
   at System.Web.Mvc.Async.ReflectedAsyncControllerDescriptor.FindAction(ControllerContext controllerContext, String actionName)
   at System.Web.Mvc.ControllerActionInvoker.FindAction(ControllerContext controllerContext, ControllerDescriptor controllerDescriptor, String actionName)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_0(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_1(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_0(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-07T09:44:56.893' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2072, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_String()
   at System.Data.SqlClient.SqlDataReader.GetString(Int32 i)
   at DataAccessLayer.FactionMapper.ToFaction(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\FactionMapper.cs:line 27
   at DataAccessLayer.ContextDAL.FactionsGetAll(Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 401', CAST(N'2019-11-07T22:18:42.373' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2073, N'Data is Null. This method or property cannot be called on Null values.', N'   at System.Data.SqlClient.SqlBuffer.get_String()
   at System.Data.SqlClient.SqlDataReader.GetString(Int32 i)
   at DataAccessLayer.FactionMapper.ToFaction(SqlDataReader reader) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\FactionMapper.cs:line 27
   at DataAccessLayer.ContextDAL.FactionsGetAll(Int32 Skip, Int32 Take) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 401
   at BusinessLogicLayer.ContextBLL.FactionsGetAll(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 127
   at WarcasterPub.Controllers.FactionsController.Index() in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\FactionsController.cs:line 22', CAST(N'2019-11-07T22:18:42.410' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2074, N'Procedure or function ''FactionCreate'' expects parameter ''@BackGround'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.FactionCreate(FactionDAL NewFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 376', CAST(N'2019-11-07T22:29:18.610' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2075, N'Procedure or function ''FactionCreate'' expects parameter ''@BackGround'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.FactionCreate(FactionDAL NewFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 376
   at BusinessLogicLayer.ContextBLL.FactionCreate(FactionBLL InputFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 122
   at WarcasterPub.Controllers.FactionsController.Create(FactionBLL NewFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\FactionsController.cs:line 75', CAST(N'2019-11-07T22:29:18.610' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2076, N'Procedure or function ''FactionCreate'' expects parameter ''@BackGround'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.FactionCreate(FactionDAL NewFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 376', CAST(N'2019-11-07T22:31:21.680' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2077, N'Procedure or function ''FactionCreate'' expects parameter ''@BackGround'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at DataAccessLayer.ContextDAL.FactionCreate(FactionDAL NewFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 376
   at BusinessLogicLayer.ContextBLL.FactionCreate(FactionBLL InputFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 122
   at WarcasterPub.Controllers.FactionsController.Create(FactionBLL NewFaction) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\FactionsController.cs:line 75', CAST(N'2019-11-07T22:31:21.710' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2078, N'The controller for path ''/contact'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T09:56:23.933' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2079, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:13.293' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2080, N'The controller for path ''/Content/b'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:31.673' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2081, N'The controller for path ''/Content/ba'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:31.760' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2082, N'The controller for path ''/Content/b'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:33.810' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2083, N'The controller for path ''/Content/B'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:34.370' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2084, N'The controller for path ''/Content/Ba'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:34.673' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2085, N'The controller for path ''/Content/Bac'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:35.197' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2086, N'The controller for path ''/Content/Back'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:35.303' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2087, N'The controller for path ''/Content/Backg'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:35.893' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2088, N'The controller for path ''/Content/Backgr'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:36.123' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2089, N'The controller for path ''/Content/Backgro'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:36.337' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2090, N'The controller for path ''/Content/Backgrou'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:36.653' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2091, N'The controller for path ''/Content/Backgroun'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:37.197' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2092, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:37.303' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2093, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:38.873' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2094, N'The controller for path ''/Content/Background/1'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:40.887' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2095, N'The controller for path ''/Content/Background/18'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:41.000' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2096, N'The controller for path ''/Content/Background/187'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:41.373' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2097, N'The controller for path ''/Content/Background/1876'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:41.913' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2098, N'The controller for path ''/Content/Background/18765'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:42.207' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2099, N'The controller for path ''/Content/Background/187655'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:17:42.360' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2100, N'The controller for path ''/Content/B'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:27.493' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2101, N'The controller for path ''/Content/Ba'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:27.767' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2102, N'The controller for path ''/Content/Bac'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:28.960' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2103, N'The controller for path ''/Content/Back'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:29.090' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2104, N'The controller for path ''/Content/Backg'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:29.540' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2105, N'The controller for path ''/Content/Backgr'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:29.907' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2106, N'The controller for path ''/Content/Backgro'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:30.107' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2107, N'The controller for path ''/Content/Backgrou'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:30.360' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2108, N'The controller for path ''/Content/Backgroun'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:30.847' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2109, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:30.960' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2110, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:32.317' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2111, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:49.830' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2112, N'The controller for path ''/Content/Background/1'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:53.017' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2113, N'The controller for path ''/Content/Background/18'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:53.043' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2114, N'The controller for path ''/Content/Background/187'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:54.427' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2115, N'The controller for path ''/Content/Background/1876'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:54.773' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2116, N'The controller for path ''/Content/Background/18765'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:55.110' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2117, N'The controller for path ''/Content/Background/187655'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:19:55.290' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2118, N'The layout page "~/Views/Shared/_Layout.cshtml" could not be found at the following path: "~/Views/Shared/_Layout.cshtml".', N'   at System.Web.WebPages.WebPageExecutingBase.NormalizeLayoutPagePath(String layoutPagePath)
   at System.Web.WebPages.StartPage.set_Layout(String value)
   at ASP._Page_Views__ViewStart_cshtml.Execute() in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Views\_ViewStart.cshtml:line 2
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T21:24:26.363' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2119, N'The controller for path ''/Miniaturesalandaraar'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:45:00.023' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2120, N'The controller for path ''/Miniatureszdrdsvdvzdv'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:45:25.213' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2121, N'A public action method ''Edith'' was not found on controller ''WarcasterPub.Controllers.ArmyModelsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:46:31.797' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2122, N'A public action method ''Editzdcs'' was not found on controller ''WarcasterPub.Controllers.ArmyModelsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:49:48.450' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2123, N'The controller for path ''/Views/Shared/NotFound.html'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:49:48.470' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2124, N'The controller for path ''/Views/Shared/NotFound.html'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:50:00.223' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2125, N'The controller for path ''/Views/Shared/NotFound.html'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:50:00.230' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2126, N'The controller for path ''/shared'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:50:16.707' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2127, N'The controller for path ''/Views/Shared/NotFound.html'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:50:16.713' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2128, N'The controller for path ''/Factionsd'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:53:41.787' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2129, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:53:41.827' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2130, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:54:12.140' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2131, N'The controller for path ''/Factionsdscsdcsdc'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T22:54:18.147' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2132, N'The controller for path ''/Factionsdfbxfbx'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T23:00:23.390' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2133, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T23:00:23.413' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2134, N'The controller for path ''/Shared/NotFound.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T23:00:45.530' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2135, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T23:00:45.550' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2136, N'The controller for path ''/Miniatured'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T23:04:23.823' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2137, N'The controller for path ''/Shared/NotFound'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-09T23:04:23.830' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2138, N'A public action method ''eaofjclafa'' was not found on controller ''WarcasterPub.Controllers.MiniaturesController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:41:25.220' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2139, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:41:25.300' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2140, N'A public action method ''esgeg'' was not found on controller ''WarcasterPub.Controllers.MiniaturesController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:42:02.910' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2141, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:42:02.930' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2142, N'The controller for path ''/Shared/CantLetYou.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:42:13.143' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2143, N'The controller for path ''/Shared/CantLetYou.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:42:24.633' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2144, N'Session state is not available in this context.', N'   at System.Web.HttpApplication.get_Session()
   at WarcasterPub.MvcApplication.Application_AcquireRequestState(Object sender, EventArgs e) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Global.asax.cs:line 25
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:42:24.640' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2145, N'The controller for path ''/Factions2'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:47:58.317' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2146, N'The controller for path ''/Miniatures5'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:48:24.460' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2147, N'The controller for path ''/View/Shared/CantLetYou.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:48:24.467' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2148, N'The controller for path ''/Shared/CantLetYou.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:48:40.717' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2149, N'The controller for path ''/Shared/CantLetYou.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:48:48.250' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2150, N'The controller for path ''/CantLetYou.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:48:56.583' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2151, N'The controller for path ''/Factions5'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T15:49:29.173' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2152, N'The controller for path ''/Miniaturesdfs'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:54:16.170' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2153, N'The controller for path ''/Errors/NotFound.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:54:16.180' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2154, N'The controller for path ''/Errors/NotFound.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:54:30.023' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2155, N'The controller for path ''/Errors/NotFound.cshtml'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:54:30.027' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2156, N'The controller for path ''/kuh'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:55:36.467' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2157, N'A public action method ''NotFound.cshtml'' was not found on controller ''WarcasterPub.Controllers.ErrorsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:55:36.477' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2158, N'A public action method ''NotFound.cshtml'' was not found on controller ''WarcasterPub.Controllers.ErrorsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:55:42.727' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2159, N'A public action method ''NotFound.cshtml'' was not found on controller ''WarcasterPub.Controllers.ErrorsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:55:42.733' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2160, N'The controller for path ''/k'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:57:03.327' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2161, N'A public action method ''NotFound.cshtml'' was not found on controller ''WarcasterPub.Controllers.ErrorsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:57:03.340' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2162, N'A public action method ''NotFound.cshtml'' was not found on controller ''WarcasterPub.Controllers.ErrorsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:57:13.503' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2163, N'A public action method ''NotFound.cshtml'' was not found on controller ''WarcasterPub.Controllers.ErrorsController''.', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:57:13.510' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2164, N'The controller for path ''/Miniatures2'' was not found or does not implement IController.', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-11-10T16:57:51.120' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2165, N'The DELETE statement conflicted with the REFERENCE constraint "FK_ArmyModels_Models". The conflict occurred in database "ArmyBuilder", table "dbo.ArmyModels", column ''ModelID''.
The DELETE statement conflicted with the REFERENCE constraint "FK_ArmyMo', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelDelete(Int32 ModelID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 878', CAST(N'2019-11-11T10:29:52.723' AS DateTime))
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorMessage], [Trace], [time]) VALUES (2166, N'The DELETE statement conflicted with the REFERENCE constraint "FK_ArmyModels_Models". The conflict occurred in database "ArmyBuilder", table "dbo.ArmyModels", column ''ModelID''.
The DELETE statement conflicted with the REFERENCE constraint "FK_ArmyMo', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.ModelDelete(Int32 ModelID) in C:\Users\Onshore\source\repos\ArmyBuilder\DataAccessLayer\ContextDAL.cs:line 878
   at BusinessLogicLayer.ContextBLL.ModelDelete(Int32 ModelID) in C:\Users\Onshore\source\repos\ArmyBuilder\BusinessLogicLayer\ContextBLL.cs:line 268
   at WarcasterPub.Controllers.MiniaturesController.Delete(Int32 id, ModelBLL ModelToDelete) in C:\Users\Onshore\source\repos\ArmyBuilder\WarcasterPub\Controllers\MiniaturesController.cs:line 257', CAST(N'2019-11-11T10:29:52.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
SET IDENTITY_INSERT [dbo].[Factions] ON 

INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (1, N'Cygnar', N' Situated in the middle of western Immoren, Cygnar is the crown jewel of the Iron Kingdoms. Cygnar has the largest population, the best arcane mechaniks, the most resources, and the best gunsmiths in all of Immoren. Despite these advantages, they are beset on all sides by enemies who would tear it all down if they could.  Cygnar’s military prides itself on having the most disciplined and best-trained soldiers in western Immoren, as well as providing them with the resources and equipment to overcome nearly any challenge. It has earned a reputation for defeating its enemies even while outnumbered, with an emphasis on the quality rather than the quantity of its infantry and warjacks. Cygnar’s warjacks have a wide range of capabilities and incorporate sophisticated military-grade cortexes that make them highly effective whether controlled by warcasters or ’jack marshals. The army has changed considerably in recent years to incorporate gains from industrialization and mechanika and now stands at the cutting edge of technological ingenuity applied to the arts of war.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (2, N'Protectorate of Menoth', N'Unknown eons ago, Menoth created mankind. Tossed into a world dominated by hardier species (trollkin, ogrun) and more sophisticated cultures (dwarves), humanity needed help. Menoth provided that in the form of divine power, holy fire, and the beginnings of civilisation. Then He went back to hunting the Devourer Wurm, the primordial divinity of chaos and the wilderness. Only uncompromising adherence to Menoth''s True Law stood between humans and the howling horrors beyond their stout walls, and the Menite priest-kings zealously enforced this law while carving out a place for their people in Immoren. After millennia of victory and order the barbarian Orgoth conquered Immoren and overturned the True Law. The oppressed people abandoned Menoth for the heretical Church of Morrow and its uplifting philosophies, displacing Menoth''s loyal followers and reducing them to a minority in the civilization they had built.

After centuries of violent clashes and persecutions the visionary Visgoth Sulon called all Menites to migrate to the eastern half of the city of Caspia, a place that had been a haven for the Menite minority. Before a jubilant crowd of thousands Sulon took the title of Hierarch over the faithful. The Cygnaran military attempted to disperse the believers, but their interference sparked riots. The conflict spiraled into the First Cygnaran Civil War, which ravaged the kingdom for two years. Sulon was killed in the war and the Menites ultimately compromised for peace. The Protectorate of Menoth was established as a homeland for the Menites but was under the authority of the Cygnaran crown. The Menites were forbidden weapons and were made to pay taxes to Cygnar. Over a century the faithful bided their time, amassing wealth and secret armories as they trained for war. When Cygnar and Khador clashed, Hierarch Voyle declared a great crusade to retake Immoren. After driving off Cygnaran attempts at invasion Menite forces penetrated the walls of Caspia but were ultimately thrown back after the death of Voyle. Severius was named Hierarch and he directed the Menite armies to crusade north in Llael, the battleground of Khador, Cygnar, and Cryx. The Protectorate is a small and upstart nation, but its people have fought the armies of the old Iron Kingdoms and emerged victorious. The Protectorate of Menoth is independent and resurgent, and crusades to reclaim the world for their god with fire and faith.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (3, N'Khador', N'Following the iron rebellion that overthrew the Orgoth occupation of the Khardic Empire Khador was formed as a nation. Due to the heavy losses and many atrocities that took place in Khardic lands the fledgling nation of Khador was forced to cede the regions of Umbrey and much of what would become Ord during the negotiations of new borders following the war.

The new royal families of Ord and Llael were awarded lands based on their military achievements to expel the Orgoth; laying claim to the lands they had occupied and establishing their dynasties. This diplomatic annexation of traditionally Khardic lands bred resentment which would simmer in the form of intermittent border skirmishes between the neighboring nations, particularly along the borders shared with Cygnar. These skirmishes would erupt into full scale war several times in the following centuries, but none so large as the military occupation of Llael by Khador in 604 AR.

Empress Ayn Vanar the XI declared the reconquest of Llael as a national reunification of the Umbrean state under Vladimir Tzepesci, and a return to Khardic lands.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (4, N'Cryx', N'Also known as The Nightmare Empire, Cryx is a nation entirely under the control of Lord Toruk the Dragonfather and his council of 13 Lich Lords. The majority of the empire is located on a series of islands called the Scharde Isles, to the southwest of Cygnar, but in recent years Cryx has made serious inroads on the mainland and now have many secret underground bases located in the spawling Thornwood Forest, and elsewhere.

Toruk himself is an immortal dragon of immense proportions and is the single most powerful entity in the world (that is known of, at least). Toruk''s only goal is the destruction of his dragon offspring, who rebelled against him millenia ago. In the fullness of time, his armies will arise and lay waste to the petty kingdoms of humanity, enslaving them in death and preparing the army of his final victory. Once the nations of men have fallen, Toruk will drag his progeny from their hiding places and devour them once and for all.

The forces of Cryx exist solely to devour any and all things at the behest of the Dragonfather. Their martial strengths are speed, surprise, and force in numbers. Enemies of the undying know they must never be lax in their vigilance, for seemingly out of nowhere raiders can arrive without warning, carried across the sea aboard their infamous blackships. A sickening mix of necromancy, soulless science, and the unnatural corruption of draconic blight, Cryx is a fast, numerous, and shockingly powerful army. Specializing in undead hordes, the forces of Lord Toruk the Dragonfather nearly always outnumber their opponents. More, they possess some of the most magically potent and versatile spellcasters in Immoren who can manipulate the souls of the dead. Service in the Nightmare Empire never ends, and as Cryx extends its corrupting tendrils throughout the Iron Kingdoms, even the dead shall be called again to slaughter.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (5, N'Retribution of Scyrah', N'Ask a human from the Iron Kingdom about the nation of Ios and the first thing that they will tell you is "elves live there". That is also the last thing they will tell you, for that is all humans know. Ios is closed, its borders sealed for generations, and those few outsiders who test this threshold never return. Even the Orgoth did not test this enigmatic nation. The little trade Ios conducts with surrounding nations is done at arm''s length, often arranging for merchants to leave goods at the border for the elves to retrieve. The isolation of Iosans was something Immoren took for granted, like wind or the tides, but that isolation is over. While knowledge of elven aggression remains far from common, every nation has suffered the tramp of their myrmidons and felt the heat of their wrath.

From Forces of WARMACHINE: Retribution of Scyrah:

Elves have always been favored by their gods, which in part led to their downfall. We were showered with gifts and important issues were blessed by signs from above. The tragedy struck when in the height of our empire we decided that gods would venture from their dominion to Caen. Disaster was immeasurable and our empire was lost. What little exist today is but a hollow echo of our greatness. But material or even lives lost are nothing compared to true lamentation: our gods are dying or missing. This brings slow extinction and we are helplessly watching our slow doom creeping upon us.

The ancient elven empire of Lyoss once lay far to the east of what is now the Iron Kingdoms. Before the rise of humans and their blunt and brutal nations, elven civilization flourished like none before or since. Their magic knew no equal. Their science opened the world to their understanding, and their achievements became legends in their own time. At the height of their power, their hubris demanded still greater deeds, and they decided to literally bridge the gap between Caen and the Veld, the home of their gods. Incredible as it sounds, they succeeded, but the consequences of success can be as, or more, tragic as failure. As soon as their gods had crossed to Caen, the bridge catastrophically failed. The resulting explosion obliterated the city, cracked the very surface of the world, ended the Lyossian Empire, and devastated the elven race.

Shepherded by their gods to forests on the western fringe of their old civilization, the elves settled in Ios and rebuilt. Their gods lived among them, and for a time, matters seemed well. It became apparent, however, that the gods were weakening. Their connection to the worlds beyond Caen had weakened, and after many centuries, they could no longer do all that they needed to do to protect their people. In desperation, they set out alone to search for a solution and a way back to the Veld. Only one returned: Scyrah, Nis-Issyr of Spring, now called the Last Goddess. For all the centuries since, Scyrah has remained in her fane in the capital, doing all she can to aid her people even as she slowly dies.

The fate of their goddess mirrors the fate of the elven race, and the Iosans have come to understand that they are dying. Their gods have vanished or perished, and all the metaphysical tasks these deities performed languish unattended. Elven souls do not reincarnate as once they did, and every year, more soulless elven children enter this world. Devoid of passions and most emotions, these tragic aberrations embody the fate all Ios. Some Iosans are unwilling to stand by and accept this slide into oblivion. Though desperately seeking answers in all directions, a few scholars noted an apparent coincidence. Around the time their gods perished—they know exactly when this occurred, for priests across their nation went mad on the same night—humans suddenly gained the ability to use magic not granted by their gods. The coincidence was too much to bear, and the elves realized that it must have been the human magicians who slowly siphoned the life from their gods. Knowingly or not, the humans were to blame, and the only way to stop the demise of their last goddess is to end the human practice.

The bands of fanatics who embraced this belief called themselves the Retribution of Scyrah. Though long a small, fringe sect, as every other avenue of inquiry has proved fruitless, many more have turned to the Retribution in order to do something. For decades, the Retribution''s trained hunters have stalked human wizards and destroyed their devices, but the sheer size of humanity and its pervasive reach makes these victories little better than flees biting a horse. Despised and dismissed, the Retribution languished, having taken on a hopeless task and lacking every resource but the will to see it done. All that changed when the Mage Hunter Eiryss brought news from Khador. Nyssor, Scyir of Winter, still lived. Sealed in a block of ice, his chosen people—the Nyss—had long kept him safe. With their corruption by the dragon Everblight, a few remaining pure Nyss had been forced to move their god, and he had fallen into the hands of the Khadoran Greylords Covenant.

The news rocked Ios. The Retribution—the one group uniquely positioned to both intervene and benefit from this turn of events—capitalized on the outpouring of rage and grew dramatically. Not only did their size increase, but long-hidden allies stepped forth to support them, lending legitimacy to their zealotry. Two of the great military Houses of Ios publicly announced their support for the Retribution. This has given the Retribution access to the kind of armed power commanded only by nations, including myrmidons. Far more elegant than the clunky, steam-powered warjacks humans rely upon, these magically animated works of art have joined an arsenal of innumerable other weaponry more than equal to anything ever produced by humanity. Though some argue that the Houses support the Retribution purely for political reasons, the pragmatic goal of retrieving Nyssor is simply too important to ignore.

The Retribution is on the move and gaining support among the Iosan people. Even House Vyre has taken up arms and joined the cause. Lord Arcanist Ossyan Vyre, a relatively junior warcaster, recently clashed with Goreshade and managed to secure Nyssor''s vault. Very recently, Trollbloods were driven out of the lake region and Skorne have been massing in this staging area. An invasion seems imminent, and with much of the Retribution fighting in Khador, the future may hold very difficult times for the elves of Ios.

While Nyssor is still far from safe, each arcanist, warjack, and arcane trinket destroyed loosens the noose around Scyrah''s neck. Each action to save our people is justified. Our future will be cast by fire and steel.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (6, N'Mercenaries', N'The term “mercenary” was once used as a slur among fighting men. In certain kingdoms, notably Khador, the term is still used as a disdainful appellation for those who have no attachment to their homeland. Nevertheless, where war and wages thrive mercenaries inevitably follow; with the occupation of Llael, mercenary bands have cropped up all over the kingdoms.

Mercenaries are so common in the Iron Kingdoms that some speculate it was mercenaries who helped bring them about and ultimately are hindering their solidarity. After all a mercenary’s wage comes from war, and conflicts keep mercenaries in business. For example, the once-powerful Thunderhelm Irregulars, recently laid low by Khadoran forces, were practically permanent occupants of Llael, and the Blackshields are so closely tied to Cygnar that they have become an official branch of the army in all but name.

There is perhaps no greater display of material wealth and military might than the ability to hire mercenaries. Some leaders hire mercenaries as political and fiscal displays of power to intimidate their enemies. Battles have been won by the mere presence of an overwhelming force, and mercenaries can help pad a weak army. A mercenary force can turn a rich man into a dangerous one.

Conversely, mercenaries make for expensive friends. Unpopular dictators gladly pay for fighting men they feel they can trust. Since mercenaries have no political affiliation, they are viewed by some as the ultimate neutral force and a means of “fighting bitterly while keeping the peace” as King Leto once said of Khadoran mercenaries on the north borders of Cygnar and Ord. It goes without saying that this parasitic relationship can quickly turn predatory if an employer fails to keep his mercenaries well paid.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (7, N'Crucible Guard', N'History of the Order of the Golden Crucible and the Crucible Guard
The largest and most respected alchemy guild, it was founded in 25 BR as a conspiracy of Arcanists and Alchemists forming of resistance against the Orgoth. During the course of the the Rebellion, members developed many different weapons and innovations to topple the invading Orgoth; Perhaps the best known invention was blast powder and fire arms. The first fire arms being credited to Aurumn Alchemist Oliver Gulvont in 28 AR. By 80 AR, the Order of the Golden Crucible, primarily located in Leryn, improved the fire arms and created the Legendary Army of Thunder, who went to liberate Rynyr in 84 AR from Orgoth control. This would be the precursor to the Crucible Guard. The Orgoth managed to retake Rynyr, they could not take Leryn, losing the Battle of Thunderhead in 84 AR. The Order likely had a key role to play in the development of the first colossals.

Since the fall of the Orgoth in 201 AR, the Order of the Golden Crucible had a monopoly of the production of Blasting powder, but this would steadily decline until they just had a Monopoly of the commercial sale of blasting powder. The Order profited from the many wars abroad, mercenary companies being their foremost clients, they had little interest in getting their security force, The Crucible Guard, involved, as it may upset potential clients. The Guard would defend the Order’s facilities, such as the Red Powder mines in Rynyr found in the Llaelese Mountains, Thunderhead Fortress in Leryn (Eastern Llael), as well as dozens of scattered chapter houses across the Iron Kingdoms. The Greylord Covenant dismantled the Order’s Khadoran holdings, and due to the Theocratic polices of the Synod, the Order never attempted to establish a chapter in Sul or the Protectorate.

While the Order of the Crucible Guard remained largely aloof during most conflicts, during the Llaelese war, the Crucible Guard fought countless clashes against Khadoran invasion forces, supporting the Llaelese and Cyngaran armies. This would continue until after the fall of Leryn and the seizure of the Thunderhead fortress, which disbanded much of the Crucible Guard and decentralized the leadership for the Order of the Golden Crucible.

Thunderhead Fortress would fall to Cinten 1st, 605 Ar, when Aurum Ominus Alchemist Tyrwen Culpen betrayed the Order, allowing Khadoran forces in through a secret set of tunnels, built during the Orgoth invasion to smuggle food and supplies in and out of Leryn.

In 607 AR, The new HQ of the Order of the Golden Crucible was established by Aurum Magnus Helt Langworth with the assistance of Ord’s King Baird Cathor II. With this backing in place, the Crucible Guard was reinvented and re-established. It was period of extraordinary experimentation and development, not only in terms of Warjacks (As major adaptation of both the Vanguard and Toro chassis), but terms of weaponry and morally dangerous human research.

When the War between Khador and Cygnar reached a crucial turning point in 611 AR, at the behest of Aurum Legate Lukas di Morray, recently freed during the events of “Acts of War: Aftershock”, The Crucible Guard was marshalled and they would rejoin the efforts against Khador, with an uneasy alliance of the Cygnaran army and the Llaelese Resistance.

Organization of the Crucible Guard
The organization of the Crucible Guard draws from and expands the original historical structure of the The Order of the Golden Crucible. While the Golden Crucible boasts branches across many large towns and cities abroad the Iron kingdoms, its membership was limited and simply organized.

The lowest level is Apprentice, whom work to gain admittance to the Order of the Golden Crucible, working along side of Aurum Ominus Alchemists to train, learn and expand their craft. Often Combat Alchemists come from this rank.

Upon admittance to the Order, New members receive a signet ring bearing the symbol of the Order, and given the tile Aurum Ominus Alchemist, this is the same regardless of being a Alchemist, Arcane Mechanic or Arcanist.

When chosen to participate in administration of the Order, a Member is given the rank of Aurum Lucanum Alchemist and granted admittance to the Assembly of Masters, the general governing body of the Order of the Golden Crucible. This usually requires a member to master a discipline and be in good standing within the Order.

The Head of the Order of the Golden Crucible is given the rank of Aurum Magnus, whom elected to the position at the death or retirement of the previous Aurum Magnus. The Aurum Magnus must be a true master of alchemy and be skilled at politics and trade.

The Current head of the Order of the Golden Crucible is Aurum Magnus Helt Langworth. Previous Aurum Magnus’s include Niel Wys, whom was executed during the fall of Thunderhead Fortress.

The Current Commander of the Guard is Jean R. Dagget; Dagget has ultimate oversight of the Crucible Guard, even though his role has primarily become Administrative, with the emphasis of coordination between Crucible Guard and the Ordic Military, and working close with Aurum Lucanum Creena Torcial.

However, Marshal General Baldwin Gearhart has become the de facto leader of the operational running of the Crucible Guard. Otherwise the Crucible Guard operates akin to other mercenary organizations;

Captains are the highest field officer, overseeing a company, the size of each company varying depending on composition and role; largest being infantry companies and the smallest being Railless companies. Companies are broken down into platoons, led by Lieutenants, further broken down to squads which are led by Sergeants.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (8, N'Infernals', N'Infernals are evil beings from a mysterious realm that is beyond both Caen and Urcaen; Caen being the mortal world in which Warmachine and Hordes is set, and Urcaen being essentially the afterlife world.

The inhabitants of Caen lack deep knowledge of the Infernals, only knowing that they are ruthless predators with a thirst for mortal souls. Infernals will go to great lengths and may offer tremendous power to those who betray and offer up the souls of their own species or other intelligent creatures.

They have moved in the shadows of civilisation for millennia, but they have now come in force to claim the debt humanity owes them for receiving the gift of magic (that helped free mankind from its Orgoth oppressors). While staved off by the Wicked Harvest, the Infernals have not been deterred, and are here to reap the souls of two-thirds of humanity.

With the power to summon their beasts and warriors right into combat from their own Infernal plane, nothing like these creatures has ever been seen on the battlefields of the Iron Kingdoms before.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (9, N'Convergence of Cyriss', N' Cyriss is the goddess of logic and science, and the members of the Convergence are her devoted followers. The leaders of the Cult are inspired minds transferred into clockwork vessels, technologically wondrous mechanisms that can host human souls. For centuries, they hid in secret temples, called "forges." These temples are scattered and compete for control of mystical nexuses with forces like the Circle and Ios. One advantage the Cyrissists have gained is access to the nexuses under major human cities, gained by sharing a limited part of their incredible discoveries in exchange for protection and resources, filling hungry spirits like Nemo and Blaustvaya with new ideas which were but minor achievements for the ever-expanding Cult. Creation and discovery blend together in an unprecedented way. The Priests of the Maiden of Gears advance toward mechanical marvels like the Cipher Engine, a calculator that generates mathematical formula containing codes through which the goddess speaks to her servants, and the Constellation, a vast machine that hosts the souls of the most skilled scientists so they may work together in harmony without the hindrances of a physical body. Convergence is how they address the present time, considered the perfect moment to bring the Great Work to completion. Immoren will finally see the fruit of their endless striving for perfection and the dedication of thousands of the most creative minds to one single goal: destroy any who oppose the Mistress of Numbers, mechanize places of power to harness the raw energy of Caen, and change the face of the world forever.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (10, N'Trollbloods', N'The Trollbloods represent a loose alliance between a variety of formerly scattered and disparate tribal communities. They were forced to band together to survive in the face of humanity’s quickly escalating wars. Trollkin tribes, called kriels, have deep roots in western Immoren, where they have built homes in several wilderness regions the human nations had deemed of little interest. Trollkin are not strangers to human cities, as a number of these robust and hardy people work and live alongside mankind, but the majority remain in the wild, wary of humanity after a long history of frequent struggles, broken promises, and mutual bloodshed.

Recent wars between the human nations of Khador and Cygnar had a particularly disruptive influence on the large number of trollkin who once lived in the dense Thornwood Forest. Because of the forest’s location these kriels found themselves directly in the middle of border fighting between the two implacable and bitter rival nations. Making things worse, Cryxian abominations soon entered the fray, absorbing the fallen dead to bolster their own numbers. The trollkin looked to one of their great leaders, the chieftain Madrak Ironhide, to unite them and save their race. Madrak reluctantly took up a cursed weapon of last resort, an ancient axe named Rathrok, or “World Ender,” in the hopes that its power would preserve his people and their way of life.

Since that decision the trollkin have been embroiled in a series of desperate struggles. Driven from the Thornwood they find no safety anywhere they travel and must continue to search for a proper home. They fight for their mates and young and to preserve their society against an endless series of horrors and setbacks. Yet every challenge only strengthens their resolve and encourages the warrior spirit that persists in the very blood and bones of this brave people. They refuse to break under the pressure and fight tooth and nail for their right to a better life. A number of great leaders and heroes have arisen from the scattered kriels as Madrak Ironhide has attracted supporters from as far away as the Scarsfell Forest of northern Khador and the Gnarls of western Cygnar.

The trollkin are not alone in their struggles. Their species has long been able to call on full-blood trolls to fight in their battles. These great creatures are seen by humanity as monsters, yet they will heed the commands of trollkin warlocks. Individuals like Madrak and his greatest ally and rival, the shaman Hoarluk Doomshaper, can connect to the minds of full-blood trolls and call them to battle. These creatures possess strength and regenerative powers passed down by the mother-goddess Dhunia and thereby can endure punishment that would annihilate any other living creature. In return for this vitality, full-blood trolls are driven by endless hunger. This need to feast makes trolls difficult to control but also fearsome adversaries. Together with their troll allies, trollkin warlocks and champions are ready to stand their ground against any army that dares threaten them.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (11, N'Circle Orboros', N'The Circle Orboros are an ancient order of druids dedicated to the Devourer Wurm, Caen''s primordial god of chaos and the wild, destructive aspects of nature. They name this serpent Orboros. The blackclads have existed since before the rise of the earliest human civilizations, composed of people sensitive to the magic of the wild, and they channel this power in service of Orboros and themselves. Menoth—the great hunter, creator of humanity, and the god of civilization—is the ancient enemy of Orboros and hunts the Wurm across the spiritual world of Urcaen. The Circle believes that the inexorable spread of settled nations and industry has strengthened Menoth and weakened the Devourer. If this continues, Orboros may stir and return to wreak utter devastation on the world. Thus, they make war upon civilization itself and strive to preserve the wild spaces of Immoren.

Druids of the Circle display their natural magical talent while young. This wilding is an aptitude for wild magic and an affinity for nature. Largely the province of folklore in most of Immoren, such people are actively hunted in the Protectorate. The Circle always senses a wildling''s awakening and attempts to abduct them, but this is not always possible. Druids with the proper affinity learn to control various natural beasts, the warpwolves (twisted creatures the Circle creates), and the stone-and-wood Wold constructs unique to their order. They also call upon the willing warriors of the Wolves of Orboros, humans living in wild areas with a long history of fighting for the Circle in return for protection, and the savage Tharn tribes. Once human worshipers of Orboros, the Tharn are now a race of shapeshifting, heart-eating barbarians capable of transforming into monsters.

The Circle opposes all human nations, seeing them as the agents of Menoth and destroyers of the wild. The blight of dragons is an unnatural power corrupting anything it touches, and thus they also hunt and kill the minions of dragons (Cryx and the Legion). The Circle sees the Skorne''s mortitheurgy as little better than blight, arising as it does from the energies of death, and their civilization as no better than any other, making these two implacable enemies as well. Though the Circle manipulated their Trollblood "allies" for many years, the blackclads'' ill-conceived assassination attempt on the upstart Chief Madrak Ironhide (to replace him with a more malleable chief) ended this association and also resulted in the death of some very senior druids. Ironhide subsequently declared war on the Circle. Now the druids find themselves beset on all sides, but they remain confident. Their order has survived untold millennia of upheaval. Now they will show all of Immoren why they should fear to go walking in the wilds.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (12, N'Skorne', N'The Skorne race is unique among the major races of Immoren in that they have no gods. The Skorne know that the only thing waiting for them after death is eternal torment in the void. The only salvation from this fate is to become an Exalted, which is a state of immortality reserved only for the most worthy of the warrior caste. Thus their entire culture is built around martial discipline, conquest, suffering and pain. If the afterlife is nothing but torment, why should this life be any different? Torture is an art form for the Skorne and compassion is non-existent.

Far to the east, beyond the great canyon known as the Abyss dwells the warrior people of the Skorne Empire. The most important thing to realize about the Skorne is this; they know exactly what awaits them after death. Ever since the legendary Voksune discovered the secrets of looking beyond death, the Skorne have known that the realm beyond contains nothing but madness and pain. Their worldview is fundamentally based on the idea that death is ultimately a form of failure. The Skorne are determined to cheat death by whatever means they can -- either metaphorically, by having their exploits enter Skorne legend, or literally, by earning the right to have their spiritual essence locked into one of the Sacral Stones in which the Skorne keep the souls of their ancestors. It has also given them a fascination with pain and anatomy, and numerous castes have arisen in Skorne society dedicated to the study of these things. From these studies arose the arts of Mortitheurgy, a necromantic form of blood magic which draws of the energy of the Void beyond death, and Beast Handling, the skills of breeding beasts fit for use as weapons of war. The Skorne civilisation arose under the dominance of the empire of a race called the Lyoss. Skorne history tells us little about the Lyoss, other than the fact that they were a religious people, something the Skorne see as predicting their downfall. When a great cataclysm stretched across western Immoren, the Skorne easily outlasted the Lyoss, and changed from a nomadic lifestyle to a race with an empire of their own. The loosely-affiliated archdominars of the great houses of the Skorne empire happily made war amongst themselves for nearly 250 generations, until the coming of Vinter Raelthorne, the ousted King of Cygnar. Vinter was the first human the Skorne had ever seen. He had crossed the desert and found his way past the Abyss. As they had a fierce respect for his martial prowess, he gained a place among them, and conquered a continuously larger army of Skorne warriors. As such he was able to slaughter his way through the Skorne ranks and establish himself as their Conqueror after his army besieged and secured the great city of Halaak. This ended what the Skorne now refers to as the First Unification War. Vinter was hailed as a Skorne reborn in human flesh, creates the new title the of Supreme Archdominar and told the Skorne that he would lead them back into human lands, granting them a vast new territory for their new empire.

With the aid of Saxon Orrik, the Skorne built bridges across the Abyss dividing Eastern and Western Immoren, and Vinter led an army across them. His campaign failed to return, and the Skorne elders assumed that he had died and so fell back on their old ways. However, Vinter returned once again and assisted by the archdomina Makeda of house Balaash he killed those who had usurped in his abscence. He had realised that his previous campaign was too small and ill-equipped to make a serious dent in the Iron Kingdoms, and so he supervised the militarisation of the entire Skorne nation. They built even mighter engines of war and marched across the Abyss once again, slaying their way through human and trollkin armies alike. However, it was not long after the second invasion that Vinter revealed his betrayal; he had never intended the Skorne to overtake the human lands. Rather, his consolidation of their armies was in the hope that he could retake the throne of Cygnar, and drive the Skorne out of the human nations to consolidate his rule. Fearing the power of the army he had created, Vinter ordered a futile attack on Fort Falk, which ended in a massive rout of his skorne soldiers. Archdomina Makeda learned of Vinter''s treachery, and took control of the army, becoming the new Supreme Archdomina. Vinter has fled, and the Skorne are ready to subjugate all of humanity under their rule.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (13, N'Legion of Everblight', N'While the Legion as a whole is only a few years old, the core of this tremendously dangerous organization is the dragon Everblight, an ancient creature born from the lifestone of Lord Toruk, the Dragonfather. Everblight has long considered himself the cleverest and most inventive of the dragons spawned by Toruk thousands of years ago. He has existed aloof from his peers, hatching plans in secret and demonstrating a unique control over his own blight.

All dragons blight their surroundings, emitting a warping and destructive energy that prompts strange growths in living things and can even taint the land itself. This blight arises from the athanc, or lifestone, that is the imperishable core of every dragon. The athanc persists even if a dragon’s formidable body is destroyed, and in time a new body will grow to replace the old. Even in ancient times Everblight showed he could partially control his blight, hiding his presence from other dragons while using this power to enslave and modify other living things or to create terrifying spawn that he sent forth as living weapons.

Several centuries ago the elven armies of Ios destroyed Everblight’s body. They ripped loose his athanc, sealed it away, and sent it to an isolated mountain peak in the frozen north of Khador. For centuries Everblight was thus imprisoned and disembodied, conscious and scheming all the while. This lasted until several years ago when Everblight lured an ogrun named Thagrosh to his prison and prompted the creature to break its seals. Rather than regenerating a dragon body, Everblight merged his athanc with Thagrosh, causing the ogrun’s body to mutate and transform into a monstrous new form. Through Thagrosh, Everblight next seized control of the Nyss, the winter elves inhabiting that frozen northern region. The skilled bladesmen and archers of these Nyss tribes would soon serve as the ideal foot soldiers for Everblight’s newly arisen Legion. Horrendously blighted ogrun from the nearby mountains were soon added to the fighting force, bringing their brawn and insane ferocity to the Legion’s cause.

Everblight has committed to a fiendish plan for which he has divided his athanc numerous times and inserted these slivers into his chosen generals. These have become the warlocks who lead the Legion of Everblight in the dragon’s name. They are an army that includes an ever-growing assortment of serpentine dragonspawn, grown from the blighted blood of the warlocks. Each warlock is connected telepathically to Everblight, giving the army a terrifying singularity of purpose and unparalleled capability to coordinate its actions.

Everblight knows his existence is in peril, as the other dragons would consume him to add to their own power, and therefore he must move quickly and lash out against those who would stop him. Foremost among these enemies is the Circle Orboros, the first group that recognized the threat represented by Everblight and his blighted army. Any creatures that stand in their path will be consumed, assimilated, or crushed underfoot. Everblight’s only hope for long-term survival is to become as strong as possible as quickly as possible, and he cares little for the destruction and bloodshed unleashed by his warlocks in his pursuit of that goal.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (14, N'Minions', N'Occasionally other creatures in the wilds of western Immoren are caught up in the bloody struggles of the region. Some are individuals seeking to profit from warfare and strife. Others are small groups of tribal creatures willing to offer their strength of arms to others, whether in return for protection or supplies or simply to preserve their home territories from enemies. Events can sweep up these minor players against their will as they are captured, enslaved, or coerced into doing the bidding of those who are more numerous or powerful.

Whatever their concerns or motivations, minions bring tremendous versatility to their sponsors. Swamp gobbers bring the inventive alchemy of their fog bellows to cloak allies in concealing mist. Rugged farrow brigands offer rifles and clubs for hire and seem willing to take the brunt of enemy assaults. Gatormen are among the most vicious and deadly warriors in the region, with a combination of physical prowess and tough, scaled hides. Bog trogs emerge from the wetlands wielding cruelly effective barbed hooks and take advantage of their natural camouflage to ambush and surprise the enemy.

In addition, certain strong-willed individuals willing to lend a helping hand to one or another of the HORDES groups often join the fray. These include the famed monster hunter Alten Ashley, an expert shot with a tremendous rifle affectionately named Bucking Jenny. Although he claims to be a mercenary at heart, Alten is most interested in hunting big game and will side with anyone who offers that opportunity. Another is the surly and antisocial dwarf Brun Cragback, a mountain fighter from Rhul whose constant companion both in and out of battle is an armored bear named Lug. Some of these individuals do not care for whom they work, like Gudrun, the fatalistic ogrun who loses himself in drunken binges when the fates conspire to keep him alive. Whatever their reasons for offering their assistance, these fighters possess unique skills that can be used by their allies to turn the tide of otherwise desperate battles.')
INSERT [dbo].[Factions] ([FactionID], [FactionName], [BackGround]) VALUES (15, N'Grymkin', N'The warbeasts are the nightmares of the Defiers given flesh and blood. For millenia they tormented the defiers before they learned to control them. The lesser Grymkin are those wicked souls who end up in the wilds of Urcaen and are judged and transformed by the Defiers as an eternal punishment.

The Defiers themselves are five humans who were banished to the wilds of Urcaen for refusing Menoth''s law. Their wills were so strong that they each became demigods dedicated to opposing Menoth and punishing his creation, which they see as corrupt and wicked.

For centuries, the Defiers awaited their chance to return to Caen to unleash their wicked harvest on Menoth''s civilization. It was not until the Old Witch devised a way to create a portal to Urcaen through which the armies of the grymkin could pass that they got their chance. The Old Witch''s motive for unleashing hell on earth was--oddly enough--to use the Grymkin to slow the spread of infernalism that would one day unleash an even worse hell on earth if left unchecked.

If Infernals ever invaded Caen in full force, it would mean the end of the world and the eternal torment of all living souls. The Grymkin, then, are the world''s twisted salvation from annihilation.

When Menoth came back from his battle with the Devourer Wurm to give his so-called "gifts" to humanity, five individuals with tremendous will of their own rejected him so strongly and fundamentally they ended up tapping into some part of the divine power all humans have in their souls. In retribution for this, Menoth threw them in to Ur-Caen where they were trapped, tortured by their own nightmares, for thousands of years.

The Old Witch Zevanna Agha knew of them and looked for a way to set them free to further her own plans. She managed to find a lady in an insane asylum and use her as a conduit to negotiate terms and arrange to open the gates to Urcaen for them. The rest of the faction are manifestations of their willpower, or in the case of the beasts; their nightmares made manifest. The only thing the Grymkin warlocks are truly scared of is their warbeasts which are in truth their own nightmares. It''s said the only time you would hear the true names of the Defiers is on the breath of the beasts when they lose control and it comes for them.

Other and older grymkin found in previous editions of Iron Kingdom literature featured the folkloric story of Gristle and Flay and the third brother. Anecdotes of gremlins in the machines, and why gremlins hate cats. Stories of the Old Man of the Swamp, or the rusalka bog nymph.')
SET IDENTITY_INSERT [dbo].[Factions] OFF
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (0, N'no model', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (8, N'Crusader', 2, 1, 10, 0, 0, 12, 4, 6, 5, 10, 19, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 14, 18)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (16, N'High Exemplar Kreoss', 2, 0, 29, 0, 0, 1, 5, 7, 4, 14, 16, N'0', N'0', 0, 0, 0, 0, 0, 0, 2, 0, 14, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (17, N'Holy Zealots', 2, 2, 7, 12, 0, 3, 6, 5, 5, 12, 12, N'6', N'0', 1, 0, 3, 0, 12, 0, 0, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (18, N'Lord Commander Stryker', 1, 0, 28, 0, 0, 1, 6, 7, 6, 16, 16, N'10', N'0', 2, 0, 0, 0, 12, 0, 2, 0, 15, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (19, N'Forward Kommander Soarsca', 3, 0, 27, 0, 0, 1, 6, 7, 6, 16, 15, N'10', N'0', 4, 0, 0, 0, 10, 10, 2, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (20, N'Denegra the Soul Wreaver', 4, 0, 27, 0, 0, 1, 9, 6, 4, 15, 16, N'sp8', N'0', 1, 0, 0, 0, 10, 0, 2, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (21, N'Magnus the Traitor', 6, 0, 30, 0, 0, 1, 5, 7, 6, 14, 17, N'sp8', N'0', 1, 0, 0, 0, 12, 0, 1, 0.5, 13, 11)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (22, N'Centurion', 1, 1, 17, 0, 0, 12, 4, 7, 5, 11, 19, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 2, 14, 18)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (23, N'Arcane Tempest Gun Mages', 1, 2, 11, 0, 0, 2, 6, 5, 7, 14, 11, N'10', N'0', 1, 0, 0, 0, 10, 0, 0, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (24, N'Destroyer', 3, 1, 14, 0, 0, 12, 4, 7, 4, 10, 20, N'14', N'0', 1, 0, 4, 0, 14, 0, 1, 0, 17, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (25, N'Kossite Woodsmen', 3, 2, 6, 10, 0, 2, 6, 5, 4, 13, 11, N'10', N'0', 1, 0, 0, 0, 10, 0, 0.5, 0, 8, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (26, N'Stalker', 4, 1, 8, 0, 0, 12, 7, 7, 4, 15, 13, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 12, 12)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (27, N'Scharde Pirates', 4, 2, 8, 14, 0, 12, 6, 5, 5, 13, 11, N'sp6', N'0', 1, 0, 0, 0, 12, 0, 0.5, 0.5, 9, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (28, N'Mule', 6, 1, 14, 0, 0, 12, 5, 6, 5, 10, 18, N'12', N'0', 1, 0, 4, 0, 15, 0, 2, 0, 16, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (29, N'Press Gangers', 6, 2, 7, 12, 0, 2, 6, 5, 4, 13, 11, N'0', N'0', 0, 0, 0, 0, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (30, N'Storm Lances', 1, 2, 12, 20, 0, 2, 8, 7, 5, 13, 17, N'8', N'0', 1, 0, 0, 0, 12, 0, 2, 8, 0, 12)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1030, N'Captain Victoria Haley', 1, 0, 27, 0, 0, 1, 6, 6, 5, 16, 14, N'12', N'0', 1, 0, 0, 0, 12, 0, 2, 0, 11, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1031, N'Lieutenant Allister Caine', 1, 0, 30, 0, 0, 1, 7, 4, 8, 17, 13, N'12', N'12', 1, 1, 0, 0, 12, 12, 0.5, 0, 8, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1032, N'Feora Priestess of the Flame', 2, 0, 31, 0, 0, 1, 6, 6, 5, 15, 17, N'sp8', N'sp8', 1, 1, 0, 0, 12, 12, 0.5, 0.5, 13, 13)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1033, N'The Harbinger of Menoth', 2, 0, 27, 0, 0, 1, 6, 3, 1, 14, 14, N'0', N'0', 0, 0, 0, 0, 0, 0, 0.5, 0.5, 12, 12)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1034, N'The High Reclaimer', 2, 0, 32, 0, 0, 1, 5, 6, 4, 14, 16, N'0', N'0', 0, 0, 0, 0, 0, 0, 2, 0, 14, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1035, N'Vladimir Tzepesci, Great prince of Umbrey', 3, 0, 27, 0, 0, 1, 8, 7, 5, 15, 17, N'0', N'0', 0, 0, 0, 0, 0, 0, 2, 1, 12, 13)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1036, N'Kommandant Irusk', 3, 0, 27, 0, 0, 1, 6, 7, 6, 14, 14, N'10', N'0', 1, 0, 0, 0, 13, 0, 1, 0, 12, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1037, N'Goreshade the Cursed', 4, 0, 28, 0, 0, 1, 6, 7, 4, 15, 16, N'0', N'0', 0, 0, 0, 0, 0, 0, 2, 0, 15, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1038, N'Pirate Queen Skarre', 4, 0, 28, 0, 0, 1, 7, 7, 4, 16, 15, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 0.5, 13, 9)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1039, N'Ashlynn D''Elyse', 6, 0, 29, 0, 0, 1, 6, 8, 7, 17, 15, N'12', N'0', 1, 0, 0, 0, 12, 0, 1, 0, 11, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1040, N'Captain Phinneus Shae', 6, 0, 28, 0, 0, 1, 6, 7, 6, 17, 14, N'12', N'0', 1, 0, 0, 0, 12, 0, 1, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1041, N'Captain Bartolo Montador', 6, 0, 28, 0, 0, 1, 6, 7, 5, 15, 16, N'sp8', N'0', 1, 0, 0, 0, 12, 0, 0.5, 0, 14, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1042, N'Kommander Zoktavir, the buther Unleashed', 3, 0, 22, 0, 0, 1, 5, 9, 5, 14, 18, N'8', N'0', 1, 0, 0, 0, 12, 0, 2, 0, 16, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1043, N'The Witch Coven of GharlGhast', 4, 0, 26, 0, 0, 1, 6, 5, 4, 16, 13, N'0', N'0', 0, 0, 0, 0, 0, 0, 0.5, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1044, N'Defender', 1, 1, 16, 0, 0, 12, 5, 7, 6, 12, 18, N'16', N'0', 1, 0, 0, 0, 15, 0, 0, 0, 17, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1045, N'Sentinel', 1, 1, 8, 0, 0, 12, 6, 6, 6, 13, 16, N'10', N'0', 3, 0, 0, 0, 10, 0, 0.5, 0, 11, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1046, N'IronClad', 1, 1, 12, 0, 0, 12, 5, 7, 6, 12, 18, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 18, 14)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1047, N'Arcane Tempest Gun Mages :Officer', 1, 2, 4, 0, 23, 2, 6, 6, 8, 14, 11, N'10', N'0', 1, 0, 0, 0, 10, 0, 0, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1048, N'Rangers', 1, 2, 9, 0, 0, 2, 7, 5, 6, 14, 11, N'10', N'0', 1, 0, 0, 0, 11, 0, 0.5, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1049, N'Long Gunner Infantry', 1, 2, 10, 16, 0, 2, 6, 4, 5, 12, 12, N'14', N'0', 1, 0, 0, 0, 10, 0, 0.5, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1050, N'Long Gunner Infantry :officer & standard', 1, 2, 4, 0, 1049, 2, 6, 5, 6, 12, 12, N'14', N'0', 1, 0, 0, 0, 10, 0, 0, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1051, N'Reckoner', 2, 1, 16, 0, 0, 12, 5, 6, 5, 10, 19, N'12', N'0', 1, 0, 0, 0, 14, 0, 2, 0, 17, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1052, N'Redeemer', 2, 1, 11, 0, 0, 12, 5, 6, 5, 12, 17, N'16', N'0', 3, 0, 3, 0, 12, 0, 1, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1053, N'Castigator', 2, 1, 12, 0, 0, 12, 5, 6, 5, 10, 19, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 16, 16)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1054, N'Daughters of the Flame', 2, 2, 10, 0, 0, 2, 7, 6, 4, 14, 12, N'0', N'0', 0, 0, 0, 0, 0, 0, 0.5, 0.5, 9, 9)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1055, N'Knights Exemplar', 2, 2, 9, 0, 0, 12, 5, 7, 4, 12, 15, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 0, 11, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1056, N'Holy Zealots :Monolith Bearer', 2, 2, 3, 0, 17, 3, 6, 5, 4, 12, 12, N'0', N'0', 0, 0, 0, 0, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1057, N'Palladin of the Order of the Wall', 2, 3, 4, 0, 0, 3, 6, 8, 4, 13, 16, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1058, N'Flameguard Cleanserss :Officer', 2, 2, 4, 0, 1059, 2, 5, 7, 6, 11, 14, N'sp8', N'0', 1, 0, 0, 0, 12, 0, 1, 0, 10, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1059, N'Flameguard Cleansers', 2, 2, 9, 15, 0, 2, 5, 5, 4, 11, 14, N'sp8', N'0', 1, 0, 0, 0, 12, 0, 1, 0, 10, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1060, N'Gun Mage captain adept', 1, 3, 5, 0, 0, 2, 6, 5, 8, 14, 11, N'10', N'0', 1, 0, 0, 0, 10, 0, 0, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1061, N'Kodiak', 3, 1, 13, 0, 0, 12, 4, 7, 4, 10, 20, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 16, 16)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1062, N'Devestator', 3, 1, 14, 0, 0, 12, 4, 6, 4, 10, 23, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 16, 16)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1063, N'Berserker', 3, 1, 8, 0, 0, 12, 4, 6, 3, 11, 18, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 16, 16)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1064, N'Iron Fang Pikemen', 3, 2, 9, 15, 0, 12, 6, 7, 4, 12, 14, N'0', N'0', 0, 0, 0, 0, 0, 0, 2, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1065, N'Iron Fang Pikemen :Officer & standard', 3, 2, 4, 0, 1064, 12, 6, 8, 4, 12, 14, N'0', N'0', 0, 0, 0, 0, 0, 0, 2, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1066, N'Man-o-war Bombardiers', 3, 2, 10, 16, 0, 3, 4, 7, 6, 10, 16, N'12', N'0', 1, 0, 3, 0, 14, 0, 1, 0, 13, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1067, N'War Dog', 3, 3, 3, 0, 0, 1, 7, 6, 1, 13, 14, N'0', N'0', 0, 0, 0, 0, 0, 0, 0, 0, 11, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1068, N'Widowmaker Scouts', 3, 2, 8, 0, 0, 1, 6, 4, 7, 14, 11, N'14', N'0', 1, 0, 0, 0, 10, 0, 0.5, 0, 8, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1069, N'Corruptor', 4, 1, 14, 0, 0, 12, 6, 7, 5, 13, 17, N'12', N'0', 1, 0, 0, 0, 14, 0, 1, 0, 16, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1070, N'Defiler', 4, 1, 8, 0, 0, 12, 7, 5, 5, 14, 14, N'sp8', N'0', 1, 0, 0, 0, 10, 0, 1.5, 0, 7, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1071, N'Slayer', 4, 1, 10, 0, 0, 12, 6, 7, 4, 13, 17, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 16, 16)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1072, N'Bane Warriors :Officer & standard', 4, 2, 5, 0, 0, 3, 5, 5, 4, 12, 15, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 1, 11, 11)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1073, N'Bane Warriors', 4, 2, 10, 16, 0, 3, 5, 6, 4, 12, 15, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 0, 11, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1074, N'Satyxis Raiders', 4, 2, 10, 16, 0, 2, 7, 6, 4, 14, 12, N'0', N'0', 0, 0, 0, 0, 0, 0, 0.5, 2, 8, 9)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1075, N'Pistor Wraith', 4, 3, 5, 0, 0, 2, 6, 4, 7, 14, 12, N'10', N'10', 1, 1, 0, 0, 12, 12, 0, 0, 0, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1076, N'Bloat Thrall', 4, 3, 4, 0, 0, 2, 4, 5, 4, 10, 14, N'12', N'0', 1, 0, 4, 0, 14, 0, 0, 0, 10, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1077, N'Buccaneer', 6, 1, 7, 0, 0, 12, 6, 6, 5, 13, 16, N'8', N'0', 1, 0, 0, 0, 0, 0, 2, 0, 12, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1078, N'Nomad', 6, 1, 12, 0, 0, 12, 5, 6, 5, 10, 18, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 2, 14, 18)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1079, N'Precursor Knights', 6, 2, 8, 14, 0, 2, 6, 7, 4, 13, 14, N'0', N'0', 0, 0, 0, 0, 0, 0, 1, 0, 12, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1080, N'The Commodore cannon & crew', 6, 2, 7, 0, 0, 1, 6, 5, 4, 13, 11, N'0', N'8', 0, 1, 0, 0, 0, 10, 0, 0, 8, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1081, N'Lady Aiana & Master Holt', 6, 2, 8, 0, 0, 1, 6, 5, 8, 14, 11, N'12', N'12', 1, 1, 0, 0, 12, 12, 0.5, 0.5, 8, 8)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1082, N'Gorman di Wulfe Rogue Alchemist', 6, 3, 4, 0, 0, 1, 6, 5, 6, 14, 12, N'6', N'0', 1, 0, 3, 0, 99, 0, 0, 0, 6, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1083, N'Eiryss, Mage hunter of Ios', 6, 3, 7, 0, 0, 1, 7, 6, 9, 16, 12, N'12', N'0', 1, 0, 0, 0, 10, 0, 0, 0, 6, 7)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1084, N'Lord Rockbottom', 6, 3, 4, 0, 0, 1, 4, 6, 6, 12, 14, N'sp8', N'0', 1, 0, 0, 0, 12, 0, 0, 0, 10, 0)
INSERT [dbo].[Models] ([ModelID], [ModelName], [FactionID], [ModelType], [PointCost], [FullCrewPointCost], [AttachesToModelID], [FieldAllowence], [Speed], [MAT], [RAT], [DEF], [ARM], [RangedRNG1], [RangedRNG2], [ROF1], [ROF2], [AOE1], [AOE2], [RangedPOW1], [RangedPOW2], [MeleeRNG1], [MeleeRNG2], [MeleePOW1], [MeleePOW2]) VALUES (1085, N'Reinholdt, Gobber speculator', 6, 3, 4, 0, 0, 1, 7, 2, 2, 15, 10, N'0', N'0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Developer')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Administrator')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Privateer Pressganger')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (6, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (1, N'Sebastiaan', N'Sebastiaan', N'salt', N'sebastiaan@mail', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (14, N'Sylvia', N'AKtwzsQxO7lw4yaUse8aBfvLv8WJMlVSexnzqOjq79J4Y29HEbOTvRD09vymNWnFcg==', N'QxkOKBqLE7/UZ/lzNWx+k34Vi1k=', N'bert@mail.com', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (1019, N'Sep', N'AO2qjSh2SFTiSqUuyRFz/VOPC35xXmVbXQver/IS1Fer1iJHoOPbiTaDiOXu3h9YOA==', N'BGKoiaoMuwYtQgAZ0PfhQlRZk80=', N'Sep@mail.com', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (1023, N'Administrator', N'AEQmx1jIBzGhjUXakE/8dea0ZqdyTK2ms/QGYS9N9TeOk84D6/+9u3QxGQfR6KCodA==', N'NQ7zxGKE7h/Jdo4bszLpKiuObfE=', N'bobt@mail.com', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (1025, N'Pressganger', N'AJeG7R9maO+QwI53VDpLC6asM/z6xeAviVR7320Oj/fyNlEJIqoW01uIzrmMsV0TwA==', N'CEnp5Ku4gHog0sWoha5POmxqtQE=', N'bert@mail.com', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (1026, N'User', N'ACtSZL+mytaQgxUTznQPRU72V14ARweNBTyZOI8TQM01RnLkY/1F1NJd3iPeFkgG3A==', N'u+EOQt9EMEL0CaMhJ6TgycvVA/Q=', N'bert@mail.conn', 6)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (2026, N'chickenwingman', N'AFFqGhtCw5D5aHxwn8txNaXJesa+c0SBrJKs3GLVWP58yJ7ZetvNvPP91conGvetTw==', N'MPT94U7E4Au59YQn3HJ7WN8ncEg=', N'bigIggy@.com', 6)
INSERT [dbo].[Users] ([UserID], [UserName], [Hash], [Salt], [EmailAdress], [RoleID]) VALUES (2027, N'who', N'APcenXY/DlKiWl94cY8cU/61oQwMzGOX73qa5sRKoN6j6NXAgMXQC34PLUJJ4f77IQ==', N'LFh+utGjH/UL/I3KMnutavdTgWM=', N'bert@mail.com', 6)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_UserName]    Script Date: 11/11/2019 4:50:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Armies]  WITH CHECK ADD  CONSTRAINT [FK_Armies_Factions] FOREIGN KEY([FactionID])
REFERENCES [dbo].[Factions] ([FactionID])
GO
ALTER TABLE [dbo].[Armies] CHECK CONSTRAINT [FK_Armies_Factions]
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
/****** Object:  StoredProcedure [dbo].[ArmiesFindByUserID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmiesFindByUserID]
@UserID int,
@Skip int,
@Take int
as
begin
	select ArmyID, ArmyName, Armies.UserID, UserName, Comments , Armies.FactionID, FactionName  from Armies
	inner join Users on Armies.UserID = Users.UserID
	inner join Factions on Armies.FactionID = Factions.FactionID
	where Armies.UserID = @UserID
	order by ArmyID
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[ArmiesGetAll]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[ArmiesGetAll]
@skip int,
@take int
as
begin
	select ArmyID, ArmyName, Armies.UserID, UserName, Comments , Armies.FactionID, FactionName  from Armies
	inner join Users on Armies.UserID = Users.UserID
	inner join Factions on Armies.FactionID = Factions.FactionID
	order by ArmyID
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[ArmiesGetByUserID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ArmiesGetByUserID]
@UserID int
as
begin
	select ArmyID, ArmyName, Armies.UserID, UserName, Comments , Armies.FactionID, FactionName  from Armies
	inner join Users on Armies.UserID = Users.UserID
	inner join Factions on Armies.FactionID = Factions.FactionID
	where Armies.UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmiesObtainCount]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ArmiesObtainCount]
as
begin
	select count(*) from Armies
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyCreate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[ArmyCreate]
@ArmyName nvarchar(200),
@UserID int,
@Comments nvarchar(max),
@FactionID int

as
begin
  insert into Armies(ArmyName, UserID, Comments, FactionID) 
  values (@ArmyName, @UserID, @Comments, @FactionID)
 
  SELECT	'Return Value' = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyDelete]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyDelete]	
@ArmyID int
as
begin
delete from ArmyModels
where ArmyID = @ArmyID
delete from Armies
where ArmyID = @ArmyID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyDeleteWithModels]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ArmyDeleteWithModels]	
@ArmyID int
as
begin
delete from ArmyModels
where ArmyID = @ArmyID
delete from Armies
where ArmyID = @ArmyID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyFindByID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyFindByID]
@ArmyID int
as
begin
	select ArmyID, ArmyName, Armies.UserID, UserName, Comments , Armies.FactionID, FactionName  from Armies
	inner join Users on Armies.UserID = Users.UserID
	inner join Factions on Armies.FactionID = Factions.FactionID
	where ArmyID = @ArmyID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelFindByArmyIDAndModelID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyModelFindByArmyIDAndModelID]
@armyID int,
@ModelID int
as
begin

	select ArmyID, Quantity, FullSquats, Models.ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	left outer join ArmyModels on Models.MODELID = ArmyModels.ModelID --and @armyID = ArmyID
	where @ModelID = ArmyModels.ModelID and @armyID = ArmyID


end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelRecordCreate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[ArmyModelRecordCreate]
@ArmyID int,
@ModelID int,
@Quantity int,
@FullSquats int

as
begin
  insert into ArmyModels(ArmyID, ModelID, Quantity, FullSquats ) 
  values (@ArmyID, @ModelID, @Quantity, @FullSquats)
 end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelsDeleteByArmyID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ArmyModelsDeleteByArmyID]	
@ArmyID int
as
begin
delete from ArmyModels
where ArmyID = @ArmyID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelsFindByArmyID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyModelsFindByArmyID]
@ArmyID int,
@Skip int,
@Take int
as
begin

	select ArmyID, Quantity, FullSquats, Models.ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	inner join ArmyModels on Models.MODELID = ArmyModels.ModelID
	where @ArmyID = ArmyID
	order by ModelType, ModelName
	offset @skip rows
	fetch next @take rows only

end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelsFindByFactionID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyModelsFindByFactionID]
@ArmyID int,
@FactionID int,
@Skip int,
@Take int
as
begin

	select ArmyID, Quantity, FullSquats, Models.ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2  from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	left outer join ArmyModels on Models.MODELID = ArmyModels.ModelID and @ArmyID = ArmyID
	where @FactionID = Models.FactionID 
	order by ModelType ASC, Quantity DESC, ModelName
	offset @skip rows
	fetch next @take rows only

end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelsFindByFactionIDAndTypeID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyModelsFindByFactionIDAndTypeID]
@armyID int,
@FactionID int,
@ModelType int,
@Skip int,
@Take int
as
begin

	select ArmyID, Quantity, FullSquats, Models.ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	left outer join ArmyModels on Models.MODELID = ArmyModels.ModelID and @armyID = ArmyID
	where @FactionID = Models.FactionID and @ModelType = ModelType
	order by ModelName
	offset @skip rows
	fetch next @take rows only

end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelSingleDelete]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ArmyModelSingleDelete]	
@ArmyID int,
@ModelID int
as
begin
delete from ArmyModels
where ArmyID = @ArmyID AND ModelID = @ModelID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyModelsObtainModelCount]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ArmyModelsObtainModelCount]
@ArmyID int
as
begin
	select isnull(sum(Quantity),0) from ArmyModels
	where ArmyID = @ArmyID
end
GO
/****** Object:  StoredProcedure [dbo].[ArmyUpdate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[ArmyUpdate]
@ArmyID int,
@ArmyName nvarchar(200),
@UserID int,
@Comments nvarchar(max),
@FactionID int

as
begin
update Armies
	set ArmyName = @ArmyName, UserID = @UserID, Comments=@Comments, FactionID=@FactionID
	where ArmyID = @ArmyID
end
GO
/****** Object:  StoredProcedure [dbo].[FactionCreate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE proc [dbo].[FactionCreate]
@FactionName nvarchar(200),
@BackGround nvarchar(MAX)
as
begin
  declare @data int
  insert into Factions(FactionName, BackGround) values (@FactionName, @BackGround)
  SELECT	'Return Value' = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[FactionDelete]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[FactionDelete]	
@FactionID int
as
begin
delete from Factions
where FactionID = @FactionID
end
GO
/****** Object:  StoredProcedure [dbo].[FactionFindByID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[FactionFindByID]
@FactionID int
as
begin
	select FactionID, FactionName, BackGround from Factions
	where FactionID = @FactionID
end
GO
/****** Object:  StoredProcedure [dbo].[FactionsGetAll]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[FactionsGetAll]
@skip int,
@take int
as
begin
	select FactionID, FactionName, BackGround from Factions 
	order by FactionID
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[FactionsObtainCount]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[FactionsObtainCount]
as
begin
	select count(*) from Factions
end
GO
/****** Object:  StoredProcedure [dbo].[FactionUpdate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[FactionUpdate]
@FactionID   int, 
@FactionName nvarchar(200),
@BackGround nvarchar(MAX)
as
begin
	update Factions set FactionName = @Factionname, BackGround = @BackGround
	where  FactionID = @FactionID
end
GO
/****** Object:  StoredProcedure [dbo].[LogError]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[LogError]
@ErrorMessage nvarchar(250),
@Trace nvarchar(max)

as
begin
  insert into ErrorLog(ErrorMessage, Trace, time ) 
  values (@ErrorMessage, @Trace, GETDATE())
 
  SELECT	'Return Value' = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[ModelCreate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[ModelCreate]
@ModelName         nvarchar(200),
@FactionID         int,
@ModelType         int,
@PointCost         int,
@FullCrewPointCost int,
@AttachesToModelID int,
@FieldAllowence    int,
@Speed             int, 
@MAT               int,
@RAT               int, 
@DEF               int, 
@ARM               int,
@RangedRNG1        nvarchar(200),--this can be a range or a "spray template" so int won't work here
@RangedRNG2        nvarchar(200),
@ROF1              int,
@ROF2              int, 
@AOE1              int, 
@AOE2              int, 
@RangedPOW1        int,
@RangedPOW2        int,
@MeleeRNG1         float,
@MeleeRNG2         float,
@MeleePOW1         int,
@MeleePOW2         int

as
begin
  insert into Models(ModelName,FactionID,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, FieldAllowence, 
					 Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
					 RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 ) 

  values (@ModelName, @FactionID, @ModelType, @PointCost, @FullCrewPointCost, @AttachesToModelID,@FieldAllowence, 
		  @Speed, @MAT, @RAT, @DEF, @ARM, @RangedRNG1, @RangedRNG2, @ROF1, @ROF2, @AOE1, @AOE2, 
		  @RangedPOW1, @RangedPOW2, @MeleeRNG1, @MeleeRNG2, @MeleePOW1, @MeleePOW2)
 
  SELECT	'Return Value' = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[ModelDelete]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ModelDelete]	
@ModelID int
as
begin
-- We delete the Childs (models that attach to it)first (if any)
delete from Models
where AttachesToModelID = @ModelID
-- now we delete the parent 
delete from Models
where ModelID = @ModelID
end
GO
/****** Object:  StoredProcedure [dbo].[ModelFindByFactionAndType]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ModelFindByFactionAndType]
@FactionID int,
@ModelType int
as
begin

	select ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	where Models.FactionID = @FactionID and ModelType = @ModelType

end
GO
/****** Object:  StoredProcedure [dbo].[ModelFindByID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ModelFindByID]
@ModelID int
as
begin

	select ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	where ModelID = @ModelID

end
GO
/****** Object:  StoredProcedure [dbo].[ModelFindByType]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ModelFindByType]
@ModelType int
as
begin

	select ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	where ModelType = @ModelType

end
GO
/****** Object:  StoredProcedure [dbo].[ModelsFindByFactionID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ModelsFindByFactionID]
@FactionID int,
@skip int,
@Take int
as
begin

	select ModelID, ModelName,Models.FactionID, FactionName,ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	where Models.FactionID = @FactionID
		order by ModelType , ModelName
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[ModelsGetAll]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ModelsGetAll]
@skip int,
@take int
as
begin

	select ModelID, ModelName, Models.FactionID, FactionName, ModelType, PointCost, FullCrewPointCost, AttachesToModelID, 
		   FieldAllowence, Speed, MAT, RAT, DEF, ARM, RangedRNG1, RangedRNG2, ROF1, ROF2, AOE1, AOE2, 
		   RangedPOW1, RangedPOW2, MeleeRNG1, MeleeRNG2, MeleePOW1, MeleePOW2 from Models
	inner join Factions on Models.FactionID = Factions.FactionID
	order by FactionID , ModelType, ModelName
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[ModelsObtainCount]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ModelsObtainCount]
as
begin
	select count(*) from Models
end
GO
/****** Object:  StoredProcedure [dbo].[ModelUpdate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[ModelUpdate]
@ModelID			int,
@ModelName          nvarchar(200),
@FactionID          int,
@ModelType          int,
@PointCost          int,
@FullCrewPointCost  int,
@AttachesToModelID  int,
@FieldAllowence     int,
@Speed              int, 
@MAT                int,
@RAT                int, 
@DEF                int, 
@ARM                int,
@RangedRNG1         nvarchar(200),--this can be a range or a "spray template" so int won't work here
@RangedRNG2         nvarchar(200),
@ROF1               int,
@ROF2               int, 
@AOE1               int, 
@AOE2               int, 
@RangedPOW1         int,
@RangedPOW2         int,
@MeleeRNG1          int,
@MeleeRNG2          int,
@MeleePOW1          int,
@MeleePOW2          int
as
begin
	update Models 
	set ModelName = @ModelName, FactionID = @FactionID, ModelType = @ModelType, PointCost = @PointCost, 
		FullCrewPointCost = @FullCrewPointCost, AttachesToModelID = @AttachesToModelID, 
		FieldAllowence = @FieldAllowence, Speed = @Speed, MAT = @MAT, RAT = @RAT, DEF = @DEF, ARM = @ARM, 
		RangedRNG1 = @RangedRNG1, RangedRNG2 = @RangedRNG2, ROF1 = @ROF1, ROF2 = @ROF2, AOE1 = @AOE1, AOE2 = @AOE2, 
		RangedPOW1 = @RangedPOW1, RangedPOW2 = @RangedPOW2, MeleeRNG1 = @MeleeRNG1, MeleeRNG2 = @MeleeRNG2, 
		MeleePOW1 = @MeleePOW1, MeleePOW2 = @MeleePOW2

	where ModelID = @ModelID
	
end
GO
/****** Object:  StoredProcedure [dbo].[RoleCreate]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RoleDelete]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RoleFindByID]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RolesGetAll]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RolesObtainCount]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RoleUpdate]    Script Date: 11/11/2019 4:50:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserCreate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create proc [dbo].[UserCreate]
@UserName nvarchar(200),
@Hash nvarchar(200),
@Salt nvarchar(200),
@EmailAdress nvarchar(200),
@RoleID int

as
begin
  insert into Users(UserName, Hash, Salt, EmailAdress, RoleID ) 
  values (@UserName, @Hash, @Salt, @EmailAdress, @RoleID)
 
  SELECT	'Return Value' = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[UserDelete]	
@UserID int
as
begin

delete from ArmyModels
where ArmyID = (select ArmyID from Armies
where UserID = @UserID)

delete from Armies
where Armies.UserID = @UserID

delete from Users
where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[UserFindByID]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UserFindByID]
@UserID int
as
begin
	select UserID, UserName, Hash, Salt, EmailAdress, Roles.RoleID,  RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where userID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[UserFindByName]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[UserFindByName]
@UserName nvarchar(200)
as
begin
	select UserID, UserName, Hash, Salt, EmailAdress, Roles.RoleID,  RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where userName = @UserName
end
GO
/****** Object:  StoredProcedure [dbo].[UsersGetAll]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[UsersGetAll]
@skip int,
@take int
as
begin
	select UserID, UserName, Hash, Salt, EmailAdress, Roles.RoleID,  RoleName from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	order by UserID
	offset @skip rows
	fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[UsersObtainCount]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[UsersObtainCount]
as
begin
	select count(*) from Users
end
GO
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 11/11/2019 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create proc [dbo].[UserUpdate]
@UserID int,
@UserName nvarchar(200),
@Hash nvarchar(200),
@Salt nvarchar(200),
@EmailAdress nvarchar(200),
@RoleID int

as
begin
	update Users 
	set UserName = @UserName, Hash = @Hash, Salt = @Salt,EmailAdress = @EmailAdress , RoleID = @RoleID
	where UserID = @UserID
	
end
GO
USE [master]
GO
ALTER DATABASE [ArmyBuilder] SET  READ_WRITE 
GO
