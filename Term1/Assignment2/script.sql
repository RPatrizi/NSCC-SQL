USE [Student_Program]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 05/12/2021 17:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[class_ID] [int] IDENTITY(1,1) NOT NULL,
	[class_Name] [nvarchar](255) NULL,
	[teach_ID_fk] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollement]    Script Date: 05/12/2021 17:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollement](
	[enroll_ID] [int] IDENTITY(1,1) NOT NULL,
	[stu_ID_fk] [int] NULL,
	[class_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[enroll_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 05/12/2021 17:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[prog_ID] [int] IDENTITY(1,1) NOT NULL,
	[prog_Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[prog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 05/12/2021 17:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stu_ID] [int] IDENTITY(1,1) NOT NULL,
	[stu_FName] [nvarchar](255) NULL,
	[stu_LName] [nvarchar](255) NULL,
	[stu_Addr1] [nvarchar](255) NULL,
	[stu_Addr2] [nvarchar](255) NULL,
	[stu_City] [nvarchar](255) NULL,
	[stu_PCode] [nvarchar](255) NULL,
	[stu_DOB] [datetime] NULL,
	[stu_FeesPaid] [bit] NOT NULL,
	[prog_ID_Fk] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 05/12/2021 17:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teach_ID] [int] IDENTITY(1,1) NOT NULL,
	[teach_FName] [nvarchar](255) NULL,
	[teach_LName] [nvarchar](255) NULL,
	[teach_Addr1] [nvarchar](255) NULL,
	[teach_Addr2] [nvarchar](255) NULL,
	[teach_City] [nvarchar](255) NULL,
	[teach_PCode] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[teach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([class_ID], [class_Name], [teach_ID_fk]) VALUES (1, N'Economics 1', 1)
INSERT [dbo].[Class] ([class_ID], [class_Name], [teach_ID_fk]) VALUES (2, N'Biology 1', 1)
INSERT [dbo].[Class] ([class_ID], [class_Name], [teach_ID_fk]) VALUES (3, N'Business Intro', 1)
INSERT [dbo].[Class] ([class_ID], [class_Name], [teach_ID_fk]) VALUES (4, N'Programming 2', 1)
INSERT [dbo].[Class] ([class_ID], [class_Name], [teach_ID_fk]) VALUES (5, N'Biology 2', 2)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollement] ON 

INSERT [dbo].[Enrollement] ([enroll_ID], [stu_ID_fk], [class_ID]) VALUES (1, 1, 2)
INSERT [dbo].[Enrollement] ([enroll_ID], [stu_ID_fk], [class_ID]) VALUES (2, 1, 1)
INSERT [dbo].[Enrollement] ([enroll_ID], [stu_ID_fk], [class_ID]) VALUES (3, 2, 2)
INSERT [dbo].[Enrollement] ([enroll_ID], [stu_ID_fk], [class_ID]) VALUES (4, 2, 3)
INSERT [dbo].[Enrollement] ([enroll_ID], [stu_ID_fk], [class_ID]) VALUES (5, 2, 4)
INSERT [dbo].[Enrollement] ([enroll_ID], [stu_ID_fk], [class_ID]) VALUES (6, 3, 5)
SET IDENTITY_INSERT [dbo].[Enrollement] OFF
GO
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([prog_ID], [prog_Name]) VALUES (1, N'Economics')
INSERT [dbo].[Program] ([prog_ID], [prog_Name]) VALUES (2, N'Computer Science')
INSERT [dbo].[Program] ([prog_ID], [prog_Name]) VALUES (3, N'Medicine')
INSERT [dbo].[Program] ([prog_ID], [prog_Name]) VALUES (4, N'Dentistry')
SET IDENTITY_INSERT [dbo].[Program] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([stu_ID], [stu_FName], [stu_LName], [stu_Addr1], [stu_Addr2], [stu_City], [stu_PCode], [stu_DOB], [stu_FeesPaid], [prog_ID_Fk]) VALUES (1, N'John', N'Smith', N'3 Main Str', NULL, N'North Boston', N'56125', CAST(N'1991-08-04T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Student] ([stu_ID], [stu_FName], [stu_LName], [stu_Addr1], [stu_Addr2], [stu_City], [stu_PCode], [stu_DOB], [stu_FeesPaid], [prog_ID_Fk]) VALUES (2, N'Maria', N'Giffin', N'16 Leeds Rd', NULL, N'South Boston', N'56128', CAST(N'1992-09-10T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Student] ([stu_ID], [stu_FName], [stu_LName], [stu_Addr1], [stu_Addr2], [stu_City], [stu_PCode], [stu_DOB], [stu_FeesPaid], [prog_ID_Fk]) VALUES (3, N'Susan', N'Johnson', N'21 Arrow Str', NULL, N'South Boston', N'56128', CAST(N'1991-01-13T00:00:00.000' AS DateTime), 0, 3)
INSERT [dbo].[Student] ([stu_ID], [stu_FName], [stu_LName], [stu_Addr1], [stu_Addr2], [stu_City], [stu_PCode], [stu_DOB], [stu_FeesPaid], [prog_ID_Fk]) VALUES (4, N'Matt', N'Long', N'14 Milk Lane', N'A', N'South Boston', N'56128', CAST(N'1991-04-25T00:00:00.000' AS DateTime), 1, 4)
INSERT [dbo].[Student] ([stu_ID], [stu_FName], [stu_LName], [stu_Addr1], [stu_Addr2], [stu_City], [stu_PCode], [stu_DOB], [stu_FeesPaid], [prog_ID_Fk]) VALUES (6, N'Bobby', N'Marley', NULL, NULL, NULL, NULL, NULL, 0, 4)
INSERT [dbo].[Student] ([stu_ID], [stu_FName], [stu_LName], [stu_Addr1], [stu_Addr2], [stu_City], [stu_PCode], [stu_DOB], [stu_FeesPaid], [prog_ID_Fk]) VALUES (8, N'Peter', N'Tosh', NULL, NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([teach_ID], [teach_FName], [teach_LName], [teach_Addr1], [teach_Addr2], [teach_City], [teach_PCode]) VALUES (1, N'James', N'Peterson', N'44 March Way', NULL, N'Glebe', N'56100')
INSERT [dbo].[Teacher] ([teach_ID], [teach_FName], [teach_LName], [teach_Addr1], [teach_Addr2], [teach_City], [teach_PCode]) VALUES (2, N'Sarah', N'Francis', NULL, NULL, NULL, NULL)
INSERT [dbo].[Teacher] ([teach_ID], [teach_FName], [teach_LName], [teach_Addr1], [teach_Addr2], [teach_City], [teach_PCode]) VALUES (3, N'Shane', N'Cobson', N'105 Mist Rd', NULL, N'Faulkner', N'56410')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_TeacherClass] FOREIGN KEY([teach_ID_fk])
REFERENCES [dbo].[Teacher] ([teach_ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_TeacherClass]
GO
ALTER TABLE [dbo].[Enrollement]  WITH CHECK ADD  CONSTRAINT [FK_ClassEnrollement] FOREIGN KEY([class_ID])
REFERENCES [dbo].[Class] ([class_ID])
GO
ALTER TABLE [dbo].[Enrollement] CHECK CONSTRAINT [FK_ClassEnrollement]
GO
ALTER TABLE [dbo].[Enrollement]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollement] FOREIGN KEY([stu_ID_fk])
REFERENCES [dbo].[Student] ([stu_ID])
GO
ALTER TABLE [dbo].[Enrollement] CHECK CONSTRAINT [FK_StudentEnrollement]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_ProgramStudent] FOREIGN KEY([prog_ID_Fk])
REFERENCES [dbo].[Program] ([prog_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_ProgramStudent]
GO
