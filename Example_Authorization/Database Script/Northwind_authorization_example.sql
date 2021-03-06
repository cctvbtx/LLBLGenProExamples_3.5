USE [Northwind]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/25/2007 15:51:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[User]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [varchar](15) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[FullName] [varchar](150) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 09/25/2007 15:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Group]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Group](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 09/25/2007 15:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UserGroup]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserGroup](
	[UserId] [varchar](15) NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[GroupId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_UserGroup_Group]    Script Date: 09/25/2007 15:51:41 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroup_Group]') AND type = 'F')
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_Group]
GO
/****** Object:  ForeignKey [FK_UserGroup_User]    Script Date: 09/25/2007 15:51:41 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroup_User]') AND type = 'F')
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_User]
GO

INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('cr1','cr1','Customer Relations 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('crm1','crm1','Customer Relations Manager 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('hr1','hr1','Human Resources 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('hrm1','hrm1','Human Resources Manager 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('leuk1','leuk1','Legal UK 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('leus1','leus1','Legal US 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('mk1','mk1','Marketing 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('s1','s1','Sales 1')
INSERT INTO [Northwind].[dbo].[User]([UserID],[Password],[FullName])VALUES('sm1','sm1','Sales Manager 1')
GO

INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(1,'Sales')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(2,'Human Resources')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(3,'Purchase')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(4,'Legal')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(5,'Information Technology')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(6,'Customer Relations')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(7,'Marketing')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(8,'Managers')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(9,'UK')
INSERT INTO [Northwind].[dbo].[Group]([Id],[Name])VALUES(10,'USA')
GO

INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('cr1',6)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('crm1',6)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('crm1',8)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('hr1',2)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('hrm1',2)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('hrm1',8)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('leuk1',4)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('leuk1',9)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('leus1',4)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('leus1',10)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('mk1',7)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('s1',1)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('sm1',1)
INSERT INTO [Northwind].[dbo].[UserGroup]([UserId],[GroupId])VALUES('sm1',8)
GO