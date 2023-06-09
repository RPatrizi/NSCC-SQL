USE [StudentProgram]
GO
INSERT [dbo].[Class] ([PK_Class_ID], [Class_Name], [FK_Class_Teacher_ID]) VALUES (1, N'Economics 1', 1)
INSERT [dbo].[Class] ([PK_Class_ID], [Class_Name], [FK_Class_Teacher_ID]) VALUES (2, N'Biology 1', 1)
INSERT [dbo].[Class] ([PK_Class_ID], [Class_Name], [FK_Class_Teacher_ID]) VALUES (3, N'Business Intro', 1)
INSERT [dbo].[Class] ([PK_Class_ID], [Class_Name], [FK_Class_Teacher_ID]) VALUES (4, N'Programming 2', 1)
INSERT [dbo].[Class] ([PK_Class_ID], [Class_Name], [FK_Class_Teacher_ID]) VALUES (5, N'Biology 2', 2)
GO
INSERT [dbo].[Enrollment] ([PK_Student_Class_ID], [FK_Student_ID], [FK_Class_ID]) VALUES (1, 1, 1)
INSERT [dbo].[Enrollment] ([PK_Student_Class_ID], [FK_Student_ID], [FK_Class_ID]) VALUES (2, 1, 2)
INSERT [dbo].[Enrollment] ([PK_Student_Class_ID], [FK_Student_ID], [FK_Class_ID]) VALUES (3, 2, 2)
INSERT [dbo].[Enrollment] ([PK_Student_Class_ID], [FK_Student_ID], [FK_Class_ID]) VALUES (4, 2, 3)
INSERT [dbo].[Enrollment] ([PK_Student_Class_ID], [FK_Student_ID], [FK_Class_ID]) VALUES (5, 2, 4)
INSERT [dbo].[Enrollment] ([PK_Student_Class_ID], [FK_Student_ID], [FK_Class_ID]) VALUES (6, 3, 5)
GO
INSERT [dbo].[Program] ([PK_Program_ID], [Program_Name]) VALUES (1, N'Economics')
INSERT [dbo].[Program] ([PK_Program_ID], [Program_Name]) VALUES (2, N'Computer Science')
INSERT [dbo].[Program] ([PK_Program_ID], [Program_Name]) VALUES (3, N'Medicine')
INSERT [dbo].[Program] ([PK_Program_ID], [Program_Name]) VALUES (4, N'Dentistry')
GO
INSERT [dbo].[Student] ([PK_Student_ID], [Student_FName], [Student_LName], [Student_DOB], [Student_AD_Line1], [Student_AD_Line2], [Student_AD_City], [Student_AD_ZIP], [FK_Student_Tuition_ID], [FK_Student_Program_ID]) VALUES (1, N'John', N'Smith', CAST(N'1991-08-04T00:00:00.000' AS DateTime), N'3 Main Street', NULL, N'North Boston', N'56125', N'Yes', 1)
INSERT [dbo].[Student] ([PK_Student_ID], [Student_FName], [Student_LName], [Student_DOB], [Student_AD_Line1], [Student_AD_Line2], [Student_AD_City], [Student_AD_ZIP], [FK_Student_Tuition_ID], [FK_Student_Program_ID]) VALUES (2, N'Maria', N'Griffin', CAST(N'1992-09-10T00:00:00.000' AS DateTime), N'16 Leeds Road', NULL, N'South Boston', N'56128', N'No', 2)
INSERT [dbo].[Student] ([PK_Student_ID], [Student_FName], [Student_LName], [Student_DOB], [Student_AD_Line1], [Student_AD_Line2], [Student_AD_City], [Student_AD_ZIP], [FK_Student_Tuition_ID], [FK_Student_Program_ID]) VALUES (3, N'Susan', N'Johnson', CAST(N'1991-01-13T00:00:00.000' AS DateTime), N'21 Arrow Street', NULL, N'South Boston', N'56128', N'Yes', 3)
INSERT [dbo].[Student] ([PK_Student_ID], [Student_FName], [Student_LName], [Student_DOB], [Student_AD_Line1], [Student_AD_Line2], [Student_AD_City], [Student_AD_ZIP], [FK_Student_Tuition_ID], [FK_Student_Program_ID]) VALUES (4, N'Matt', N'Long', CAST(N'1992-04-25T00:00:00.000' AS DateTime), N'14 Milk Lane', N'A', N'South Boston', N'56128', N'Yes', 4)
GO
