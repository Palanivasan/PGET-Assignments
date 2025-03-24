-- 1. Write an SQL query to calculate the average number of students enrolled in each course. 

SELECT course_id, AVG(Count) AS [Average number of students]
FROM ( SELECT course_id, COUNT(student_id) AS Count
       FROM Enrollments
       GROUP BY course_id ) AS Courses
GROUP BY course_id

-- 2. Identify the student(s) who made the highest payment. 

SELECT p.student_id, s.first_name, s.last_name
FROM Payments p
JOIN Students s
ON p.student_id = s.student_id
WHERE amount IN ( SELECT MAX(amount)
                  FROM Payments )

-- 3. Retrieve a list of courses with the highest number of enrollments.

-- Method 1
SELECT TOP 1 course_id, COUNT(enrollment_id) as Count
FROM Enrollments
GROUP BY course_id
ORDER BY Count DESC

-- Method 2
SELECT TOP 1 course_id, COUNT(enrollment_id) AS Count
FROM Enrollments
GROUP BY course_id
HAVING COUNT(enrollment_id) = (
    SELECT MAX(course_count) 
    FROM (
        SELECT COUNT(enrollment_id) AS course_count
        FROM Enrollments
        GROUP BY course_id
    ) AS CourseCounts
) ORDER BY Count DESC

--  4. Calculate the total payments made to courses taught by each teacher.

SELECT t.teacher_id, 
       ( SELECT SUM(p.amount) 
         FROM Payments p 
         WHERE p.course_id = t.course_id
       ) AS total_payments
FROM Teachers t

-- 5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses. 

SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(*) FROM Courses)

-- 6. Retrieve the names of teachers who have not been assigned to any courses. 

SELECT teacher_id, CONCAT(first_name + SPACE(1), last_name) AS Teacher_Name
FROM Teachers
WHERE teacher_id IN ( SELECT teacher_id
                     FROM Courses
					 WHERE course_id IS NULL ) 

-- 7. Calculate the average age of all students.

SELECT AVG(2025 - Year_part) AS [Average Age of all Students]
FROM ( SELECT YEAR(date_of_birth) AS Year_part
       FROM Students ) AS Year_Column

-- 8. Identify courses with no enrollments.

SELECT c.course_id, c.course_name
FROM Courses c
WHERE c.course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments)

-- 9. Calculate the total payments made by each student for each course they are enrolled in. 

SELECT s.student_id, c.course_id, c.course_name,
    (SELECT SUM(p.amount)
     FROM payments p
     WHERE p.student_id = s.student_id
       AND p.course_id = c.course_id) AS [Total Payment]
FROM students s
JOIN enrollments e 
ON s.student_id = e.student_id
JOIN courses c 
ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_id

-- 10. Identify students who have made more than one payment.

SELECT student_id 
FROM Payments
WHERE 1 NOT IN ( SELECT count(payment_id)
            FROM Payments
            GROUP BY student_id )

SELECT student_id
FROM (
    SELECT student_id, COUNT(payment_id) AS payment_count
    FROM Payments
    GROUP BY student_id
) AS Payment_Summary
WHERE payment_count != 1 OR payment_count IS NULL

-- 11. Write an SQL query to calculate the total payments made by each student. 

SELECT s.student_id, CONCAT(s.first_name + SPACE(1), s.last_name) AS [Student Name], SUM(p.amount) AS [Total Payment]
FROM Payments p
JOIN Students s
ON p.student_id = s.student_id
GROUP BY s.student_id, s.first_name, s.last_name

-- 12. Retrieve a list of course names along with the count of students enrolled in each course.

SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) AS [Enrollment Count]
FROM Enrollments e
JOIN Courses c
ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_name

-- 13.  Calculate the average payment amount made by students.

SELECT p.student_id, AVG(p.amount) AS [Average Amount]
FROM Payments p
JOIN Students s
ON p.student_id = s.student_id
GROUP BY p.student_id