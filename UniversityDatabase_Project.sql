-- Create the University database
CREATE DATABASE University___6;

-- Use the University database
USE University___6;

-- Create tables for different aspects of the university

-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'History'),
    (4, 'Physics');
SELECT * FROM Departments;

-- Students table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Insert data into the Students table
INSERT INTO Student(StudentID, FirstName, LastName, DateOfBirth, Gender, Address, Email, PhoneNumber)
VALUES
    (1, 'Preeti', 'Bhagat', '2001-08-07', 'Female', 'Amravati', 'preetibhagat210@gmail.com', '+919503413915'),
    (2, 'Sangop', 'Kubde', '1996-08-07', 'Male', 'Nagpur', 'sahilbhagat2013@gmail.com', '+917020073580'),
    (3, 'Shekhar', 'Bhagat', '1999-06-26', 'Male', 'Pune', 'shekharbhagat@gmail.com', '+918805123056');

SELECT * FROM Student;


-- Instructors table
CREATE TABLE Instructor(
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Email VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into the Instructors table
INSERT INTO Instructor (InstructorID, FirstName, LastName, DepartmentID, Email)
VALUES
    (1, 'Professor', 'Bhagat', 1, 'shekharbhagat@gmail.com'),
    (2, 'Professor', 'Bhagat', 2, 'sahilbhagat2013@gmail.com'),
    (3, 'Professor', 'Bhagat', 3, 'preetibhagat210@gmail.com');

SELECT * FROM Instructor;

-- Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(20),
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into the Courses table
INSERT INTO Courses (CourseID, CourseCode, CourseName, DepartmentID, Credits)
VALUES
    (101, 'CS101', 'Introduction to Computer Science', 1, 3),
    (102, 'MATH101', 'Calculus I', 2, 4),
    (103, 'HIST101', 'Introduction to History', 3, 3);
	SELECT * FROM Courses;

-- Enrollments table to track student enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert data into the Enrollments table
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (1, 1, 101, '2023-09-01'),
    (2, 1, 102, '2023-09-02'),
    (3, 2, 101, '2023-09-03'),
    (4, 3, 103, '2023-09-04');

SELECT * FROM Enrollments;

-- Assignments table to track course assignments
CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    AssignmentName VARCHAR(100),
    DueDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert data into the Assignments table
INSERT INTO Assignment (AssignmentID, CourseID, AssignmentName, DueDate)
VALUES
    (1, 101, 'Programming Assignment 1', '2023-09-15'),
    (2, 101, 'Programming Assignment 2', '2023-10-01'),
    (3, 102, 'Calculus Quiz 1', '2023-09-20');

SELECT * FROM Assignment;

-- Grades table to record student grades for assignments
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    EnrollmentID INT,
    AssignmentID INT,
    Grade DECIMAL(5, 2)
);

-- Insert data into the Grades table
INSERT INTO Grades (GradeID, EnrollmentID, AssignmentID, Grade)
VALUES
    (1, 1, 1, 90),
    (2, 1, 2, 85),
    (3, 2, 1, 88),
    (4, 2, 2, 92),
    (5, 3, 3, 75);

SELECT * FROM Grades;

-- Drop the tables and the database (clean up)
DROP TABLE Grades;
DROP TABLE Assignment;
DROP TABLE Enrollments;
DROP TABLE Instructor;
DROP TABLE Courses;
DROP TABLE Student;
DROP TABLE Departments;
DROP DATABASE University___6;