Use [AssignmentDBI]

-- Creat table

CREATE TABLE Students (
   [SID] [varchar](50) NOT NULL,
   [FirstName] [nvarchar](50) NOT NULL,
   [LastName] [nvarchar](50) NOT NULL,
   [Gender] [bit] NOT NULL,
   [DoB] [date] NOT NULL, 
   [Email] [varchar](50) NOT NULL,
   CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Groups (
   [GID] [varchar](50) NOT NULL,
   [Majors] [varchar](50) NOT NULL,
   [NUM_of_Students] [varchar] (50) NOT NULL,
   CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Join] (
   [SID] [varchar](50) NOT NULL,
   [GID] [varchar](50) NOT NULL,
CONSTRAINT [PK_Join] PRIMARY KEY CLUSTERED 
(
	[SID] ASC,
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Classes (
   [ClassID] [varchar] (50) NOT NULL,
   [AssignID] [varchar](50) NOT NULL,
   [Semester] [varchar] (50) NOT NULL,
   [Start Date] [date] NOT NULL,
   [End Date] [date] NOT NULL,
CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Enroll (
   [GID] [varchar](50) NOT NULL,
   [ClassID] [varchar](50) NOT NULL,
CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Lectures (
   [LecID] [varchar](50) NOT NULL,
   [AssignID] [varchar](50) NOT NULL,
   [FirstName] [nvarchar](50) NOT NULL,
   [LastName] [nvarchar](50) NOT NULL,
   [DoB] [date] NOT NULL,
   [Email] [varchar](50) NOT NULL,
   [Gender] [bit] NOT NULL,
   [Report] [varchar](200) NOT NULL,
CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[LecID] ASC,
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Assignment (
   [AssignID] [varchar](50) NOT NULL,
   [AssignName] [varchar](50) NOT NULL,
CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Courses (
   [CourseID] [varchar](50) NOT NULL,
   [AssignID] [varchar](50) NOT NULL,
   [CourseName] [nvarchar](50) NOT NULL,
CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Assessment_System (
   [AssessID] [varchar](50) NOT NULL,
   [CourseID] [varchar](50) NOT NULL,
   [CategoryID] [varchar](50) NOT NULL,
   [Weight] [float] NOT NULL,
   [Num_of_ques] [varchar](50) NOT NULL,
   [Duration] [varchar](50) NOT NULL,
CONSTRAINT [PK_Assessment_System] PRIMARY KEY CLUSTERED 
(
    [AssessID] ASC,
	[CourseID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Categoties (
   [CategoryID] [varchar](50) NOT NULL PRIMARY KEY,
   [CategoryName] [varchar](50) NOT NULL,
   [Type] [varchar](50) NOT NULL,
   [Completion_Criteria] [varchar](50) NOT NULL,
)

CREATE TABLE Grade (
   [AssessID] [varchar](50) NOT NULL,
   [SID] [varchar](50) NOT NULL,
   [Score] [float](15) NOT NULL,
   [Date Exam] [date] NOT NULL,
CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
    [AssessID] ASC,
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Assess (
   [AssessID] [varchar](50) NOT NULL,
   [ClassID] [varchar](50) NOT NULL,
CONSTRAINT [PK_Assess] PRIMARY KEY CLUSTERED 
(
    [AssessID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [View] (
   [SID] [varchar](50) NOT NULL,
   [ClassID] [varchar](50) NOT NULL,
   [Status] [varchar](50) NOT NULL,
   [Average] [float](15) NOT NULL,
CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
    [SID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Join]  WITH CHECK ADD CONSTRAINT [FK_Join_Students] FOREIGN KEY([SID])
REFERENCES [Students] ([SID])
GO
ALTER TABLE [Join] CHECK CONSTRAINT [FK_Join_Students]
GO

ALTER TABLE [Join]  WITH CHECK ADD CONSTRAINT [FK_Join_Groups] FOREIGN KEY([GID])
REFERENCES [Groups] ([GID])
GO
ALTER TABLE [Join] CHECK CONSTRAINT [FK_Join_Groups]
GO

ALTER TABLE [Enroll]  WITH CHECK ADD CONSTRAINT [FK_Enroll_Groups] FOREIGN KEY([GID])
REFERENCES [Groups] ([GID])
GO
ALTER TABLE [Enroll] CHECK CONSTRAINT [FK_Enroll_Groups]
GO

ALTER TABLE [Enroll]  WITH CHECK ADD CONSTRAINT [FK_Enroll_Classes] FOREIGN KEY([ClassID])
REFERENCES [Classes] ([ClassID])
GO
ALTER TABLE [Enroll] CHECK CONSTRAINT [FK_Enroll_Classes]
GO

ALTER TABLE [Classes]  WITH CHECK ADD CONSTRAINT [FK_Classes_Lectures] FOREIGN KEY([AssignID])
REFERENCES [Lectures] ([AssignID])
GO
ALTER TABLE [Classes] CHECK CONSTRAINT [FK_Classes_Lectures]
GO
