-- 1. Insert a new student into the Students table

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (11, 'Vijay', 'Raghavan', '2000-08-18', 'VR@example.com', '9886757528')

-- 2. Enroll a student in a course

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (11, 11, 1, GETDATE())

-- 3. Update the email address of a specific teacher

UPDATE Teachers
SET email = 'teacher_here@school.com'
WHERE teacher_id = 5

-- 4. Delete a specific enrollment record

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 1

-- 5. Assign a specific teacher to a course

UPDATE Courses
SET teacher_id = 5 
WHERE course_id = 1

-- 6. Delete a specific student and their enrollment records

DELETE FROM Payments
WHERE student_id = 1

DELETE FROM Enrollments
WHERE student_id = 1

DELETE FROM Students
WHERE student_id = 1

-- 7. Update the payment amount for a specific payment record

UPDATE Payments
SET amount = 5000.00 
WHERE payment_id = 1
