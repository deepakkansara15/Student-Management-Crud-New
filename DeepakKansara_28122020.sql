USE [master]
GO
/****** Object:  Database [Interview_26122020_DeepakKansara]    Script Date: 12/28/2020 3:18:27 PM ******/
CREATE DATABASE [Interview_26122020_DeepakKansara]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Interview_26122020_DeepakKansara', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Interview_26122020_DeepakKansara.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Interview_26122020_DeepakKansara_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Interview_26122020_DeepakKansara_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Interview_26122020_DeepakKansara].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ARITHABORT OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET RECOVERY FULL 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET  MULTI_USER 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Interview_26122020_DeepakKansara', N'ON'
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET QUERY_STORE = OFF
GO
USE [Interview_26122020_DeepakKansara]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/28/2020 3:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Course] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/28/2020 3:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [char](1) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 12/28/2020 3:18:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentCourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (1, N'HINDI')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (2, N'ENGLISH')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (3, N'PHYSICS')
INSERT [dbo].[Course] ([CourseId], [Course]) VALUES (4, N'CHEMESTRY')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (1, N'Test', CAST(N'2011-01-26T00:00:00.000' AS DateTime), N'M')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (2, N'Test', CAST(N'2010-03-02T00:00:00.000' AS DateTime), N'M')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (3, N'Test', CAST(N'2011-01-12T00:00:00.000' AS DateTime), N'M')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (5, N'Testing', CAST(N'2015-01-26T00:00:00.000' AS DateTime), N'M')
INSERT [dbo].[Student] ([StudentId], [Name], [DateOfBirth], [Gender]) VALUES (6, N'Testing 123', CAST(N'2001-08-01T00:00:00.000' AS DateTime), N'M')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentCourse] ON 

INSERT [dbo].[StudentCourse] ([StudentCourseId], [CourseId], [StudentId]) VALUES (1, 2, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [CourseId], [StudentId]) VALUES (2, 2, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [CourseId], [StudentId]) VALUES (3, 3, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [CourseId], [StudentId]) VALUES (5, 2, 5)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [CourseId], [StudentId]) VALUES (6, 2, 6)
SET IDENTITY_INSERT [dbo].[StudentCourse] OFF
GO
/****** Object:  StoredProcedure [dbo].[GETCOURSE]    Script Date: 12/28/2020 3:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETCOURSE]
AS
SELECT CourseId,Course FROM Course
GO
/****** Object:  StoredProcedure [dbo].[STUDENTS_CRUD]    Script Date: 12/28/2020 3:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STUDENTS_CRUD]  
(  
@StudentId INT=0,  
@Name VARCHAR(100)='',  
@DateOfBirth VARCHAR(100)='',  
@Gender CHAR(1)='M',
@CourseId INT=0,
@OPERATION VARCHAR(100),  
@P_iDisplayLength int= 10,    
@P_iDisplayStart int= 0,  
@P_SearchStr varchar(100) = '',  
@P_User_ID numeric(10,0) = 0,  
@P_orderDir varchar(100) = '',  
@P_orderColName varchar(100) = '',  
@SP_Out VARCHAR(50)='' OUTPUT  
)  
AS  
BEGIN  
  
IF @OPERATION='INSERT'  
BEGIN  
 INSERT INTO Student (Name,DateOfBirth,Gender)  
 VALUES (@Name,@DateOfBirth,@Gender)  
 IF SCOPE_IDENTITY()>0  
 BEGIN
 IF EXISTS (SELECT 1 FROM StudentCourse WHERE StudentId=SCOPE_IDENTITY())
 BEGIN
	UPDATE StudentCourse SET CourseId=@CourseId WHERE StudentId=SCOPE_IDENTITY()
 END
 ELSE
 BEGIN
	INSERT INTO StudentCourse (CourseId,StudentId)
	VALUES (@CourseId,SCOPE_IDENTITY())
 END
  SET @SP_Out=SCOPE_IDENTITY()
 END  
END  
  
IF @OPERATION='UPDATE'  
BEGIN  
 UPDATE Student SET Name=@Name,DateOfBirth=@DateOfBirth,Gender=@Gender WHERE StudentId=@StudentId
 UPDATE StudentCourse SET CourseId=@CourseId WHERE StudentId=@StudentId
 SET @SP_Out=@StudentId  
END  
  
IF @OPERATION='DELETE'  
BEGIN  
 DELETE FROM Student WHERE StudentId=@StudentId
 DELETE FROM StudentCourse WHERE StudentId=@StudentId
 SET @SP_Out=@StudentId  
END  
  
IF @OPERATION='SELECT'  
BEGIN  
 Declare @OrderBy varchar(100) = '';  
 Declare @OrderDir varchar(100) = '';  
  
 SET @OrderBy = @P_orderColName;  
 SET @OrderDir = @P_orderDir;  
  
 SELECT A.StudentId,Name,FORMAT(DateOfBirth,'MMM dd, yyyy')DateOfBirth,DATEDIFF(YY,DateOfBirth,GETDATE()) AGE,ISNULL(Gender,'M')Gender,B.CourseId
 FROM Student A WITH(NOLOCK)
 JOIN StudentCourse B WITH(NOLOCK) ON A.StudentId=B.StudentId
 WHERE (A.StudentId=@StudentId OR @StudentId=0)
 --SELECT *,COUNT(*) OVER() as TotalRow FROM  
 --(  
 --SELECT StudentId,Name,DateOfBirth,Gender FROM Student  
 --)A  
 --WHERE (@P_SearchStr = '' OR Name LIKE '%'+@P_SearchStr+'%')  
 --ORDER BY StudentId DESC  
 --OFFSET @P_iDisplayStart ROWS  
 --FETCH NEXT @P_iDisplayLength ROWS ONLY  
END

IF @OPERATION='SELECTBYID'  
BEGIN
 SELECT A.StudentId,Name,FORMAT(DateOfBirth,'MM/dd/yyyy')DateOfBirth,DATEDIFF(YY,DateOfBirth,GETDATE()) AGE,ISNULL(Gender,'M')Gender,B.CourseId
 FROM Student A WITH(NOLOCK)
 JOIN StudentCourse B WITH(NOLOCK) ON A.StudentId=B.StudentId
 WHERE A.StudentId=@StudentId
END
  
END
GO
USE [master]
GO
ALTER DATABASE [Interview_26122020_DeepakKansara] SET  READ_WRITE 
GO
