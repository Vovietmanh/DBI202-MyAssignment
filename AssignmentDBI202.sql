USE [AssignmentDBI202]

-- create table

CREATE TABLE Students (
	[SID] [varchar](35) NOT NULL PRIMARY KEY,
	[Email] [varchar](50) NOT NULL,
	[First Name] [nvarchar](35) NOT NULL,
	[Last Name] [nvarchar](35) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Date of Birth] [date] NOT NULL,
)
CREATE TABLE Groups (
	[GID] [varchar](35) NOT NULL PRIMARY KEY,
	[Major] [varchar](35) NOT NULL,
	[Num of Students] [int] NOT NULL,
)

CREATE TABLE [Join] (
	[SID] [varchar](35) NOT NULL,
	[GID] [varchar](35) NOT NULL,	
	CONSTRAINT [PK_Join] PRIMARY KEY (SID, GID),
	CONSTRAINT [FK_Join_Groups] FOREIGN KEY([GID]) REFERENCES [dbo].[Groups] ([GID]),
	CONSTRAINT [FK_Join_Students] FOREIGN KEY([SID]) REFERENCES [dbo].[Students] ([SID])
)

CREATE TABLE Lectures (
	[LecID] [varchar](35) NOT NULL PRIMARY KEY,
	[Email] [varchar](50) NOT NULL,
	[First Name] [nvarchar](35) NOT NULL,
	[Last Name] [nvarchar](35) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Date of Birth] [date] NOT NULL,
	[Report] [varchar](35) NULL,
	CONSTRAINT [FK_Lectures_Lectures] FOREIGN KEY([Report]) REFERENCES [dbo].[Lectures] ([LecID]),
)

CREATE TABLE Courses (
	[CourseID] [varchar](35) NOT NULL PRIMARY KEY,
	[CourseName] [varchar](35) NOT NULL,
)

CREATE TABLE Assignment (
	[AssignID] [varchar](35) NOT NULL PRIMARY KEY,
	[Major] [varchar](35) NOT NULL,
	[Lecture] [varchar](35) NOT NULL,
	CONSTRAINT [FK_Assignment_Courses] FOREIGN KEY([Major]) REFERENCES [dbo].[Courses] ([CourseID]),
	CONSTRAINT [FK_Assignment_Lectures] FOREIGN KEY([Lecture]) REFERENCES [dbo].[Lectures] ([LecID]),
)

CREATE TABLE Classes (
	[ClassID] [varchar](35) NOT NULL PRIMARY KEY,
	[AssignID] [varchar](35) NOT NULL,
	[Semester] [varchar](35) NOT NULL,
	[Start Date] [date] NOT NULL,
	[End Date] [date] NOT NULL,
	CONSTRAINT [FK_Classes_Assignment] FOREIGN KEY([AssignID]) REFERENCES [dbo].[Assignment] ([AssignID]),
)

CREATE TABLE Enroll (
	[ClassID] [varchar](35) NOT NULL,
	[GID] [varchar](35) NOT NULL,
	CONSTRAINT [PK_Enroll] PRIMARY KEY (ClassID, GID),
	CONSTRAINT [FK_Enroll_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([ClassID]),
	CONSTRAINT [FK_Enroll_Groups] FOREIGN KEY([GID]) REFERENCES [dbo].[Groups] ([GID])
)

CREATE TABLE Categories (
	[CategoryID] [varchar](35) NOT NULL PRIMARY KEY ,
	[CategoryName] [varchar](35) NOT NULL,
	[Type] [varchar](35) NOT NULL,
	[Completion Criteria] [varchar](35) NOT NULL,
)

CREATE TABLE [Assessment System] (
	[AssessID] [varchar](35) NOT NULL PRIMARY KEY,
	[CategoryID] [varchar](35) NOT NULL,
	[CourseID] [varchar](35) NOT NULL,
	[Num of Ques] [int] NOT NULL,
	[Duration] [varchar](35) NOT NULL,
	[Weight] [float] NOT NULL,
	CONSTRAINT [FK_Assessment System_Categories] FOREIGN KEY([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID]),
	CONSTRAINT [FK_Assessment System_Courses] FOREIGN KEY([CourseID]) REFERENCES [dbo].[Courses] ([CourseID]),
)

CREATE TABLE Assess (
	[AssessID] [varchar](35) NOT NULL,
	[ClassID] [varchar](35) NOT NULL,	
	CONSTRAINT [PK_Assess] PRIMARY KEY (AssessID, ClassID),
	CONSTRAINT [FK_Assess_Assessment System] FOREIGN KEY([AssessID]) REFERENCES [dbo].[Assessment System] ([AssessID]),
	CONSTRAINT [FK_Assess_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([ClassID]),
)

CREATE TABLE Grade (
	[SID] [varchar](35) NOT NULL,
	[AssessID] [varchar](35) NOT NULL,
	[Score] [float] NOT NULL,
	[Date] [date] NOT NULL,
	CONSTRAINT [FK_Grade_Assessment System] FOREIGN KEY([AssessID]) REFERENCES [dbo].[Assessment System] ([AssessID]),
	CONSTRAINT [FK_Grade_Students] FOREIGN KEY([SID]) REFERENCES [dbo].[Students] ([SID]),
	CONSTRAINT [PK_Grade] PRIMARY KEY (SID, AssessID, [Date]),
)

CREATE TABLE [View] (
	[SID] [varchar](35) NOT NULL,
	[ClassID] [varchar](35) NOT NULL,
	[Average] [float] NOT NULL,
	[Status] [varchar](35) NOT NULL,
	CONSTRAINT [PK_View] PRIMARY KEY (SID, ClassID),
	CONSTRAINT [FK_View_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([ClassID]),
	CONSTRAINT [FK_View_Students] FOREIGN KEY([SID]) REFERENCES [dbo].[Students] ([SID]),
)

-- Đưa dữ liệu vào database 
SELECT * FROM Students

INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160001', N'chungdv@fpt.edu.vn', N'Chung', N'Đỗ Văn', 1, CAST(N'2002-07-05' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160002', N'ducnvfpt.edu.vn', N'Đức', N'Nguyễn Văn', 1, CAST(N'2002-03-09' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160003', N'anhlv@fpt.edu.vn', N'Anh', N'Lê Việt', 1, CAST(N'2002-06-10' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160004', N'dathm@fpt.edu.vn', N'Đạt', N'Hà Mạnh', 1, CAST(N'2002-07-19' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160005', N'namtv@fpt.edu.vn', N'Nam', N'Tạ Việt', 1, CAST(N'2002-09-17' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160006', N'huyvd@fpt.edu.vn', N'Huy', N'Vũ Đức', 1, CAST(N'2002-09-01' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160007', N'duccn@fpt.edu.vn', N'Đức', N'Châu Ngọc', 1, CAST(N'2002-10-11' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160008', N'anhdd@fpt.edu.vn', N'Anh', N'Đỗ Đức', 1, CAST(N'2002-06-22' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160009', N'huynn@fpt.edu.vn', N'Huy', N'Nguyễn Nhật', 1, CAST(N'2002-03-08' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160010', N'dattcd@fpt.edu.vn', N'Đạt', N'Trần Công Doãn', 1, CAST(N'2002-10-20' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160011', N'tamttt@fpt.edu.vn', N'Tâm', N'Trần Thị Thanh', 0, CAST(N'2002-01-21' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160012', N'datnt@fpt.edu.vn', N'Đat', N'Nguyễn Thành', 1, CAST(N'2002-08-23' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160013', N'hath@fpt.edu.vn', N'Hà', N'Trần Hải', 1, CAST(N'2002-07-03' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160014', N'quandm@fpt.edu.vn', N'Quân', N'Đỗ Minh', 1, CAST(N'2002-10-12' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160015', N'duongnn@fpt.edu.vn', N'Dương', N'Nguyễn Ngọc', 1, CAST(N'2002-07-31' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160016', N'thinhnd@fpt.edu.vn', N'Thịnh', N'Nguyễn Doanh', 1, CAST(N'2002-08-08' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160017', N'duongnt@fpt.edu.vn', N'Dương', N'Nguyễn Tùng', 1, CAST(N'2002-07-22' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160018', N'anhvt@fpt.edu.vn', N'Anh', N'Vũ Tuấn', 1, CAST(N'2002-03-03' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160019', N'thanhtd@fpt.edu.vn', N'Thành', N'Triệu Đức', 1, CAST(N'2002-05-15' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160020', N'hieulkm@fpt.edu.vn', N'Hiếu', N'Lê Khắc Minh', 1, CAST(N'2002-04-04' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160021', N'vuongnv@fpt.edu.vn', N'Vương', N'Nguyễn Văn', 1, CAST(N'2002-03-31' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160022', N'minhtt@fpt.edu.vn', N'Minh', N'Trương Hoàng', 1, CAST(N'2002-02-08' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160023', N'hiepdv@fpt.edu.vn', N'Hiệp', N'Đào Vũ', 1, CAST(N'2002-11-20' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160024', N'thuongnc@fpt.edu.vn', N'Thương', N'Nguyễn Cảnh', 1, CAST(N'2002-02-15' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160025', N'huynq@fpt.edu.vn', N'Huy', N'Nguyễn Quang', 1, CAST(N'2002-01-15' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160026', N'namnn@fpt.edu.vn', N'Nam', N'Nguyễn Nhật', 1, CAST(N'2002-01-29' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160027', N'quangnv@fpt.edu.vn', N'Quang', N'Nguyễn Văn', 1, CAST(N'2002-02-28' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160028', N'sont@fpt.edu.vn', N'Sơn', N'Trịnh Tùng', 1, CAST(N'2002-02-01' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160029', N'dangph@fpt.edu.vn', N'Đăng', N'Phạm Hồng', 1, CAST(N'2002-09-23' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160030', N'manhvv@fpt.edu.vn', N'Mạnh', N'Võ Viết', 1, CAST(N'2002-07-26' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160031', N'vutq@fpt.edu.vn', N'Vũ', N'Thái Quang', 1, CAST(N'2002-12-15' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160032', N'vietpq@fpt.edu.vn', N'Việt', N'Phạm Quang', 1, CAST(N'2002-12-26' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160033', N'dantt@fpt.edu.vn', N'Đan', N'Trần Thái', 1, CAST(N'2002-01-29' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160034', N'uyennt@fpt.edu.vn', N'Uyên', N'Nguyễn Thu', 0, CAST(N'2002-04-16' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160035', N'vanvt@fpt.edu.vn', N'Vân', N'Vũ Thảo', 0, CAST(N'2002-07-13' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160036', N'linhpt@fpt.edu.vn', N'Linh', N'Phan Thùy', 0, CAST(N'2002-07-18' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160037', N'tudt@fpt.edu.vn', N'Tú', N'Dương Trần', 1, CAST(N'2002-05-14' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160038', N'quocnt@fpt.edu.vn', N'Quốc', N'Nguyễn Trung', 1, CAST(N'2002-11-11' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160039', N'binhlb@fpt.edu.vn', N'Bình', N'Lê Bảo', 1, CAST(N'2002-09-12' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160040', N'tungnt@fpt.edu.vn', N'Tùng', N'Nguyễn Thanh', 1, CAST(N'2002-02-10' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160041', N'anhnn@fpt.edu.vn', N'Anh', N'Nguyễn Ngọc', 0, CAST(N'2002-07-13' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160042', N'nguyetht@fpt.edu.vn', N'Nguyệt', N'Hoàng Thị', 0, CAST(N'2002-05-04' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160043', N'tungtv@fpt.edu.vn', N'Tùng', N'Trần Văn', 1, CAST(N'2002-08-04' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160044', N'hoangdv@fpt.edu.vn', N'Hoàng', N'Đào Văn', 1, CAST(N'2002-02-09' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160045', N'daoha@fpt.edu.vn', N'Đào', N'Hà Anh', 0, CAST(N'2002-05-05' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160046', N'trangnt@fpt.edu.vn', N'Trang', N'Nguyễn Thùy', 0, CAST(N'2002-03-03' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160047', N'gianglm@fpt.edu.vn', N'Giang', N'Lương Minh', 0, CAST(N'2002-07-13' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160048', N'cont@fpt.edu.vn', N'Cơ', N'Nguyễn Thanh', 0, CAST(N'2002-11-17' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160049', N'thutm@fpt.edu.vn', N'Thư', N'Tạ Minh', 0, CAST(N'2002-12-21' AS Date));
INSERT [dbo].[Students] ([SID], [Email], [First Name], [Last Name], [Gender], [Date of Birth]) VALUES (N'HE160050', N'anhpt@fpt.edu.vn', N'Anh', N'Phan Tuyết', 0, CAST(N'2002-10-23' AS Date));



SELECT * FROM Groups 
INSERT Groups(GID, Major, [Num of Students]) VALUES ('IA1604', 'Information Assurance', 30);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('AI1606', 'Artificial Intelligence', 28);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('SE1636', 'Software Engineering', 25);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('IOT1602', 'Internet of Things', 30);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('AI1601', 'Artificial Intelligence', 29);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('IA1601', 'Information Assurance', 27);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('SE1643', 'Software Engineering', 29);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('IA1602', 'Information Assurance', 26);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('IS1603', 'Information Specialization', 25);
INSERT Groups(GID, Major, [Num of Students]) VALUES ('SE1637', 'Software Engineering', 28);


SELECT * FROM [Join]
INSERT [Join](SID, GID) VALUES ('HE160001', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160002', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160003', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160004', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160005', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160006', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160007', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160008', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160009', 'IA1604');
INSERT [Join](SID, GID) VALUES ('HE160010', 'IA1604');

INSERT [Join](SID, GID) VALUES ('HE160011', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160012', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160013', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160014', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160015', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160016', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160017', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160018', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160019', 'AI1606');
INSERT [Join](SID, GID) VALUES ('HE160020', 'AI1606');

INSERT [Join](SID, GID) VALUES ('HE160021', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160022', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160023', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160024', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160025', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160026', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160027', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160028', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160029', 'SE1636');
INSERT [Join](SID, GID) VALUES ('HE160030', 'SE1636');

INSERT [Join](SID, GID) VALUES ('HE160031', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160032', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160033', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160034', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160035', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160036', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160037', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160038', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160039', 'IOT1602');
INSERT [Join](SID, GID) VALUES ('HE160040', 'IOT1602');

INSERT [Join](SID, GID) VALUES ('HE160041', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160042', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160043', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160044', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160045', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160046', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160047', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160048', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160049', 'IS1603');
INSERT [Join](SID, GID) VALUES ('HE160050', 'IS1603');


SELECT * FROM Lectures
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVA', 'khuongpd@fe.edu.vn', N'Khương', N'Phùng Duy', 1, CAST('1991-05-19' AS date), NULL);
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVB', 'anhbn@fe.edu.vn', N'Anh', N'Bùi Ngọc', 0, CAST('1992-06-10' AS date), 'GVA');
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVC', 'phuonglh@fe.edu.vn', N'Phương', N'Lại Hiền', 0, CAST('1988-03-01' AS date), 'GVA');
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVG', 'chilp@fe.edu.vn', N'Lê', N'Phương Chi', 0, CAST('1989-09-01' AS date), 'GVF');
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVH', 'cuonghd@fe.edu.vn', N'Cường', N'Hoàng Đình', 1, CAST('1990-08-12' AS date), NULL);
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVI', 'sonnt@fe.edu.vn', N'Sơn', N'Ngô Tùng', 1, CAST('1980-10-21' AS date), 'GVH');
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVJ', 'tientd@fe.edu.vn', N'Tiến', N'Tạ Đình', 1, CAST('1987-05-24' AS date), 'GVH');
INSERT Lectures(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVK', 'bantq@fe.edu.vn', N'Ban', N'Trần Quý', 1, CAST('1986-12-31' AS date), 'GVH');


SELECT * FROM Courses
INSERT [dbo].[Courses]([CourseID], [CourseName]) VALUES (N'CSD201', N'Data Structures and Algorithms');
INSERT [dbo].[Courses]([CourseID], [CourseName]) VALUES (N'DBI202', N'Introduction to Databases');
INSERT [dbo].[Courses]([CourseID], [CourseName]) VALUES (N'LAB211', N'OOP with Java Labs');
INSERT [dbo].[Courses]([CourseID], [CourseName]) VALUES (N'IAO202', N'Introduction to Infor Assurance');
INSERT [dbo].[Courses]([CourseID], [CourseName]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1');


SELECT * FROM Assignment 
INSERT Assignment(AssignID, Major, Lecture) VALUES ('DBI1', 'DBI202', 'GVA');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('DBI2', 'DBI202', 'GVB');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('JPD3', 'JPD113', 'GVC');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('IAO1', 'IAO202', 'GVJ');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('LAB1', 'LAB211', 'GVH');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('IAO3', 'IAO202', 'GVI');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('JPD1', 'JPD113', 'GVJ');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('CSD1', 'CSD201', 'GVK');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('JPD2', 'JPD113', 'GVA');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('LAB2', 'LAB211', 'GVB');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('DBI3', 'DBI202', 'GVC');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('LAB3', 'LAB211', 'GVA');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('CSD2', 'CSD201', 'GVH');
INSERT Assignment(AssignID, Major, Lecture) VALUES ('IAO2', 'IAO202', 'GVJ');


SELECT * FROM Classes
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22IAO1', 'IAO1', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22DBI1', 'DBI1', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22CSD2', 'CSD2', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22JPD3', 'JPD3', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22IAO2', 'IAO2', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22LAB1', 'LAB1', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22CSD3', 'CSD3', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22IAO3', 'IAO3', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22LAB2', 'LAB2', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SP22DBI2', 'DBI2', 'SPRING 2022', CAST('2022-05-09' AS date), CAST('2022-07-25' AS date));

INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21LAB1', 'LAB1', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21JPD1', 'JPD1', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21DBI1', 'DBI1', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21IAO1', 'IAO1', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21CSD1', 'CSD1', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21DBI3', 'DBI3', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21LAB2', 'LAB2', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21JPD2', 'JPD2', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21IAO3', 'IAO3', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('FA21CSD3', 'CSD3', 'FALL 2021', CAST('2021-01-09' AS date), CAST('2021-04-08' AS date));

INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21IAO2', 'IAO2', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21JPD3', 'JPD3', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21IAO3', 'IAO3', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21LAB2', 'LAB2', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21LAB1', 'LAB1', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21CSD3', 'CSD3', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21DBI1', 'DBI1', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21CSD2', 'CSD2', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21JPD1', 'JPD1', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21DBI3', 'DBI3', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));
INSERT Classes(ClassID, AssignID, Semester, [Start Date], [End Date]) VALUES ('SU21CSD1', 'CSD1', 'SUMMER 2021', CAST('2021-04-16' AS date), CAST('2021-07-26' AS date));


SELECT * FROM Enroll
INSERT Enroll(ClassID, GID) VALUES ('SP22CSD1', 'IA1604');
INSERT Enroll(ClassID, GID) VALUES ('SU21CSD2', 'IA1604');
INSERT Enroll(ClassID, GID) VALUES ('FA21IAO3', 'IA1604');
INSERT Enroll(ClassID, GID) VALUES ('SP22LAB2', 'IA1604');
INSERT Enroll(ClassID, GID) VALUES ('SU21CSD3', 'IA1604');

INSERT Enroll(ClassID, GID) VALUES ('SP22IAO1', 'AI1606');
INSERT Enroll(ClassID, GID) VALUES ('FA21LAB2', 'AI1606');
INSERT Enroll(ClassID, GID) VALUES ('SP22LAB1', 'AI1606');
INSERT Enroll(ClassID, GID) VALUES ('FA21JPD2', 'AI1606');
INSERT Enroll(ClassID, GID) VALUES ('SP22JPD3', 'AI1606');

INSERT Enroll(ClassID, GID) VALUES ('SU21DBI3', 'SE1636');
INSERT Enroll(ClassID, GID) VALUES ('FA21CSD1', 'SE1636');
INSERT Enroll(ClassID, GID) VALUES ('SP22IAO2', 'SE1636');
INSERT Enroll(ClassID, GID) VALUES ('SU21LAB1', 'SE1636');
INSERT Enroll(ClassID, GID) VALUES ('FA21JPD1', 'SE1636');

INSERT Enroll(ClassID, GID) VALUES ('SP22JPD3', 'IOT1602');
INSERT Enroll(ClassID, GID) VALUES ('SU21CSD1', 'IOT1602');
INSERT Enroll(ClassID, GID) VALUES ('SP22LAB1', 'IOT1602');
INSERT Enroll(ClassID, GID) VALUES ('FA21CSD3', 'IOT1602');
INSERT Enroll(ClassID, GID) VALUES ('SU21DBI3', 'IOT1602');

INSERT Enroll(ClassID, GID) VALUES ('FA21LAB1', 'IS1603');
INSERT Enroll(ClassID, GID) VALUES ('SU21IAO2', 'IS1603');
INSERT Enroll(ClassID, GID) VALUES ('FA21LAB2', 'IS1603');
INSERT Enroll(ClassID, GID) VALUES ('SP22CSD2', 'IS1603');
INSERT Enroll(ClassID, GID) VALUES ('SU21DBI1', 'IS1603');


SELECT * FROM Categories
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('AS', 'Assignment ', 'On-Going', '>0');
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('LAB', 'Lab', 'On-Going', '>0');
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('LOC', 'Line of Code', 'On-Going', '>=750');
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('PT', 'Progress Test', 'On-Going', '>0');
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('PE', 'Practical Exam', 'On-Going', '>0');
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('FE', 'Final Exam', 'Final Exam', '>4');
INSERT Categories(CategoryID, [CategoryName], [Type], [Completion Criteria]) VALUES ('FER', 'Final Exam Retake', 'Final Exam', '>4');


SELECT * FROM [Assessment System]
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('CSDAS1', 'AS', 'CSD201', 20, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('CSDAS2', 'AS', 'CSD201', 20, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('CSDPT1', 'PT', 'CSD201', 30, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('CSDPT2', 'PT', 'CSD201', 30, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('CSDPE', 'PE', 'CSD201', 10, '90 mins', 0.3); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('CSDFE', 'FE', 'CSD201', 50, '60 mins', 0.1); 

INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('DBIAS1', 'AS', 'DBI202', 20, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('DBIAS2', 'AS', 'DBI202', 20, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('DBIPT1', 'PT', 'DBI202', 20, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('DBIPT2', 'PT', 'DBI202', 20, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('DBIPE', 'PE', 'DBI202', 10, '90 mins', 0.3); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('DBIFE', 'FE', 'DBI202', 50, '60 mins', 0.3); 

INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('LABLOC', 'LOC', 'LAB211', 750, '30 SLOTS', 1); 

INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB1', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB2', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB3', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB4', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB5', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB6', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB7', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB8', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB9', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOLAB10', 'LAB', 'IAO202', 5, '30 mins', 0.05); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOPT1', 'PT', 'IAO202', 30, '60 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOPT2', 'PT', 'IAO202', 30, '60 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('IAOFE', 'FE', 'IAO202', 60, '90 mins', 0.3); 

INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('JPDAS1', 'AS', 'JPD113', 40, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('JPDAS2', 'AS', 'JPD113', 40, '30 mins', 0.1); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('JPDPT1', 'PT', 'JPD113', 40, '30 mins', 0.2); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('JPDPT2', 'PT', 'JPD113', 40, '30 mins', 0.2); 
INSERT [Assessment System](AssessID, CategoryID, CourseID, [Num of Ques], Duration, [Weight]) VALUES ('JPDFE', 'FE', 'JPD113', 50, '60 mins', 0.4); 


SELECT * FROM Assess
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'FA21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'FA21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'FA21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'FA21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'FA21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'FA21DBI1');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'FA21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'FA21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'FA21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'FA21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'FA21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'FA21CSD1');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'FA21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'FA21IAO1');

INSERT Assess(AssessID, ClassID) VALUES ('JPDAS1', 'FA21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDAS2', 'FA21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT1', 'FA21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT2', 'FA21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDFE', 'FA21JPD1');

INSERT Assess(AssessID, ClassID) VALUES ('LABLOC', 'FA21LAB1');

INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'FA21DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'FA21DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'FA21DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'FA21DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'FA21DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'FA21DBI2');

INSERT Assess(AssessID, ClassID) VALUES ('JPDAS1', 'FA21JPD2');
INSERT Assess(AssessID, ClassID) VALUES ('JPDAS2', 'FA21JPD2');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT1', 'FA21JPD2');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT2', 'FA21JPD2');
INSERT Assess(AssessID, ClassID) VALUES ('JPDFE', 'FA21JPD2');

INSERT Assess(AssessID, ClassID) VALUES ('LABLOC', 'FA21LAB2');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'FA21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'FA21IAO3');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'FA21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'FA21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'FA21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'FA21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'FA21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'FA21CSD3');

INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'FA21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'FA21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'FA21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'FA21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'FA21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'FA21DBI3');

INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'SU21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'SU21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'SU21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'SU21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'SU21DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'SU21DBI1');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'SU21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'SU21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'SU21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'SU21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'SU21CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'SU21CSD1');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'SU21IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'SU21IAO1');

INSERT Assess(AssessID, ClassID) VALUES ('JPDAS1', 'SU21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDAS2', 'SU21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT1', 'SU21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT2', 'SU21JPD1');
INSERT Assess(AssessID, ClassID) VALUES ('JPDFE', 'SU21JPD1');

INSERT Assess(AssessID, ClassID) VALUES ('LABLOC', 'SU21LAB1');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'SU21CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'SU21CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'SU21CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'SU21CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'SU21CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'SU21CSD2');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'SU21IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'SU21IAO2');

INSERT Assess(AssessID, ClassID) VALUES ('LABLOC', 'SU21LAB2');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'SU21IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'SU21IAO3');

INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'SU21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'SU21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'SU21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'SU21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'SU21DBI3');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'SU21DBI3');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'SU21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'SU21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'SU21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'SU21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'SU21CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'SU21CSD3');

INSERT Assess(AssessID, ClassID) VALUES ('JPDAS1', 'SU21JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDAS2', 'SU21JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT1', 'SU21JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT2', 'SU21JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDFE', 'SU21JPD3');

INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'SP22DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'SP22DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'SP22DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'SP22DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'SP22DBI1');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'SP22DBI1');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'SP22CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'SP22CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'SP22CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'SP22CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'SP22CSD1');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'SP22CSD1');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'SP22IAO1');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'SP22IAO1');

INSERT Assess(AssessID, ClassID) VALUES ('LABLOC', 'SP22LAB1');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'SP22CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'SP22CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'SP22CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'SP22CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'SP22CSD2');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'SP22CSD2');

INSERT Assess(AssessID, ClassID) VALUES ('DBIAS1', 'SP22DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIAS2', 'SP22DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT1', 'SP22DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPT2', 'SP22DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIPE', 'SP22DBI2');
INSERT Assess(AssessID, ClassID) VALUES ('DBIFE', 'SP22DBI2');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'SP22IAO2');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'SP22IAO2');

INSERT Assess(AssessID, ClassID) VALUES ('LABLOC', 'SP22LAB2');

INSERT Assess(AssessID, ClassID) VALUES ('JPDAS1', 'SP22JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDAS2', 'SP22JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT1', 'SP22JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDPT2', 'SP22JPD3');
INSERT Assess(AssessID, ClassID) VALUES ('JPDFE', 'SP22JPD3');

INSERT Assess(AssessID, ClassID) VALUES ('CSDAS1', 'SP22CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDAS2', 'SP22CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT1', 'SP22CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPT2', 'SP22CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDPE', 'SP22CSD3');
INSERT Assess(AssessID, ClassID) VALUES ('CSDFE', 'SP22CSD3');

INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB1', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB2', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB3', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB4', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB5', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB6', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB7', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB8', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB9', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOLAB10', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT1', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOPT2', 'SP22IAO3');
INSERT Assess(AssessID, ClassID) VALUES ('IAOFE', 'SP22IAO3');


SELECT * FROM Grade
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'CSDAS1', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'CSDAS2', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'CSDPT1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'CSDPT2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'CSDPE', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'CSDFE', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'DBIAS1', 5.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'DBIAS2', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'DBIPT1', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'DBIPT2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'DBIPE', 8.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'DBIFE', 3.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'JPDAS1', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'JPDPT2', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'JPDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'LABLOC', 753, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB4', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB6', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOLAB10', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOPT1', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160001', 'IAOFE', 7, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'CSDAS1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'CSDAS2', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'CSDPT1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'CSDPT2', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'CSDPE', 9.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'CSDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'DBIAS1', 4.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'DBIAS2', 5.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'DBIPT1', 7.9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'DBIPT2', 7.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'DBIPE', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'DBIFE', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'JPDAS1', 6.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'JPDAS2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'JPDPT1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'JPDPT2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'JPDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'LABLOC', 751, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB2', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB3', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB4', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB6', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB9', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOLAB10', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOPT1', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOPT2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160002', 'IAOFE', 8, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'CSDAS1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'CSDAS2', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'CSDPT1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'CSDPT2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'CSDPE', 5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'CSDFE', 7.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'DBIAS1', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'DBIAS2', 8.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'DBIPT1', 7.4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'DBIPT2', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'DBIPE', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'DBIFE', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'JPDAS1', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'JPDPT2', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'JPDFE', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'LABLOC', 750, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB4', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB6', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB7', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB9', 3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOLAB10', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOPT1', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160003', 'IAOFE', 4, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'CSDAS1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'CSDAS2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'CSDPT1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'CSDPT2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'CSDPE', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'CSDFE', 7.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'DBIAS1', 5.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'DBIAS2', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'DBIPT1', 6.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'DBIPT2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'DBIPE', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'DBIFE', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'JPDAS1', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'JPDPT1', 7.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'JPDPT2', 8.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'JPDFE', 9.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'LABLOC', 780, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB4', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB6', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOLAB10', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOPT1', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOPT2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160004', 'IAOFE', 8, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'CSDAS1', 3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'CSDAS2', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'CSDPT1', 4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'CSDPT2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'CSDPE', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'CSDFE', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'DBIAS1', 5.4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'DBIAS2', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'DBIPT1', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'DBIPT2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'DBIPE', 4.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'DBIFE', 3.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'JPDAS1', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'JPDAS2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'JPDPT2', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'JPDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'LABLOC', 733, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB4', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB5', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB6', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOLAB10', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOPT1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOPT2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160005', 'IAOFE', 7, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'CSDAS1', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'CSDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'CSDPT1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'CSDPT2', 6.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'CSDPE', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'CSDFE', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'DBIAS1', 5.4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'DBIAS2', 6.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'DBIPT1', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'DBIPT2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'DBIPE', 4.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'DBIFE', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'JPDAS1', 6.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'JPDAS2', 5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'JPDPT2', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'JPDFE', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'LABLOC', 749, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB3', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB4', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB6', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB7', 4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOLAB10', 4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOPT1', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160006', 'IAOFE', 3, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'CSDAS1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'CSDAS2', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'CSDPT1', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'CSDPT2', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'CSDPE', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'CSDFE', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'DBIAS1', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'DBIAS2', 6.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'DBIPT1', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'DBIPT2', 7.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'DBIPE', 8.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'DBIFE', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'JPDAS1', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'JPDPT2', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'JPDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'LABLOC', 786, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB1', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB4', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB6', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOLAB10', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOPT1', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160007', 'IAOFE', 8, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'CSDAS1', 4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'CSDAS2', 4.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'CSDPT1', 5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'CSDPT2', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'CSDPE', 5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'CSDFE', 7.8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'DBIAS1', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'DBIAS2', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'DBIPT1', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'DBIPT2', 7.9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'DBIPE', 8.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'DBIFE', 4.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'JPDAS1', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'JPDPT2', 7.4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'JPDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'LABLOC', 540, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB4', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB5', 0, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB6', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB7', 0, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOLAB10', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160008', 'IAOFE', 3, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'CSDAS1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'CSDAS2', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'CSDPT1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'CSDPT2', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'CSDPE', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'CSDFE', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'DBIAS1', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'DBIAS2', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'DBIPT1', 7.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'DBIPT2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'DBIPE', 8.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'DBIFE', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'JPDAS1', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'JPDPT1', 9.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'JPDPT2', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'JPDFE', 9.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'LABLOC', 793, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB3', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB4', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB6', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOLAB10', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOPT1', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160009', 'IAOFE', 9, CAST('2022-07-26' AS date));

INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'CSDAS1', 7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'CSDAS2', 6.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'CSDPT1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'CSDPT2', 6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'CSDPE', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'CSDFE', 7.4, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'DBIAS1', 5.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'DBIAS2', 8.6, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'DBIPT1', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'DBIPT2', 7.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'DBIPE', 8.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'DBIFE', 8.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'JPDAS1', 6.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'JPDAS2', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'JPDPT1', 8.7, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'JPDPT2', 7.2, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'JPDFE', 7.3, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'LABLOC', 777, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB1', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB3', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB4', 18, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB5', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB6', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB7', 10, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB8', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB9', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOLAB10', 9, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOPT1', 8, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOPT2', 9.5, CAST('2022-07-26' AS date));
INSERT Grade(SID, AssessID, Score, [Date]) VALUES ('HE160010', 'IAOFE', 8, CAST('2022-07-26' AS date));


SELECT* FROM [View]
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160001', N'SP22IAO1', 7.56555555555, N' PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160002', N'FA21DBI1', 2.789099999999999, N'NOT PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160003', N'SP22IAO3', 4.68909999999, N'NOT PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160004', N'SU21CSD1', 8.76305555555, N' PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160005', N'SP22CSD2', 6.3440333333, N' PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160006', N'FA21CSD3', 3.7890996666, N'NOT PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160007', N'SP22LAB2', 753, N'PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160008', N'SU21LAB1', 749, N'NOT PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160009', N'FA21DBI3', 6.7444444444444, N' PASSED');
INSERT [View]([Sid], [ClassID], [Average], [Status]) VALUES (N'HE160010', N'SU21JPD2', 5.222222222222, N'PASSED');

