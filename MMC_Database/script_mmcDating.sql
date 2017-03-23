USE [MMCDating]
GO
/****** Object:  ForeignKey [FK_UsersLikes_Likes]    Script Date: 10/05/2015 17:06:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Likes]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes] DROP CONSTRAINT [FK_UsersLikes_Likes]
GO
/****** Object:  ForeignKey [FK_UsersLikes_Users]    Script Date: 10/05/2015 17:06:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes] DROP CONSTRAINT [FK_UsersLikes_Users]
GO
/****** Object:  Table [dbo].[UsersLikes]    Script Date: 10/05/2015 17:06:50 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Likes]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes] DROP CONSTRAINT [FK_UsersLikes_Likes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes] DROP CONSTRAINT [FK_UsersLikes_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersLikes]') AND type in (N'U'))
DROP TABLE [dbo].[UsersLikes]
GO
/****** Object:  Table [dbo].[UsersLoginLog]    Script Date: 10/05/2015 17:06:52 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UsersLoginLog_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersLoginLog] DROP CONSTRAINT [DF_UsersLoginLog_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersLoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[UsersLoginLog]
GO
/****** Object:  Table [dbo].[UsersMessages]    Script Date: 10/05/2015 17:06:52 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UsersMessages_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersMessages] DROP CONSTRAINT [DF_UsersMessages_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersMessages]') AND type in (N'U'))
DROP TABLE [dbo].[UsersMessages]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 10/05/2015 17:06:43 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Likes_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [DF_Likes_IsActive]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Likes]') AND type in (N'U'))
DROP TABLE [dbo].[Likes]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/05/2015 17:06:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/05/2015 17:06:45 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_IsEmailConfirm]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_IsEmailConfirm]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_ModifiedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_IsActive]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UsersChats]    Script Date: 10/05/2015 17:06:46 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UsersChats_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersChats] DROP CONSTRAINT [DF_UsersChats_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersChats]') AND type in (N'U'))
DROP TABLE [dbo].[UsersChats]
GO
/****** Object:  Table [dbo].[UsersContacts]    Script Date: 10/05/2015 17:06:48 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UsersContacts_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersContacts] DROP CONSTRAINT [DF_UsersContacts_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_UsersContacts_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersContacts] DROP CONSTRAINT [DF_UsersContacts_ModifiedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersContacts]') AND type in (N'U'))
DROP TABLE [dbo].[UsersContacts]
GO
/****** Object:  Table [dbo].[UsersContacts]    Script Date: 10/05/2015 17:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersContacts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersContacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NULL,
	[ToUserId] [int] NULL,
	[IsConfirmed] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_UsersContacts_CreatedDate]  DEFAULT (getdate()),
	[ModifiedDate] [datetime] NULL CONSTRAINT [DF_UsersContacts_ModifiedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_UsersContacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UsersContacts] ON
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (16, 46, 48, 1, CAST(0x0000A51A0136BBE7 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (17, 47, 48, 1, CAST(0x0000A51A01405D92 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (18, 0, 54, 0, CAST(0x0000A51B00F086BA AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (19, 51, 51, 1, CAST(0x0000A51B00F177E2 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (20, 56, 56, 0, CAST(0x0000A51B00F30C57 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (21, 51, 13, 1, CAST(0x0000A51B00F393DD AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (22, 55, 33, 0, CAST(0x0000A51B011CEBBB AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (23, 55, 56, 0, CAST(0x0000A51B01217013 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (24, 13, 55, 1, CAST(0x0000A51B01227818 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (25, 0, 22, 0, CAST(0x0000A51B013741B0 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (26, 0, 55, 1, CAST(0x0000A51B013E2902 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (27, 21, 55, 1, CAST(0x0000A52400544831 AS DateTime), NULL)
INSERT [dbo].[UsersContacts] ([Id], [FromUserId], [ToUserId], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (28, 1, 48, 1, CAST(0x0000A52501230126 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UsersContacts] OFF
/****** Object:  Table [dbo].[UsersChats]    Script Date: 10/05/2015 17:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersChats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersChats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[Message] [varchar](2000) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UsersChats_CreatedDate]  DEFAULT (getdate()),
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_UsersChats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UsersChats] ON
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (19, 48, 47, N'xxx', CAST(0x0000A51B0113D63B AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (20, 48, 46, N'asxasxasxasx', CAST(0x0000A51B0115E67A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (21, 46, 48, N'xasxasxasx', CAST(0x0000A51B0116F61C AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (22, 46, 48, N'hello', CAST(0x0000A51B011D9E1F AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (23, 48, 46, N'jhbdjwejhdcwe', CAST(0x0000A51B011DB2C5 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (24, 48, 46, N'Helloxcasxasxas', CAST(0x0000A51B011E80C7 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (25, 46, 48, N'hi', CAST(0x0000A51B011E8F80 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (26, 48, 46, N'saxasxas', CAST(0x0000A51B011EB812 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (27, 48, 46, N'hrllo how r u? Sqwe''dwedgh wevqd', CAST(0x0000A51B011FC04E AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (28, 46, 48, N'dfvdfvdfvd', CAST(0x0000A51B011FCBFD AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (29, 46, 48, N'dscsdcds', CAST(0x0000A51B011FD80E AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (30, 46, 48, N'sxsxsxsx', CAST(0x0000A51B0123EC41 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (31, 48, 46, N'ABCDEF', CAST(0x0000A51B0124B938 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (32, 46, 48, N'GHIJKLM', CAST(0x0000A51B0124D728 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (33, 48, 47, N'jj', CAST(0x0000A51B012CB8F1 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (34, 48, 47, N'3232', CAST(0x0000A51B012CFB55 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (35, 48, 47, N'asxasxasx', CAST(0x0000A51B012EA5A4 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (36, 48, 47, N'xxasxasxsax', CAST(0x0000A51B012EDED8 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (37, 48, 47, N'', CAST(0x0000A51B012EE1CF AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (38, 48, 47, N'saxasxas', CAST(0x0000A51B012EE6D8 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (39, 48, 47, N'asxasxas', CAST(0x0000A51B012EF648 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (40, 48, 47, N'xasxasx', CAST(0x0000A51B012F2E69 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (41, 48, 47, N'dscsdc', CAST(0x0000A51B012F45D2 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (42, 48, 47, N'asasxasx', CAST(0x0000A51B012FA7C9 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (43, 48, 47, N'sdsaxas', CAST(0x0000A51B012FAC46 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (44, 48, 46, N'', CAST(0x0000A51B013424BC AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (45, 48, 46, N'bxbxcbx', CAST(0x0000A51B013524BB AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (46, 48, 46, N'sdv fsdf', CAST(0x0000A51B01366B7A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (47, 46, 48, N'hi', CAST(0x0000A51B01366E39 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (48, 46, 48, N'hardy', CAST(0x0000A51B013673E1 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (49, 48, 46, N'hi bhuimi', CAST(0x0000A51B0136905C AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (50, 48, 46, N'sjkdcvjksdbcsdcsdcsdcdfgbfgbngh', CAST(0x0000A51B0136EBB4 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (51, 46, 48, N'@', CAST(0x0000A51B0136F6B7 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (52, 46, 48, N'heellooo', CAST(0x0000A51B013792E2 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (53, 48, 46, N'yfgvfghvjklnjknjhvfg', CAST(0x0000A51B013797CB AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (54, 48, 46, N'fdgdgdf', CAST(0x0000A51B0137A0B1 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (55, 48, 46, N'vbncvbnvbn', CAST(0x0000A51B0137A9E2 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (56, 46, 48, N'aaaaaaaaaaaaaaaaaaaaaaa', CAST(0x0000A51B01384884 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (57, 46, 48, N'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', CAST(0x0000A51B0138F1DA AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (58, 48, 46, N'gdfgfdgdfg', CAST(0x0000A51B01397A7E AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (59, 48, 46, N'gdfgdfg', CAST(0x0000A51B01397D97 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (60, 48, 46, N'dgdfgdfg', CAST(0x0000A51B013981B5 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (61, 48, 46, N'sdfsdfsfsdf', CAST(0x0000A51B01398A9B AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (62, 47, 48, N'hii', CAST(0x0000A51B013A2A47 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (63, 48, 47, N'jnb jhbjhj', CAST(0x0000A51B013A72B4 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (64, 48, 47, N'nfgnfgnfgn', CAST(0x0000A51B013A7AC5 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (65, 48, 47, N'bdfbbfgbfgb', CAST(0x0000A51B013A8346 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (66, 48, 46, N'sdfsdfsdfsdf', CAST(0x0000A51B013B3999 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (67, 48, 46, N'fvdfdfvdfv', CAST(0x0000A51B013B4221 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (68, 48, 46, N'fdbdfbdf', CAST(0x0000A51B013B5290 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (69, 48, 46, N'bcvcv', CAST(0x0000A51B013B760A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (70, 48, 46, N'dfgdfgdf', CAST(0x0000A51B013C386B AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (71, 48, 46, N'bfgbhfbg', CAST(0x0000A51B013C7BFE AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (72, 0, 48, N'qqqqq', CAST(0x0000A51B013D8F17 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (73, 0, 48, N'test', CAST(0x0000A51B013DA32D AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (74, 48, 46, N'fdfd', CAST(0x0000A51B013DBEA0 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (75, 48, 46, N'dsdsv', CAST(0x0000A51B013DC4E8 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (76, 48, 46, N'xsdsd', CAST(0x0000A51B013DF4F0 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (77, 48, 47, N'hi', CAST(0x0000A51C00CE578C AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (78, 46, 48, N'At Michael''s Meeting Point we understand the extra requirments for people with special needs. Parents and carers are encouraged to be involved. You can have administration over this account.', CAST(0x0000A51C011F0129 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (79, 46, 48, N'asxwexwwexw', CAST(0x0000A51C011F973E AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (80, 48, 46, N'Hi hello', CAST(0x0000A51C01209BE8 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (81, 46, 48, N'asxasxasx', CAST(0x0000A51C01228624 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (82, 55, 13, N'hi', CAST(0x0000A524005308E5 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (83, 21, 55, N'hi', CAST(0x0000A5240054877F AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (84, 55, 21, N'hghghgh', CAST(0x0000A5240054A427 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (85, 21, 55, N'gjhgj h gjhghjg h j hjg jhghjg hjg hjg', CAST(0x0000A5240054B2D2 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (86, 55, 21, N'54567  678678 68 8 8 8 78', CAST(0x0000A524005549DB AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (87, 47, 48, N'dwcascsdcsdcsdcd sdcwb hwevjhbwejk  cwejhd ewcwe wegvdwe bnd uylfv 3rfbkh', CAST(0x0000A52400C988AC AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (88, 48, 47, N'asxdasxasxa', CAST(0x0000A524011DD81A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (89, 48, 47, N'bvdfvdfvdfv', CAST(0x0000A524011E2E96 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (90, 48, 47, N'check notification', CAST(0x0000A524011E3BCA AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (91, 48, 47, N'HUmmmm', CAST(0x0000A52401210700 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (92, 48, 47, N'dscsdcsdc', CAST(0x0000A52401212391 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (93, 47, 48, N'tttt', CAST(0x0000A5240121651A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (94, 48, 47, N'asxasx', CAST(0x0000A5240123904F AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (95, 47, 48, N'hi twitter', CAST(0x0000A5240123F0C6 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (96, 48, 47, N'Hi facebook ?', CAST(0x0000A52401245BE5 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (97, 47, 48, N'fvfdvdfvdfvdfv', CAST(0x0000A52401253FBF AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (98, 48, 47, N'dfvdfvdfv', CAST(0x0000A524012581A2 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (99, 55, 21, N'hi', CAST(0x0000A52700CD989C AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (100, 21, 55, N'hi', CAST(0x0000A52700CDD0A9 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (101, 55, 21, N'tyty6767', CAST(0x0000A52700CE1123 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (102, 55, 21, N'jhgjhgjghj', CAST(0x0000A52700CE74FD AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (103, 55, 21, N'gfdgfdgfdg', CAST(0x0000A52700CEAB27 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (104, 13, 55, N'fdfsdfs', CAST(0x0000A52700CEBB2D AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (105, 55, 13, N'3232323', CAST(0x0000A52700CEE372 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (106, 13, 55, N'dssds', CAST(0x0000A52700CEEAE6 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (107, 48, 1, N'hello', CAST(0x0000A528010AFFEB AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (108, 48, 1, N'mbnkj', CAST(0x0000A528010B1CE3 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (109, 1, 0, N'asxasx', CAST(0x0000A528010B7E03 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (110, 1, 48, N'hello', CAST(0x0000A528010BE566 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (111, 1, 48, N'dvdvzv', CAST(0x0000A528010C0C05 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (112, 1, 48, N'xccZ', CAST(0x0000A528010C4783 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (113, 1, 48, N'5165', CAST(0x0000A528010C72C4 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (114, 48, 0, N'asxasxasx', CAST(0x0000A528010CF36C AS DateTime), 0)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (115, 48, 0, N'asxas', CAST(0x0000A528010CFDB6 AS DateTime), 0)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (116, 48, 1, N'hi', CAST(0x0000A528010D9149 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (117, 48, 1, N'hi', CAST(0x0000A528010DB1FD AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (118, 48, 1, N'ASXAS', CAST(0x0000A5280111C9A8 AS DateTime), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (119, 1, 48, N'XASXASX', CAST(0x0000A5280111F062 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (120, 48, 1, N'ZCVDVSDVS', CAST(0x0000A5280111FD7A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (121, 1, 48, N'hi', CAST(0x0000A5280112C525 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (122, 1, 48, N'hello', CAST(0x0000A5280112F07D AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (123, 48, 1, N'jnb kj', CAST(0x0000A52801131BE8 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (124, 48, 1, N'451651', CAST(0x0000A52801132361 AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (125, 1, 48, N'jkn  j kl', CAST(0x0000A5280113907A AS DateTime), 1)
INSERT [dbo].[UsersChats] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (126, 1, 48, N'jkn  j kl', CAST(0x0000A5280113979A AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UsersChats] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 10/05/2015 17:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Gender] [smallint] NULL,
	[Age] [int] NULL,
	[LookingforGender] [smallint] NULL,
	[ProfilePicture] [varchar](500) NULL,
	[ProfileVideo] [varchar](500) NULL,
	[ThingsNotLike] [varchar](1000) NULL,
	[AboutMe] [varchar](1000) NULL,
	[IsConfirmed] [bit] NULL CONSTRAINT [DF_Users_IsEmailConfirm]  DEFAULT ((0)),
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()),
	[ModifiedDate] [datetime] NULL CONSTRAINT [DF_Users_ModifiedDate]  DEFAULT (getdate()),
	[IsActive] [bit] NULL CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)),
	[LocationName] [varchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (1, N'test@gmail.com', N'test', N'test', N'accout', 1, 18, 2, N'upload/profile_image/1/1444043562910_pro_pic.png', N'upload/profile_video/1/1442902538602_pro_vid.mp4', N'gossip', N'Interested in chatting', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A52801136AD9 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (7, N'kapilp.ips@gmail.com', N'ips12345', N'kapil', N'darji', 1, 24, 2, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'time pass', N'love to date', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (8, N'nikunjg.ips@gmail.com', N'ips12345', N'Nikunj', N'ganatra', 1, 20, 2, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'chatting', N'Interested in chatting', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (13, N'vv@mail.com', N'pass', N'vv', N'mailcom', 1, 21, 2, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_video/13/1442621647770_pro_vid.mov', N'singing', N'love to date', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A52700CF0549 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (14, N'tt@mail.com', N'pass', N'test3', N'test', 1, 24, 2, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'travelling', N'Interested in chatting', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (15, N'maulikp.ips@gmail.com', N'ips123456', N'maulik', N'abc', 1, 18, 2, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'flirting', N'love to date', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (16, N'test@gmail1.com', N'test', N'K', N'P', 1, 25, 2, N'xxxy', N'xxx', N'gossip', N'', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A51C00CA3B92 AS DateTime), 1, N'Sydney')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (20, N'test@gmail1.com', N'test', N'test first name', N'test last name', 1, 25, 2, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'time pass', N'love to date', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (21, N'vv@mailinator.com', N'pass', N'vv', N'vv', 1, 30, 2, N'upload/profile_image/21/1443656135786_pro_pic.png', N'upload/profile_video/21/1442697339751_pro_vid.mov', N'chatting', N'good at walking', 1, CAST(0x0000A517001F0D3C AS DateTime), CAST(0x0000A52400782C45 AS DateTime), 1, N'Sydney')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (22, N'mansi@gmail.com', N'Ips@12345', N'mansi', N'kappor', 2, 19, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'singing', N'love to date', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (28, N'testasasasas@gmail.com', N'test', N'testfirst', N'testlast', 2, 20, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'travelling', N'Interested in chatting', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A517013A3A69 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (29, N'patel198@gmail.com', N'test', N'patail', N'test', 1, 22, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'asxasxassa', N'love to date', 1, CAST(0x0000A517013A3A69 AS DateTime), CAST(0x0000A5170126D839 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (30, N'keyur@itpathsolutions.com', N'pass', N'keyur', N'patel', 1, 30, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'singing', N'Interested in chatting', 1, CAST(0x0000A51701138226 AS DateTime), CAST(0x0000A51701138226 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (31, N'patelhardik198@gmail.com00', N'123', N'hardik', N'patel', 2, 26, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'travelling', N'Interested in chatting', 1, CAST(0x0000A51701274259 AS DateTime), CAST(0x0000A51701274259 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (32, N'seema@gmail.com', N'admin123', N'seema', N'maheta', 2, 25, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_video/32/1442585577088_pro_vid.mp4', N'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum', N'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum  Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum', 1, CAST(0x0000A5170135D06B AS DateTime), CAST(0x0000A5170144F0F8 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (33, N'roma@gmail.com', N'123', N'roma', N'khanna', 2, 20, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'Dating', N'Interested in chatting', 1, CAST(0x0000A517015655FC AS DateTime), CAST(0x0000A517015655FC AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (37, N'lusy@gmail.com', N'', N'lusy', N'rahane', 2, 18, 1, N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'upload/profile_image/32/1442585174783_pro_pic.jpg', N'Chatting', N'love to date,flirting', 1, CAST(0x0000A51701677000 AS DateTime), CAST(0x0000A51701677000 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (38, N'krima@gmail.com', N'krima', N'', N'', 2, 18, 2, N'upload/profile_image/38/1442596581081_pro_pic.jpg', N'', N'chatting', N'I love datting', 1, CAST(0x0000A5170174AE61 AS DateTime), CAST(0x0000A51701774F11 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (39, N'vv2@mailinator.com', N'pass', N'', N'', 0, 0, 0, N'', N'', N'', N'', 1, CAST(0x0000A518005F56D4 AS DateTime), CAST(0x0000A518005F56D4 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (40, N'abc@mailinator.com', N'password', N'', N'', 0, 0, 0, N'', N'', N'', N'', 1, CAST(0x0000A51800613EDD AS DateTime), CAST(0x0000A51800613EDD AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (41, N'a@a.com', N'123', N'', N'', 2, 0, 2, N'upload/profile_image/41/1442645547860_pro_pic.jpg', N'', N'', N'', 1, CAST(0x0000A51800CB347A AS DateTime), CAST(0x0000A51800CBEED6 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (42, N'b@b.com', N'123', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51800CBA8CF AS DateTime), CAST(0x0000A51800CBA8CF AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (43, N'a@ab.com', N'123', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51800E1C3E1 AS DateTime), CAST(0x0000A51800E1C3E1 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (44, N'cc@cc.com', N'123', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51800E27206 AS DateTime), CAST(0x0000A51800E27206 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (45, N'22@22.com', N'123', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51800E2C139 AS DateTime), CAST(0x0000A51800E2C139 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (46, N'patelhardik198@gmail.com', N'123', N'seemadddd', N'maheta', 2, 25, 2, N'upload/profile_image/46/1442828237404_pro_pic.JPG', N'upload/profile_video/46/1442828880232_pro_vid.mp4', N'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum', N'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum  Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum', 1, CAST(0x0000A5180110118B AS DateTime), CAST(0x0000A51A00FBFAE7 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (47, N'fb@gmail.com', N'123', N'Facebook', N'Facebook', 2, 25, 2, N'upload/profile_image/47/1442928934681_pro_pic.jpg', N'upload/profile_video/47/1442903032565_pro_vid.mp4', N'xasxasx', N'xasxasxasxasxasxas', 1, CAST(0x0000A518012FD4A8 AS DateTime), CAST(0x0000A52500C63F72 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (48, N'tw@gmail.com', N'123', N'Twitter', N'Twitter', 1, 30, 2, N'upload/profile_image/48/1442667625173_pro_pic.jpg', N'upload/profile_video/48/1442834218868_pro_vid.mp4', N'xasxas', N'xasxsxasxasx asx asxasxasxasxasxasx', 1, CAST(0x0000A5180130A3FD AS DateTime), CAST(0x0000A51C00CC22A3 AS DateTime), 1, N'Sydney')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (49, N'vv4@mailinator.com', N'password', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A5190029C5F0 AS DateTime), CAST(0x0000A5190029C5F0 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (50, N'pravin.palp@gmail.com', N'engadine', N'', N'', 0, 0, 0, N'', N'', N'', N'', 1, CAST(0x0000A51A005EA26C AS DateTime), CAST(0x0000A51A005EA26C AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (51, N'pravin.palp@hotmail.com', N'1234', N'p', N'p', 1, 25, 2, N'upload/profile_image/51/1442795278766_pro_pic.jpg', N'', N'1', N'2', 1, CAST(0x0000A51A00617326 AS DateTime), CAST(0x0000A51A006207B1 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (52, N'testnew@gmail.com', N'test', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51A00CD4515 AS DateTime), CAST(0x0000A51A00CD4515 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (53, N'nikunj@itpathsolutions.com', N'nikunj123', N'', N'', 0, 0, 0, N'', N'', N'', N'', 1, CAST(0x0000A51A00CDB351 AS DateTime), CAST(0x0000A51A00CDB351 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (54, N'vv45@mailinator.com', N'pass', N'ttt', N'rrrr', 2, 33, 2, N'', N'', N'', N'', 1, CAST(0x0000A51A00CF634B AS DateTime), CAST(0x0000A51A011A39B7 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (55, N'remo@mailinator.com', N'pass', N'male fname', N'lname', 1, 25, 2, N'upload/profile_image/55/1442930127956_pro_pic.jpg', N'upload/profile_video/55/1442922245683_pro_vid.mp4', N'', N'', 1, CAST(0x0000A51A011A7E47 AS DateTime), CAST(0x0000A524005434F2 AS DateTime), 1, N'Sydney')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (56, N'contact@opalcomputers.com.au', N'12345', N'PPK', N'K', 1, 28, 2, N'upload/profile_image/56/1442913289160_pro_pic.JPG', N'upload/profile_video/56/1442913289160_pro_vid.mp4', N'Chatting', N'Playing Cricket', 1, CAST(0x0000A51B00F20D8C AS DateTime), CAST(0x0000A51B00F2BF2F AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (57, N'female@mailinator.com', N'pass', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51B011DB872 AS DateTime), CAST(0x0000A51B011DB872 AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (58, N'niksdotnet@gmail.com', N'nikunj123', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A51B0125F5FB AS DateTime), CAST(0x0000A51B0125F5FB AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (59, N'chiragc.ips@gmail.com', N'tlc123', N'', N'', 1, 20, 2, N'', N'', N'', N'', 1, CAST(0x0000A51B0136F0D2 AS DateTime), CAST(0x0000A51B01385C5D AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Gender], [Age], [LookingforGender], [ProfilePicture], [ProfileVideo], [ThingsNotLike], [AboutMe], [IsConfirmed], [CreatedDate], [ModifiedDate], [IsActive], [LocationName]) VALUES (60, N'patel@gmail.com', N'123', N'', N'', 0, 0, 0, N'', N'', N'', N'', NULL, CAST(0x0000A5250122AD80 AS DateTime), CAST(0x0000A5250122AD80 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 10/05/2015 17:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (1, N'All over Australia', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (2, N'Sydney', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (3, N'Melbourne', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (4, N'Brisbane', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (5, N'Adelaide', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (6, N'Perth', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (7, N'Northern Territory', 1)
INSERT [dbo].[Locations] ([Id], [Name], [IsActive]) VALUES (8, N'Canberra', 1)
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Likes]    Script Date: 10/05/2015 17:06:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Likes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Likes_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Likes] ON
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (1, N'Meeting for coffee', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (2, N'Music', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (3, N'Design', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (4, N'Physical fitness', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (5, N'Bush', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (6, N'Nature', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (7, N'Craft', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (8, N'Games', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (9, N'Eating out', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (10, N'Reading', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (11, N'Clothes', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (12, N'Swimming', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (13, N'walking', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (14, N'Photography', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (15, N'Beach', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (16, N'Movies', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (17, N'Writing', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (18, N'Sports', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (19, N'Boating', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (20, N'Camping', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (21, N'Theatre', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (22, N'Bicycles', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (23, N'Shopping', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (24, N'Art', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (25, N'Playing sports', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (26, N'Having fun in groups', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (27, N'Enjoying', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (28, N'group', 1)
INSERT [dbo].[Likes] ([Id], [Name], [IsActive]) VALUES (29, N'Computer', 1)
SET IDENTITY_INSERT [dbo].[Likes] OFF
/****** Object:  Table [dbo].[UsersMessages]    Script Date: 10/05/2015 17:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[Message] [varchar](2000) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UsersMessages_CreatedDate]  DEFAULT (getdate()),
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_UsersMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UsersMessages] ON
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (1, 29, 16, N'This is test', CAST(0x0000A518010E621D AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (2, 32, 29, N'Test this', CAST(0x0000A518010E737C AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (3, 48, 46, N'axasxvghv xas
 askxcnasnxas
xas jasnxkjas', CAST(0x0000A51A013A46CF AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (4, 48, 46, N'saxasxasx', CAST(0x0000A51A013A9D78 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (5, 48, 46, N'dcsdcvdfbrtkng trtgrt', CAST(0x0000A51A013AC49E AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (6, 46, 48, N'asxasxasxasxasx', CAST(0x0000A51A014636DC AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (7, 46, 48, N'fgbfgbsdnfsdjkg df
 ed frger
d 
gergerg', CAST(0x0000A51A014678AA AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (8, 48, 47, N'Hello', CAST(0x0000A51A0148744A AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (9, 48, 47, N'Hi', CAST(0x0000A51B00C178FF AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (10, 48, 46, N'U there?', CAST(0x0000A51B00C1CA11 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (11, 51, 51, N'hello', CAST(0x0000A51B00F5ABF8 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (12, 48, 47, N'xxx', CAST(0x0000A51B01102073 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (13, 13, 55, N'how are you doing?', CAST(0x0000A51B0122C7DA AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (14, 13, 55, N'Unfortunately, your request cannot be processed. Mailinator is committed to providing a valuable service to its users and at the same time, limit abuse of the system.

An automated rate-detection system triggered based on your usage. This is a temporary ban and should clear by tomorrow. Continued access attempts today could result in a more permanent ban (please don''t do that).', CAST(0x0000A51B0122FC29 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (15, 55, 13, N'Unfortunately, your request cannot be processed. Mailinator is committed to providing a valuable service to its users and at the same time, limit abuse of the system.

An automated rate-detection system triggered based on your usage. This is a temporary ban and should clear by tomorrow. Continued access attempts today could result in a more permanent ban (please don''t do that).Unfortunately, your request cannot be processed. Mailinator is committed to providing a valuable service to its users and at the same time, limit abuse of the system.

An automated rate-detection system triggered based on your usage. This is a temporary ban and should clear by tomorrow. Continued access attempts today could result in a more permanent ban (please don''t do that).', CAST(0x0000A51B01232E81 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (16, 48, 47, N'xsaxasxasxasx', CAST(0x0000A5250120483B AS DateTime), 0)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (17, 1, 48, N'saxasxasxasxasx', CAST(0x0000A5250123B534 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (18, 1, 48, N'asxasxasx', CAST(0x0000A5250125AB90 AS DateTime), 1)
INSERT [dbo].[UsersMessages] ([Id], [FromUserId], [ToUserId], [Message], [CreatedDate], [IsRead]) VALUES (19, 48, 1, N'asxasxasxasxasx', CAST(0x0000A525012A01A4 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UsersMessages] OFF
/****** Object:  Table [dbo].[UsersLoginLog]    Script Date: 10/05/2015 17:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersLoginLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersLoginLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LoggedInTime] [datetime] NOT NULL,
	[LoggedOutTime] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UsersLoginLog_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_UsersLoginLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UsersLoginLog] ON
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (1, 48, CAST(0x0000A51B01229B08 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51B01229B08 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (2, 48, CAST(0x0000A51B0122A796 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51B0122A796 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (3, 46, CAST(0x0000A51B01274798 AS DateTime), CAST(0x0000A51D00C46AB0 AS DateTime), CAST(0x0000A51B01274798 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (4, 48, CAST(0x0000A51B0136564A AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51B0136564A AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (5, 46, CAST(0x0000A51B0136565D AS DateTime), CAST(0x0000A51D00C46AB0 AS DateTime), CAST(0x0000A51B0136565D AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (6, 46, CAST(0x0000A51B013781CE AS DateTime), CAST(0x0000A51D00C46AB0 AS DateTime), CAST(0x0000A51B013781CE AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (7, 59, CAST(0x0000A51B01380683 AS DateTime), CAST(0x0000A51B0138694F AS DateTime), CAST(0x0000A51B01380683 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (8, 47, CAST(0x0000A51B013A0C76 AS DateTime), CAST(0x0000A52501230B4B AS DateTime), CAST(0x0000A51B013A0C76 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (9, 47, CAST(0x0000A51B013B4C59 AS DateTime), CAST(0x0000A52501230B4B AS DateTime), CAST(0x0000A51B013B4C59 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (10, 55, CAST(0x0000A51B013E2A5D AS DateTime), CAST(0x0000A52700CDE502 AS DateTime), CAST(0x0000A51B013E2A5D AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (11, 55, CAST(0x0000A51B013E855E AS DateTime), CAST(0x0000A52700CDE502 AS DateTime), CAST(0x0000A51B013E855E AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (12, 55, CAST(0x0000A51B014074CC AS DateTime), CAST(0x0000A52700CDE502 AS DateTime), CAST(0x0000A51B014074CC AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (13, 46, CAST(0x0000A51B0141C2C3 AS DateTime), CAST(0x0000A51D00C46AB0 AS DateTime), CAST(0x0000A51B0141C2C3 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (14, 48, CAST(0x0000A51B0141F2B6 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51B0141F2B6 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (15, 48, CAST(0x0000A51B01432533 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51B01432533 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (16, 1, CAST(0x0000A51B0143F6EE AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A51B0143F6EE AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (17, 1, CAST(0x0000A51B01449C7C AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A51B01449C7C AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (18, 48, CAST(0x0000A51C00BA2101 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51C00BA2101 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (19, 48, CAST(0x0000A51C00BAB9C2 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51C00BAB9C2 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (20, 48, CAST(0x0000A51C00CC1D04 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51C00CC1D04 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (21, 46, CAST(0x0000A51C011AEC90 AS DateTime), CAST(0x0000A51D00C46AB0 AS DateTime), CAST(0x0000A51C011AEC90 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (22, 48, CAST(0x0000A51C01207997 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51C01207997 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (23, 48, CAST(0x0000A51D00C46BC5 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A51D00C46BC5 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (24, 55, CAST(0x0000A51D00C9EB9F AS DateTime), CAST(0x0000A52700CDE502 AS DateTime), CAST(0x0000A51D00C9EB9F AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (25, 55, CAST(0x0000A51D00CB60C3 AS DateTime), CAST(0x0000A52700CDE502 AS DateTime), CAST(0x0000A51D00CB60C3 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (26, 47, CAST(0x0000A5210117AB35 AS DateTime), CAST(0x0000A52501230B4B AS DateTime), CAST(0x0000A5210117AB35 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (27, 21, CAST(0x0000A5240053B502 AS DateTime), CAST(0x0000A52700CDB12B AS DateTime), CAST(0x0000A5240053B502 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (28, 47, CAST(0x0000A5240114B4F2 AS DateTime), CAST(0x0000A52501230B4B AS DateTime), CAST(0x0000A5240114B4F2 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (29, 48, CAST(0x0000A524011DC754 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A524011DC754 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (30, 48, CAST(0x0000A525011B9FEA AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A525011B9FEA AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (31, 48, CAST(0x0000A525011C0138 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A525011C0138 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (32, 47, CAST(0x0000A525011E0961 AS DateTime), CAST(0x0000A52501230B4B AS DateTime), CAST(0x0000A525011E0961 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (33, 48, CAST(0x0000A525012024FB AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A525012024FB AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (34, 1, CAST(0x0000A5250122DA6B AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A5250122DA6B AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (35, 48, CAST(0x0000A52501231BE2 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A52501231BE2 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (36, 1, CAST(0x0000A5250129DFFC AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A5250129DFFC AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (37, 48, CAST(0x0000A5250129F852 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A5250129F852 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (38, 21, CAST(0x0000A52700CDB12B AS DateTime), NULL, CAST(0x0000A52700CDB12B AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (39, 55, CAST(0x0000A52700CDFAED AS DateTime), NULL, CAST(0x0000A52700CDFAED AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (40, 48, CAST(0x0000A528010A9BB8 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A528010A9BB8 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (41, 1, CAST(0x0000A528010AB349 AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A528010AB349 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (42, 48, CAST(0x0000A528010BC7CA AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A528010BC7CA AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (43, 1, CAST(0x0000A528010BDB91 AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A528010BDB91 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (44, 1, CAST(0x0000A528010D1377 AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A528010D1377 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (45, 1, CAST(0x0000A5280112469D AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A5280112469D AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (46, 48, CAST(0x0000A5280112831D AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A5280112831D AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (47, 1, CAST(0x0000A5280114FDE0 AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A5280114FDE0 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (48, 48, CAST(0x0000A52801152BB4 AS DateTime), CAST(0x0000A52801155216 AS DateTime), CAST(0x0000A52801152BB4 AS DateTime))
INSERT [dbo].[UsersLoginLog] ([Id], [UserId], [LoggedInTime], [LoggedOutTime], [CreatedDate]) VALUES (49, 1, CAST(0x0000A52801156464 AS DateTime), CAST(0x0000A5280115EA6F AS DateTime), CAST(0x0000A52801156464 AS DateTime))
SET IDENTITY_INSERT [dbo].[UsersLoginLog] OFF
/****** Object:  Table [dbo].[UsersLikes]    Script Date: 10/05/2015 17:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersLikes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[LikeId] [int] NULL,
 CONSTRAINT [PK_UserLike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UsersLikes] ON
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (1, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (2, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (3, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (4, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (5, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (6, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (7, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (8, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (9, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (10, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (11, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (12, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (13, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (14, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (15, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (16, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (17, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (18, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (19, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (20, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (21, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (22, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (23, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (24, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (25, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (26, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (27, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (28, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (29, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (30, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (31, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (32, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (33, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (34, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (35, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (36, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (37, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (38, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (39, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (40, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (41, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (42, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (43, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (44, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (45, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (46, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (47, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (48, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (49, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (50, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (51, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (52, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (53, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (54, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (55, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (56, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (57, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (58, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (59, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (60, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (61, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (62, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (63, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (64, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (65, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (66, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (67, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (68, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (69, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (70, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (71, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (72, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (73, 29, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (74, 29, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (75, 29, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (76, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (77, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (78, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (79, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (80, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (81, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (82, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (83, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (84, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (85, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (86, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (87, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (88, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (89, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (90, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (91, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (92, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (93, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (94, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (95, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (96, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (97, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (98, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (99, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (100, NULL, 10)
GO
print 'Processed 100 total records'
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (101, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (102, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (103, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (104, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (105, NULL, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (106, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (107, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (108, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (109, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (110, 32, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (111, 32, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (112, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (113, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (114, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (115, NULL, 4)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (116, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (117, 38, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (118, 38, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (119, 38, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (120, 38, 4)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (121, 38, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (122, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (123, NULL, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (124, NULL, 9)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (125, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (126, NULL, 13)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (127, NULL, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (128, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (129, NULL, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (130, NULL, 9)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (131, NULL, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (132, NULL, 13)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (133, NULL, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (134, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (135, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (136, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (137, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (138, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (139, NULL, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (140, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (141, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (142, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (143, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (144, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (145, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (146, NULL, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (147, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (148, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (149, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (150, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (151, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (152, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (153, NULL, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (154, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (155, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (156, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (157, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (158, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (159, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (160, NULL, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (161, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (162, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (163, NULL, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (164, NULL, 9)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (165, NULL, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (166, NULL, 18)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (167, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (168, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (169, NULL, 28)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (170, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (171, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (172, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (173, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (174, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (175, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (176, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (177, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (178, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (179, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (180, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (181, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (182, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (183, NULL, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (184, NULL, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (185, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (186, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (187, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (188, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (189, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (190, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (191, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (192, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (193, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (194, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (195, NULL, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (196, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (197, NULL, 28)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (198, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (199, NULL, 13)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (200, NULL, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (201, NULL, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (202, NULL, 13)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (203, NULL, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (204, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (205, NULL, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (206, 51, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (207, 51, 9)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (208, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (209, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (210, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (211, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (212, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (213, NULL, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (214, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (215, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (216, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (217, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (218, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (219, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (220, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (221, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (222, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (223, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (224, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (225, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (226, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (227, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (228, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (229, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (230, 46, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (231, 46, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (232, 46, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (233, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (234, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (235, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (236, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (237, NULL, 29)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (238, NULL, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (239, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (240, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (241, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (242, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (243, NULL, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (244, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (245, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (246, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (247, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (248, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (249, NULL, 29)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (250, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (251, NULL, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (252, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (253, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (254, NULL, 29)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (255, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (256, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (257, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (258, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (259, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (260, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (261, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (262, 54, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (263, 54, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (264, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (265, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (266, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (267, NULL, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (268, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (269, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (270, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (271, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (272, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (273, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (274, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (275, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (276, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (277, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (278, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (279, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (280, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (281, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (282, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (283, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (284, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (285, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (286, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (287, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (288, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (289, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (290, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (291, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (292, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (293, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (294, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (295, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (296, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (297, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (298, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (299, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (300, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (301, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (302, NULL, 26)
GO
print 'Processed 300 total records'
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (303, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (304, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (305, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (306, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (307, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (308, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (309, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (310, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (311, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (312, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (313, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (314, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (315, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (316, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (317, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (318, NULL, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (319, NULL, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (320, NULL, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (321, NULL, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (322, NULL, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (323, NULL, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (324, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (325, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (326, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (327, NULL, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (328, 56, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (329, 56, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (330, 56, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (331, 56, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (332, 56, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (333, 56, 28)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (334, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (335, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (336, 59, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (337, 59, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (338, 59, 3)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (339, 59, 4)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (340, 59, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (341, 59, 6)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (342, 59, 7)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (343, 59, 8)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (344, 59, 9)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (345, 59, 10)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (346, 59, 11)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (347, 59, 12)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (348, 59, 13)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (349, 59, 14)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (350, 59, 15)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (351, 59, 16)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (352, 59, 17)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (353, 59, 18)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (354, 59, 19)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (355, 59, 20)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (356, 59, 21)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (357, 59, 22)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (358, 59, 23)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (359, 59, 24)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (360, 59, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (361, 59, 26)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (362, 59, 27)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (363, 59, 28)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (364, 59, 29)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (365, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (366, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (367, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (368, NULL, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (369, 16, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (370, 16, 2)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (371, NULL, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (372, NULL, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (373, 55, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (374, 55, 25)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (375, 21, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (376, 21, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (377, 13, 1)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (378, 13, 5)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (379, 13, 9)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (380, 13, 13)
INSERT [dbo].[UsersLikes] ([Id], [UserId], [LikeId]) VALUES (381, NULL, 8)
SET IDENTITY_INSERT [dbo].[UsersLikes] OFF
/****** Object:  ForeignKey [FK_UsersLikes_Likes]    Script Date: 10/05/2015 17:06:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Likes]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes]  WITH CHECK ADD  CONSTRAINT [FK_UsersLikes_Likes] FOREIGN KEY([LikeId])
REFERENCES [dbo].[Likes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Likes]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes] CHECK CONSTRAINT [FK_UsersLikes_Likes]
GO
/****** Object:  ForeignKey [FK_UsersLikes_Users]    Script Date: 10/05/2015 17:06:50 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes]  WITH CHECK ADD  CONSTRAINT [FK_UsersLikes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersLikes_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersLikes]'))
ALTER TABLE [dbo].[UsersLikes] CHECK CONSTRAINT [FK_UsersLikes_Users]
GO
