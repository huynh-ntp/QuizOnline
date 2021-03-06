USE [master]
GO
/****** Object:  Database [QuizOnline]    Script Date: 2/26/2021 2:07:51 PM ******/
CREATE DATABASE [QuizOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizOnline', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuizOnline.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuizOnline_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuizOnline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuizOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizOnline] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuizOnline]
GO
/****** Object:  Table [dbo].[tblQuestionBanks]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuestionBanks](
	[questionID] [varchar](50) NOT NULL,
	[questionContent] [varchar](1000) NOT NULL,
	[anwserContent1] [varchar](1000) NOT NULL,
	[anwserContent2] [varchar](1000) NOT NULL,
	[anwserContent3] [varchar](1000) NOT NULL,
	[anwserContent4] [varchar](1000) NOT NULL,
	[anwserCorrect] [varchar](1000) NOT NULL,
	[createDate] [smalldatetime] NOT NULL,
	[updateDate] [smalldatetime] NULL,
	[subjectID] [varchar](50) NOT NULL,
	[status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblResults]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblResults](
	[resultID] [varchar](50) NOT NULL,
	[testsID] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[marks] [float] NOT NULL,
	[numOfCorrectAnwsers] [int] NOT NULL,
	[time] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[resultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](50) NOT NULL,
	[roleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubjects]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubjects](
	[subjectID] [varchar](50) NOT NULL,
	[subjectName] [varchar](50) NOT NULL,
	[status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTests]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTests](
	[testsID] [varchar](50) NOT NULL,
	[subjectID] [varchar](50) NOT NULL,
	[timeToDo] [int] NOT NULL,
	[createDate] [smalldatetime] NOT NULL,
	[status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[testsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTestsDetails]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTestsDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[testsID] [varchar](50) NOT NULL,
	[questionID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 2/26/2021 2:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [varchar](50) NULL,
	[roleID] [varchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'0126018987', N'Which three digit error codes represent an error in request from client? Select the one correct answer.', N'Codes starting from 200', N'Codes starting from 300', N'Codes starting from 400', N'Codes starting from 500', N'Codes starting from 400', CAST(N'2021-02-20 11:58:00' AS SmallDateTime), CAST(N'2021-02-20 15:39:00' AS SmallDateTime), N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'0594300760', N'Dependency/Link', N'Product owner', N'Development team', N'Tester', N'Scrum master', N' Tester', CAST(N'2021-02-20 17:13:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'0676949187', N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct?', N'It is accessible to all the servlets of the webapp.', N'It is accessible to all the servlets of all the webapps of the container.', N'It is accessible only to the servlet it is defined for.', N'java null', N'It is accessible to all the servlets of the webapp.', CAST(N'2021-02-20 16:17:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'0875548131', N'Which method can be invoked on a session object so that it is never invalidated by the servlet container automatically?', N'setMaxInactiveInterval(-1)', N'setMaxInactiveInterval(-1)', N'setMaxInactiveInterval(Integer.MAX_INT)', N'setTimeOut(-1)', N'setMaxInactiveInterval(-1)', CAST(N'2021-02-20 17:05:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'0876624208', N'Classes HttpServlet and GenericServlet implement the ___ interface.', N'Servlet', N'Http', N'HttpServletRequest', N'HttpServletResponse', N'Servlet', CAST(N'2021-02-20 11:59:00' AS SmallDateTime), CAST(N'2021-02-26 14:02:00' AS SmallDateTime), N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1039550125', N'Of the following services, which service(s) does the IP layer provides?', N'Error control', N'Flow control', N'Connection-based data transfer', N'None of the above', N'None of the above', CAST(N'2021-02-20 17:02:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1124007655', N'Name the default value of the scope attribute of <jsp:useBean>', N'page', N'session', N'application', N'request', N'page', CAST(N'2021-02-20 17:07:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1348138053', N'Which OSI layer is responsible for providing end-to-end communication with reliable service?', N'Session layer', N'Network layer', N'Transport layer', N'Data link layer', N'Transport layer', CAST(N'2021-02-20 16:59:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1404595420', N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct?', N'It is accessible to all the servlets of the webapp.', N'It is accessible to all the servlets of all the webapps of the container.', N'It is accessible only to the servlet it is defined for.', N'java null', N'It is accessible to all the servlets of the webapp.', CAST(N'2021-02-20 16:18:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1542514653', N'Which of following protocol is HTTP built upon?', N'SMTP', N'UDP', N'TCP', N'IP', N'TCP', CAST(N'2021-04-02 00:00:00' AS SmallDateTime), CAST(N'2021-02-20 15:17:00' AS SmallDateTime), N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1602998204', N'Which of the following method calls can be used to retrieve an object from the session that was stored using the name "roleName"?', N'getObject("roleName");', N'getObject("roleName");', N'get("roleName");', N'getAttribute("roleName");', N'getAttribute("roleName");', CAST(N'2021-02-20 17:04:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'1650234374', N'Select the correct directive statement insert into the first line of following lines of code (1 insert code here):', N'<%@page import=''java.util.*'' %>', N'<%@import package=''java.util.*'' %>', N'<%@ package import =''java.util.*'' %>', N'<%! page import=''java.util.*'' %>', N'<%@page import=''java.util.*'' %>', CAST(N'2021-02-20 17:07:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'2093933416', N'Which of the following is indicated by URL, which is used on the Internet?', N'Information resources(sources) on the Internet', N'E-mail addresses for use in the Internet', N'IP addresses of servers connected to the Internet', N'Owners of PCs connected to the Internet', N'Information resources(sources) on the Internet', CAST(N'2021-02-20 12:03:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'2138374512', N'What was the concern of the telephone system that motivated the ARPANET design?', N'Scalability', N'Vulnerability', N'Efficiency', N'None of the above', N'Vulnerability', CAST(N'2021-04-02 00:00:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'2215541093', N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct?', N'It is accessible to all the servlets of the webapp.', N'It is accessible to all the servlets of all the webapps of the container.', N'It is accessible only to the servlet it is defined for.', N'java null', N'It is accessible to all the servlets of the webapp.', CAST(N'2021-02-20 16:16:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'2354030601', N'Bluetooth is an example of', N'Personal Area Network', N'Metropolitan Area Network', N'Local Area Network', N'Wide Area Network', N'Personal Area Network', CAST(N'2021-02-18 18:34:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3030460851', N'What are the different scope values for the ‹jsp:useBean›? (Choose one correct answer)', N'session, page, application, request', N'session, page, application, request', N'session, page, application, global', N'session, page, response, request', N'session, page, application, request', CAST(N'2021-02-20 17:06:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3060802794', N'Which feature does the data link layer and transport layer have in common?', N'Medium access control', N'All of the above', N'Flow control', N'Congestion control', N'Flow control', CAST(N'2021-02-20 17:00:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3246194782', N'Which of the following is indicated by URL, which is used on the Internet?', N'Information resources(sources) on the Internet', N'E-mail addresses for use in the Internet', N'IP addresses of servers connected to the Internet', N'Owners of PCs connected to the Internet', N'Information resources(sources) on the Internet', CAST(N'2021-02-20 12:03:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3402635422', N'When the design is complete', N' Use case testing', N'Alpha testing', N'Alpha testing', N'Beta testing', N' Use case testing', CAST(N'2021-02-20 17:11:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3509691130', N'During the software development process, at what point can the test process start?', N'During the software development process, at what point can the test process start?', N' When the software requirements have been approved', N'When the f?irst code module is ready for unit testing', N'When the code is complete', N' When the software requirements have been approved', CAST(N'2021-02-20 17:10:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3599185764', N'In a LAN, which address is used to transfer frames to appropriate destination?', N'IP address', N'Physical address', N'Domain name', N'None of the above', N'Physical address', CAST(N'2021-02-20 17:01:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'3848721555', N'Which protocol glues the network of networks together as the Internet?', N'TCP', N'UDP', N'IP', N'None of the above', N'IP', CAST(N'2021-02-20 17:01:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4011760557', N'This layer is an addition to OSI model', N'Application layer', N'Presentation layer', N'Session layer', N'Presentation layer and Session layer', N'Presentation layer and Session layer', CAST(N'2021-02-20 17:03:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4032760620', N'Which technique is likely to return an initialization parameter for a JSP page?', N'Which technique is likely to return an initialization parameter for a JSP page?', N'<% String s = getInitParameter("myParm"); %>', N'<% String s = getInitParameter("myParm"); %>', N'<%= getParameter("myParm") %>', N'<% String s = getInitParameter("myParm"); %>', CAST(N'2021-02-20 17:08:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4109787395', N'In the following descriptions, which is the CORRECT description of DYNAMIC models?', N'In the following descriptions, which is the CORRECT description of DYNAMIC models?', N'Dynamic models are used to show the structure of the system design', N'Dynamic models are used show the object classes in the system and the associations between these classes.', N'Dynamic models are used show the object classes in the system and the associations between these layout.', N'In the following descriptions, which is the CORRECT description of DYNAMIC models?', CAST(N'2021-02-20 17:10:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4269519792', N'Which jsp tag can be used to set bean property?', N'jsp:useBean', N'jsp:useBean.property', N'jsp:useBean.property', N'jsp:setProperty', N'jsp:setProperty', CAST(N'2021-02-20 17:09:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4365370780', N'JSP ____ let you inserts arbitrary code into servlet''s _jspService method (which is called by service)', N'declarations', N'scriptlets', N'expressions', N'java', N'scriptlets', CAST(N'2021-02-20 11:58:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4388669475', N'Which of the following are features of ARPANET design?', N'Connectionless packet transmission', N'Routing tables at the packet switches', N'Destinations identified by unique addresses', N'All of the above', N'All of the above', CAST(N'2021-02-18 18:28:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'4955915407', N'Which is NOT a standard technique for a session be definitely invalidated?', N'The container is shutdown and brought up again.', N'No request comes from the client for more than "session timeout" period.', N'A servlet explicitly calls invalidate() on a session object.', N'A servlet explicitly calls invalidate() on a session object.', N'If the session time out is set to 0 using setMaxInactiveInterval() method.', CAST(N'2021-02-20 17:05:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'5086393746', N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct?', N'It is accessible to all the servlets of the webapp.', N'It is accessible to all the servlets of all the webapps of the container.', N'It is accessible only to the servlet it is defined for.', N'java null', N'It is accessible to all the servlets of the webapp.', CAST(N'2021-02-20 16:13:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'5194663093', N'You have to send a gif image to the client as a response to a request. Which of the following calls will you have to make?', N'response.setContentType("image/gif");', N'response.setType("application/gif");', N'response.setContentType("application/bin");', N'response.setType("image/gif");', N'response.setContentType("image/gif");', CAST(N'2021-02-20 12:00:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'5261532624', N'The cost of f?ixing a fault:', N'The cost of f?ixing a fault:', N'increases the later a fault is found', N'The cost of f?ixing a fault:', N' can never be determined', N'The cost of f?ixing a fault:', CAST(N'2021-02-20 17:11:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'5869731889', N'In the layer hierarchy as the data packet moves from the upper to the lower layers, headers are', N'Modified', N'Added', N'Rearranged', N'Removed', N'Added', CAST(N'2021-02-18 18:35:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'6568367054', N'For JSP scopes of request and page, what type of object is used to store the attributes?', N'HttpServletRequest and ServletContext respectively.', N'ServletRequest and ServletConfig respectively.', N'ServletRequest and PageContext respectively.', N'HttpServletRequest and PageContext respectively.', N'HttpServletRequest and ServletContext respectively.', CAST(N'2021-02-20 17:07:00' AS SmallDateTime), NULL, N'PRJ321', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8186860193', N'Which of following statements is true about how the data link layer and transport layer differ?', N'Data link layer is concerned with framing and the transport layer is not', N'Data link layer is concerned with flow control and the transport layer is not', N'Data link layer is concerned with multiplexing and the transport layer is not', N'All of the above', N'Data link layer is concerned with framing and the transport layer is not', CAST(N'2021-02-20 17:03:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8221434785', N'Which OSI layer is responsible for dividing the transmitted bit stream into frames?', N'Network layer', N'Data link layer', N'Transport layer', N'Application layer', N'Data link layer', CAST(N'2021-02-20 16:59:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8451254845', N'Which of following requirements are necessary for packet networks to support multiple and diverse applications?', N'ransfer arbitrary message size', N'Low delay for interactive applications', N'Packets have maximum length', N'All of the above', N'All of the above', CAST(N'2021-04-02 00:00:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8602208713', N'Which of the following is true about the ways in which the OSI reference model and TCP/IP reference model differ.', N'All of the above', N'TCP/IP model does not have presentation layer, but OSI model has', N'They differ in the number of layers', N'TCP/IP model does not have session layer, but OSI model has', N'All of the above', CAST(N'2021-02-20 17:02:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8818842785', N'Acording to Guimaraes (1983) the Maintenance effort Distribution of Environmental Adaptation is :', N'18 %', N'65 %', N'17 %', N'17 %', N'18 %', CAST(N'2021-02-20 17:12:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8873003401', N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct?', N'It is accessible to all the servlets of the webapp.', N'It is accessible to all the servlets of all the webapps of the container.', N'It is accessible only to the servlet it is defined for.', N'java null', N'It is accessible to all the servlets of the webapp.', CAST(N'2021-02-20 16:15:00' AS SmallDateTime), CAST(N'2021-02-26 14:01:00' AS SmallDateTime), N'PRJ321', 0)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'8985317818', N'Which OSI layer is responsible for determining which route through the network to use?', N'Network layer', N'Data link layer', N'Transport layer', N'None of the above', N'Network layer', CAST(N'2021-02-20 17:00:00' AS SmallDateTime), NULL, N'NWC203c', 1)
INSERT [dbo].[tblQuestionBanks] ([questionID], [questionContent], [anwserContent1], [anwserContent2], [anwserContent3], [anwserContent4], [anwserCorrect], [createDate], [updateDate], [subjectID], [status]) VALUES (N'9270562696', N'In UML notation, which relationship is the "-->"used to indicate?', N'Generalization', N'Generalization', N'Realization', N'Dependency/Link', N'Dependency/Link', CAST(N'2021-02-20 17:12:00' AS SmallDateTime), NULL, N'SWE102', 1)
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'0228413366', N'NWC203c-Q1', N'phihuynhnguyen164@gmail.com', 10, 3, CAST(N'2021-02-18 00:19:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'3432082735', N'NWC203c-Q2', N'phihuynhnguyen164@gmail.com', 6, 3, CAST(N'2021-02-20 18:39:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'3858304650', N'PRJ321-Q1', N'phihuynhnguyen164@gmail.com', 4, 2, CAST(N'2021-02-20 18:29:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'5011621258', N'NWC203c-Q1', N'phihuynhnguyen164@gmail.com', 6.6666665077209473, 2, CAST(N'2021-02-17 11:59:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'5347819493', N'NWC203c-Q1', N'phihuynhnguyen164@gmail.com', 0, 0, CAST(N'2021-02-18 00:19:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'5670674539', N'PRJ321-Q2', N'phihuynhnguyen164@gmail.com', 5, 2, CAST(N'2021-02-23 15:16:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'5901799438', N'NWC203c-Q1', N'phihuynhnguyen164@gmail.com', 10, 3, CAST(N'2021-02-18 17:29:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'5912851121', N'NWC203c-Q1', N'phihuynh120120@gmail.com', 7.1428570747375488, 5, CAST(N'2021-02-23 11:59:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'6558245402', N'PRJ321-Q2', N'phihuynhnguyen164@gmail.com', 5, 2, CAST(N'2021-02-26 14:01:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'6867715014', N'NWC203c-Q1', N'phihuynh120120@gmail.com', 1.4285714626312256, 1, CAST(N'2021-02-23 12:00:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'6972641567', N'NWC203c-Q2', N'phihuynhnguyen164@gmail.com', 4, 2, CAST(N'2021-02-23 15:39:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'7058730125', N'NWC203c-Q1', N'phihuynhnguyen164@gmail.com', 0, 0, CAST(N'2021-02-17 12:01:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'7766834452', N'NWC203c-Q1', N'phihuynhnguyen164@gmail.com', 3.3333332538604736, 1, CAST(N'2021-02-18 00:19:00' AS SmallDateTime))
INSERT [dbo].[tblResults] ([resultID], [testsID], [email], [marks], [numOfCorrectAnwsers], [time]) VALUES (N'7997456847', N'NWC203c-Q2', N'phihuynhnguyen164@gmail.com', 4, 2, CAST(N'2021-02-23 15:32:00' AS SmallDateTime))
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Administrator')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'ST', N'Student')
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'NWC203c', N'Computer Networking', 1)
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'PRJ321', N'Web-Based Java Applications', 1)
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName], [status]) VALUES (N'SWE102', N'Introduction to Software Engineering ', 1)
INSERT [dbo].[tblTests] ([testsID], [subjectID], [timeToDo], [createDate], [status]) VALUES (N'NWC203c-Q1', N'NWC203c', 5, CAST(N'2021-02-04 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[tblTests] ([testsID], [subjectID], [timeToDo], [createDate], [status]) VALUES (N'NWC203c-Q2', N'NWC203c', 5, CAST(N'2021-02-04 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[tblTests] ([testsID], [subjectID], [timeToDo], [createDate], [status]) VALUES (N'PRJ321-Q1', N'PRJ321', 5, CAST(N'2021-02-15 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[tblTests] ([testsID], [subjectID], [timeToDo], [createDate], [status]) VALUES (N'PRJ321-Q2', N'PRJ321', 5, CAST(N'2021-02-20 00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[tblTestsDetails] ON 

INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (1, N'NWC203c-Q1', N'0126018987')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (2, N'NWC203c-Q1', N'2354030601')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (3, N'NWC203c-Q1', N'4388669475')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (6, N'NWC203c-Q1', N'1542514653')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (7, N'NWC203c-Q1', N'5869731889')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (8, N'NWC203c-Q1', N'3060802794')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (9, N'NWC203c-Q1', N'3599185764')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (10, N'NWC203c-Q2', N'1348138053')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (11, N'NWC203c-Q2', N'1542514653')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (13, N'NWC203c-Q2', N'2138374512')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (14, N'NWC203c-Q2', N'2354030601')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (15, N'NWC203c-Q2', N'3848721555')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (16, N'PRJ321-Q1', N'0126018987')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (17, N'PRJ321-Q1', N'0676949187')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (18, N'PRJ321-Q1', N'0875548131')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (19, N'PRJ321-Q1', N'0876624208')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (20, N'PRJ321-Q1', N'1124007655')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (21, N'PRJ321-Q2', N'1602998204')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (22, N'PRJ321-Q2', N'1650234374')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (23, N'PRJ321-Q2', N'3030460851')
INSERT [dbo].[tblTestsDetails] ([ID], [testsID], [questionID]) VALUES (25, N'PRJ321-Q2', N'3246194782')
SET IDENTITY_INSERT [dbo].[tblTestsDetails] OFF
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'huynhntpse140798@fpt.edu.vn', N'Phi Huỳnh', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e9', N'AD', 1)
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'phihuynh120120@gmail.com', N'Phi Huynh', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e9', N'ST', 1)
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'phihuynhnguyen164@gmail.com', N'Huỳnh Nè', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e9', N'ST', 1)
ALTER TABLE [dbo].[tblQuestionBanks]  WITH CHECK ADD  CONSTRAINT [ADD3] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestionBanks] CHECK CONSTRAINT [ADD3]
GO
ALTER TABLE [dbo].[tblResults]  WITH CHECK ADD  CONSTRAINT [ADD4] FOREIGN KEY([testsID])
REFERENCES [dbo].[tblTests] ([testsID])
GO
ALTER TABLE [dbo].[tblResults] CHECK CONSTRAINT [ADD4]
GO
ALTER TABLE [dbo].[tblResults]  WITH CHECK ADD  CONSTRAINT [ADD5] FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblResults] CHECK CONSTRAINT [ADD5]
GO
ALTER TABLE [dbo].[tblTests]  WITH CHECK ADD  CONSTRAINT [ADD2] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblTests] CHECK CONSTRAINT [ADD2]
GO
ALTER TABLE [dbo].[tblTestsDetails]  WITH CHECK ADD  CONSTRAINT [ADD6] FOREIGN KEY([testsID])
REFERENCES [dbo].[tblTests] ([testsID])
GO
ALTER TABLE [dbo].[tblTestsDetails] CHECK CONSTRAINT [ADD6]
GO
ALTER TABLE [dbo].[tblTestsDetails]  WITH CHECK ADD  CONSTRAINT [ADD7] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestionBanks] ([questionID])
GO
ALTER TABLE [dbo].[tblTestsDetails] CHECK CONSTRAINT [ADD7]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [ADD1] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [ADD1]
GO
USE [master]
GO
ALTER DATABASE [QuizOnline] SET  READ_WRITE 
GO
