CREATE DATABASE SISDB

-- Creation of Students Table

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    date_of_birth DATE,
    email VARCHAR(255),
    phone_number VARCHAR(15)
)

-- Creation of Teachers Table

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(255) UNIQUE
)

-- Creation of Courses Table

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
)

-- Creation of Payments Table

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount MONEY,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
)

-- Creation of Enrollments Table

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)

-- Insertion of Records in Students Table

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Raju', 'Kumar', '2000-05-12', 'raju.kumar@gmail.com', '9876543210'),
(2, 'Palani', 'Vasan', '2003-10-29', 'palani.vasan@gmail.com', '9988776655'),
(3, 'Anbu', 'Raj', '2001-02-14', 'anbu.raj@gmail.com', '9123456789'),
(4, 'Kavi', 'Kumar', '2000-08-30', 'kavi.kumar@gmail.com', '9192837465'),
(5, 'Devi', 'Rani', '2002-01-09', 'devi.rani@gmail.com', '9456723890'),
(6, 'Ravi', 'Kumar', '1998-12-25', 'ravi.kumar@gmail.com', '9234567890'),
(7, 'Samantha', 'Devi', '2000-03-13', 'siti.devi@gmail.com', '9745638201'),
(8, 'Vaibhav', 'Rajesh', '1999-07-20', 'kumar.rajesh@gmail.com', '9654321764'),
(9, 'Sundar', 'Vasu', '2001-04-19', 'sundar.vas@gmail.com', '9876432109'),
(10, 'Priya', 'Sundar', '2001-11-05', 'priya.sundar@gmail.com', '9128365478')

-- Insertion of Records in Teachers Table

INSERT INTO Teachers (teacher_id, first_name, last_name, email) VALUES
(1, 'Ravi', 'Nair', 'ravi.nair@school.com'),
(2, 'Shiva', 'Kumar', 'shiva.kumar@school.com'),
(3, 'Jaya', 'Devi', 'jaya.devi@school.com'),
(4, 'Karthik', 'Raj', 'karthik.raj@school.com'),
(5, 'Latha', 'Rani', 'latha.rani@school.com'),
(6, 'Muthu', 'Vas', 'muthu.vas@school.com'),
(7, 'Sundar', 'Pandi', 'sundar.pandi@school.com'),
(8, 'Priya', 'Ravi', 'priya.ravi@school.com'),
(9, 'Vasuki', 'Ravi', 'vasuki.ravi@school.com'),
(10, 'Malar', 'Priya', 'malar.priya@school.com')

-- Insertion of Records in Courses Table

INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Maths', 3, 1),
(2, 'Physics', 4, 2),
(3, 'Chemistry', 3, 3),
(4, 'Biology', 3, 4),
(5, 'Computer Science', 5, 5),
(6, 'English', 2, 6),
(7, 'History', 3, 7),
(8, 'Geography', 2, 8),
(9, 'Economics', 3, 9),
(10, 'Sociology', 2, 10)

-- Insertion of Records in Enrollments Table

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2025-06-15'),
(2, 2, 2, '2025-06-17'),
(3, 3, 3, '2025-06-18'),
(4, 4, 4, '2025-06-20'),
(5, 5, 5, '2025-06-21'),
(6, 6, 6, '2025-06-22'),
(7, 7, 7, '2025-06-23'),
(8, 8, 8, '2025-06-24'),
(9, 9, 9, '2025-06-25'),
(10, 10, 10, '2025-06-26')

-- Insertion of Records in Payments Table

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 5000.00, '2025-01-10'),
(2, 2, 6000.00, '2025-01-11'),
(3, 3, 5500.00, '2025-01-12'),
(4, 4, 4500.00, '2025-01-13'),
(5, 5, 5000.00, '2025-01-14'),
(6, 6, 6200.00, '2025-01-15'),
(7, 7, 4800.00, '2025-01-16'),
(8, 8, 5300.00, '2025-01-17'),
(9, 9, 5100.00, '2025-01-18'),
(10, 10, 5000.00, '2025-01-19');
