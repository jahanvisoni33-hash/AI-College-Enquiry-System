-- =========================================================
-- AI Chatbot College Enquiry System
-- Database: college_enquiry
-- University: ACNJ University
-- =========================================================


-- =========================================================
-- 1. UNIVERSITY INFORMATION
-- =========================================================

SELECT *
FROM university_info;


-- =========================================================
-- 2. ALL DEPARTMENTS
-- =========================================================

SELECT department_id,
       department_name,
       description,
       hod_name,
       contact_email
FROM departments;


-- =========================================================
-- 3. ALL COURSES
-- =========================================================

SELECT courses_id,
       department_id,
       course_name,
       course_level,
       duration,
       eligibility,
       description
FROM courses;


-- =========================================================
-- 4. COURSES WITH DEPARTMENT NAME
-- =========================================================

SELECT d.department_name,
       c.course_name,
       c.course_level,
       c.duration,
       c.eligibility,
       c.description
FROM departments d
JOIN courses c
ON d.department_id = c.department_id;


-- =========================================================
-- 5. FIND COURSES BY DEPARTMENT
-- Example: Computer Science
-- =========================================================

SELECT c.course_name,
       c.course_level,
       c.duration,
       c.eligibility,
       c.description
FROM courses c
JOIN departments d
ON c.department_id = d.department_id
WHERE d.department_name = 'Computer Science';


-- =========================================================
-- 6. FIND A PARTICULAR COURSE
-- Example: BCA
-- =========================================================

SELECT *
FROM courses
WHERE course_name = 'BCA';


-- =========================================================
-- 7. COURSE FEES
-- =========================================================

SELECT c.course_name,
       c.course_level,
       f.tuition_fee,
       f.admission_fee,
       f.examination_fee,
       f.other_fee,
       f.academic_year
FROM courses c
JOIN fees f
ON c.courses_id = f.course_id;


-- =========================================================
-- 8. FIND FEES FOR A PARTICULAR COURSE
-- Example: BCA
-- =========================================================

SELECT c.course_name,
       f.tuition_fee,
       f.admission_fee,
       f.examination_fee,
       f.other_fee,
       f.academic_year
FROM courses c
JOIN fees f
ON c.courses_id = f.course_id
WHERE c.course_name = 'BCA';


-- =========================================================
-- 9. ADMISSION INFORMATION
-- =========================================================

SELECT c.course_name,
       a.admission_process,
       a.required_documents,
       a.selection_process,
       a.application_start_date,
       a.application_end_date
FROM courses c
JOIN admissions a
ON c.courses_id = a.course_id;


-- =========================================================
-- 10. ADMISSION INFORMATION FOR A PARTICULAR COURSE
-- Example: BCA
-- =========================================================

SELECT c.course_name,
       a.admission_process,
       a.required_documents,
       a.selection_process,
       a.application_start_date,
       a.application_end_date
FROM courses c
JOIN admissions a
ON c.courses_id = a.course_id
WHERE c.course_name = 'BCA';


-- =========================================================
-- 11. UNIVERSITY FACILITIES
-- =========================================================

SELECT facility_id,
       facility_name,
       description,
       availability,
       location
FROM facilities;


-- =========================================================
-- 12. FREQUENTLY ASKED QUESTIONS
-- =========================================================

SELECT faq_id,
       question,
       answer,
       category
FROM faqs;


-- =========================================================
-- 13. SEARCH FAQ
-- Example: admission-related questions
-- =========================================================

SELECT question,
       answer,
       category
FROM faqs
WHERE question LIKE '%admission%'
   OR answer LIKE '%admission%';


-- =========================================================
-- 14. CHAT HISTORY
-- =========================================================

SELECT chat_id,
       session_id,
       question,
       answer,
       timestamp
FROM chat_history
ORDER BY timestamp DESC;


-- =========================================================
-- 15. FEEDBACK
-- =========================================================

SELECT feedback_id,
       chat_id,
       rating,
       comment,
       submitted_at
FROM feedback
ORDER BY submitted_at DESC;


-- =========================================================
-- 16. AVERAGE CHATBOT RATING
-- =========================================================

SELECT AVG(rating) AS average_rating
FROM feedback;


-- =========================================================
-- 17. NUMBER OF COURSES IN EACH DEPARTMENT
-- =========================================================

SELECT d.department_name,
       COUNT(c.courses_id) AS total_courses
FROM departments d
LEFT JOIN courses c
ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name;


-- =========================================================
-- 18. SEARCH COURSES BY KEYWORD
-- Example: search for Computer
-- =========================================================

SELECT course_name,
       course_level,
       duration,
       eligibility,
       description
FROM courses
WHERE course_name LIKE '%Computer%'
   OR description LIKE '%Computer%'
   OR eligibility LIKE '%Computer%';


-- =========================================================
-- 19. SEARCH FACILITIES
-- Example: library
-- =========================================================

SELECT facility_name,
       description,
       availability,
       location
FROM facilities
WHERE facility_name LIKE '%library%'
   OR description LIKE '%library%'
   OR location LIKE '%library%';


-- =========================================================
-- 20. SEARCH FAQ BY KEYWORD
-- =========================================================

SELECT question,
       answer,
       category
FROM faqs
WHERE question LIKE '%fee%'
   OR answer LIKE '%fee%'
   OR category LIKE '%fee%';
