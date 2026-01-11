CREATE DATABASE college_db;
USE college_db;
-- Question Number 1 and 2
CREATE TABLE Departments(
    Department_id INT PRIMARY KEY,
    Department_name VARCHAR(90) NOT NULL);

CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    Name VARCHAR(80) NOT NULL,
    Email VARCHAR(90) UNIQUE NOT NULL,   -- Email must be unique
    Gender ENUM('Male','Female','Others'),
    Date_Of_Birth DATE,
    Department_id INT,FOREIGN KEY(Department_id)REFERENCES Departments(Department_id));

CREATE TABLE Courses(
    Course_id VARCHAR(90) PRIMARY KEY,
    Course_name VARCHAR(110) NOT NULL,
    Department_id INT,
    Credits INT NOT NULL CHECK(Credits > 0) -- Credits must be greater than 0
);

CREATE TABLE Enrollments(
    Enrollment_id INT PRIMARY KEY,
    student_id INT,
    Course_id VARCHAR(90),
    FOREIGN KEY(student_id) REFERENCES Students(student_id),
    FOREIGN KEY(Course_id) REFERENCES Courses(Course_id),
    UNIQUE(student_id, Course_id) -- prevent duplicate enrollment
);

CREATE TABLE Marks(
    Mark_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    Course_id VARCHAR(90) NOT NULL,
    Marks_obtained INT CHECK(Marks_obtained BETWEEN 0 AND 100), -- Marks constraint
    FOREIGN KEY(student_id) REFERENCES Students(student_id),
    FOREIGN KEY(Course_id) REFERENCES Courses(Course_id));
    
    -- Question Number 3
    -- Data insertion in Department Table
    INSERT INTO college_db.Departments(Department_id,Department_name) values(101,'Computer_science'),
    (102,'Electronics_And_Telecommunication'),
    (103,'Economics'),
    (104,'Phisics'),
    (105,'Chemistry');
    
    -- Data insertion in Students Table
    INSERT INTO college_db.Students(student_id,Name,Email,Gender,Date_Of_Birth,Department_id) values(111,'Raj','raj111@gmail.com','Male','2003-10-12',102),
    (112,'Rupali','rupali@gmail.com','Female','2004-12-03',101),
    (113,'XYZ','xyz113@gmail.com','Others','2002-09-08',103),
    (114,'Lakhan','lakhan114@gmail.com','Male','2001-07-15',102),
    (115,'Sharda','xyz115@gmail.com','Female','2003-09-18',104),
    (116,'Amit','amit116@gmail.com','Male','2003-10-17',103),
    (117,'Pranita','pranita117@gmail.com','Female','2004-10-03',102),
    (118,'ABC','hij118@gmail.com','Others','2002-04-22',104),
    (119,'Sanket','sanket119@gmail.com','Male','2005-06-19',101),
    (120,'Pratik','pratik120@gmail.com','Male','2002-10-18',105);
    
    -- Data insertion in Courses Table
    INSERT INTO college_db.Courses(Course_id,Course_name,Department_id,Credits) values(2001,'Bachelor of commerce',103,5),
    (2002,'Bachelor of Science',104,6),
    (2003,'Bachelor of Arts',102,5),
    (2004,'Bachelor of Engineering',101,6),
    (2005,'Bachelor of Computer Application',101,8),
    (2006,'Bachelor of Business Administration',103,9),
    (2007,'Bachelor of Technology',101,8),
    (2008,'Bachelor of Fine Arts',103,7);
    
    -- Data insertion in Enrollments Table
    INSERT INTO college_db.Enrollments( Enrollment_id,student_id, Course_id) values(1001,117,2002),
    (1002,112,2005),
    (1003,113,2001),
    (1004,117,2008),
    (1005,119,2003),
    (1006,117,2005),
    (1007,114,2006),
    (1008,111,2004),
    (1009,115,2007),
    (1010,113,2003),
    (1011,116,2006),
    (1112,119,2004),
    (1113,118,2002),
    (1114,112,2008),
    (1115,114,2001);
    
    -- Data insertion in Marks Table
    INSERT INTO Marks(Mark_id,student_id,Course_id,Marks_obtained) values(3001,111,2002,97),
    (3002,115,2001,95),
    (3003,117,2003,98),
    (3004,119,2005,92),
    (3005,111,2007,85),
    (3006,113,2002,90),
    (3007,115,2004,92),
    (3008,117,2006,97),
    (3009,119,2008,86),
    (3010,120,2001,90),
    (3011,111,2003,98),
    (3012,113,2005,88),
    (3013,115,2007,96),
    (3014,117,2002,89),
    (3015,119,2004,98);
    
    -- Question Number-4
    SELECT * FROM Students;
    SELECT Students.Name,Departments.Department_name FROM Students INNER JOIN Departments ON Students.Department_id=Departments.Department_id;
    
    SELECT Departments.Department_name,Courses.Course_name FROM Departments INNER JOIN Courses ON Departments.Department_id=Courses.Department_id;
    
SELECT Students.Name, COUNT(Enrollments.Course_id) AS Total_Courses
FROM Enrollments 
INNER JOIN Students ON Enrollments.student_id = Students.student_id
GROUP BY Students.student_id, Students.Name
HAVING COUNT(Enrollments.Course_id) > 1;

SELECT Students.Name, Marks.Marks_obtained
FROM Marks
INNER JOIN Students ON Marks.student_id = Students.student_id
WHERE Marks.Marks_obtained > 95;

-- Question Number 5
SELECT Students.Name AS Student_Name, Courses.Course_name AS Course_Name,Marks.Marks_obtained AS Marks FROM Marks INNER JOIN Students ON Marks.student_id = Students.student_id
INNER JOIN Courses ON Marks.Course_id =Courses.Course_id;
  
SELECT Students.student_id, Students.Name FROM Students LEFT JOIN Marks ON Students.student_id=Marks.student_id WHERE Marks.student_id IS NULL;

SELECT Departments.Department_name, COUNT(Students.student_id) AS Student_Count FROM Departments LEFT JOIN Students ON Departments.Department_id = Students.
Department_id GROUP BY Departments.Department_name;

SELECT Courses.Course_name, COUNT(Enrollments.student_id) AS Student_Count FROM Courses LEFT JOIN Enrollments ON Courses.Course_id = Enrollments.Course_id 
GROUP BY Courses.Course_name;

-- Question Number 6
SELECT Students.Name,Marks.Marks_obtained FROM Students JOIN Marks ON Students.student_id=Marks.student_id WHERE Marks.Marks_obtained >(SELECT AVG(Marks_obtained)
FROM Marks);

SELECT Students.Name,Marks.Marks_obtained FROM Students JOIN Marks ON Students.student_id=Marks.student_id WHERE Marks.Marks_obtained =(SELECT MAX(Marks_obtained)
FROM Marks);

SELECT Courses.Course_id, Courses.Course_name FROM Courses WHERE Courses.Course_id NOT IN (SELECT Enrollments.Course_id FROM Enrollments);

SELECT s.Name AS Student_Name, c.Course_name, d.Department_name FROM Students s JOIN Enrollments e ON s.student_id = e.student_id JOIN Courses c ON e.Course_id = c.Course_id
JOIN Departments d ON c.Department_id = d.Department_id WHERE d.Department_id = 103;  -- specific department

