-- 1. Calculate total payments made by a specific student

SELECT s.first_name, s.last_name, SUM(p.amount) AS 'Total payments'
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 1
GROUP BY s.first_name, s.last_name

-- 2. Retrieve a list of courses along with the count of students enrolled

SELECT c.course_name, COUNT(e.student_id) AS 'Enrolled Students'
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name

-- 3. Find students who have not enrolled in any course

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL

-- 4. Retrieve students and the courses they are enrolled in

SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id

-- 5. List teachers and the courses they are assigned to

SELECT t.first_name, t.last_name, c.course_name
FROM Teachers t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id

-- 6. Retrieve students and their enrollment dates for a specific course

SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_id = 1 -- Assuming CourseID = 1

-- 7. Find students who have not made any payments

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL

-- 8. Identify courses that have no enrollments

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL

-- 9. Identify students enrolled in more than one course

SELECT s.first_name, s.last_name, COUNT(e.course_id) AS 'Count'
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1

-- 10. Find teachers who are not assigned to any courses

SELECT t.first_name, t.last_name
FROM Teachers t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.teacher_id IS NULL