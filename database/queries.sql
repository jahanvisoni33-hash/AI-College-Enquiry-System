-- =========================================================
-- AI CHATBOT COLLEGE ENQUIRY SYSTEM
-- Database: college_enquiry
-- University: ACNJ University
-- File: queries.sql
-- =========================================================


-- =========================================================
-- 1. UNIVERSITY INFORMATION
-- =========================================================

SELECT *
FROM university_info;


-- =========================================================
-- 2. ALL DEPARTMENTS
-- =========================================================

SELECT
    department_id,
    department_name,
    description,
    hod_name,
    contact_email
FROM departments;


-- =========================================================
-- 3. ALL COURSES
-- =========================================================

SELECT
    course_id,
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

SELECT
    d.department_name,
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
-- Example: Computer Science and Information Technology
-- =========================================================

SELECT
    c.course_name,
    c.course_level,
    c.duration,
    c.eligibility,
    c.description
FROM courses c
JOIN departments d
    ON c.department_id = d.department_id
WHERE d.department_name = 'Computer Science and Information Technology';


-- =========================================================
-- 6. FIND A PARTICULAR COURSE
-- Example: BCA
-- =========================================================

SELECT
    course_id,
    course_name,
    course_level,
    duration,
    eligibility,
    description
FROM courses
WHERE course_name LIKE '%BCA%';


-- =========================================================
-- 7. ALL COURSE FEES
-- =========================================================

SELECT
    c.course_name,
    c.course_level,
    f.tuition_fee,
    f.admission_fee,
    f.examination_fee,
    f.other_fee,
    f.academic_year
FROM courses c
JOIN fees f
    ON c.course_id = f.course_id;


-- =========================================================
-- 8. FEES FOR A PARTICULAR COURSE
-- Example: BCA
-- =========================================================

SELECT
    c.course_name,
    f.tuition_fee,
    f.admission_fee,
    f.examination_fee,
    f.other_fee,
    f.academic_year
FROM courses c
JOIN fees f
    ON c.course_id = f.course_id
WHERE c.course_name LIKE '%BCA%';


-- =========================================================
-- 9. ALL ADMISSION INFORMATION
-- =========================================================

SELECT
    c.course_name,
    a.admission_process,
    a.required_documents,
    a.selection_process,
    a.application_start_date,
    a.application_end_date
FROM courses c
JOIN admissions a
    ON c.course_id = a.course_id;


-- =========================================================
-- 10. ADMISSION INFORMATION FOR A PARTICULAR COURSE
-- Example: BCA
-- =========================================================

SELECT
    c.course_name,
    a.admission_process,
    a.required_documents,
    a.selection_process,
    a.application_start_date,
    a.application_end_date
FROM courses c
JOIN admissions a
    ON c.course_id = a.course_id
WHERE c.course_name LIKE '%BCA%';


-- =========================================================
-- 11. ALL UNIVERSITY FACILITIES
-- =========================================================

SELECT
    facility_id,
    facility_name,
    description,
    availability,
    location
FROM facilities;


-- =========================================================
-- 12. SEARCH FOR A PARTICULAR FACILITY
-- Example: Library
-- =========================================================

SELECT
    facility_name,
    description,
    availability,
    location
FROM facilities
WHERE facility_name LIKE '%Library%';


-- =========================================================
-- 13. ALL FAQs
-- =========================================================

SELECT
    faq_id,
    question,
    answer,
    category
FROM faqs;


-- =========================================================
-- 14. SEARCH FAQ BY KEYWORD
-- Example: Admission
-- =========================================================

SELECT
    faq_id,
    question,
    answer,
    category
FROM faqs
WHERE question LIKE '%admission%'
   OR answer LIKE '%admission%'
   OR category LIKE '%admission%';


-- =========================================================
-- 15. SEARCH FAQ ABOUT FEES
-- =========================================================

SELECT
    faq_id,
    question,
    answer,
    category
FROM faqs
WHERE question LIKE '%fee%'
   OR answer LIKE '%fee%'
   OR category LIKE '%fee%';


-- =========================================================
-- 16. CHAT HISTORY
-- =========================================================

SELECT
    chat_id,
    session_id,
    question,
    answer,
    timestamp
FROM chat_history
ORDER BY timestamp DESC;


-- =========================================================
-- 17. CHAT HISTORY FOR A PARTICULAR SESSION
-- Example: SESSION001
-- =========================================================

SELECT
    chat_id,
    session_id,
    question,
    answer,
    timestamp
FROM chat_history
WHERE session_id = 'SESSION001'
ORDER BY timestamp;


-- =========================================================
-- 18. FEEDBACK
-- =========================================================

SELECT
    feedback_id,
    chat_id,
    rating,
    comment,
    submitted_at
FROM feedback
ORDER BY submitted_at DESC;


-- =========================================================
-- 19. FEEDBACK WITH CHAT DETAILS
-- =========================================================

SELECT
    f.feedback_id,
    c.question,
    c.answer,
    f.rating,
    f.comment,
    f.submitted_at
FROM feedback f
JOIN chat_history c
    ON f.chat_id = c.chat_id;


-- =========================================================
-- 20. NUMBER OF COURSES IN EACH DEPARTMENT
-- =========================================================

SELECT
    d.department_name,
    COUNT(c.course_id) AS total_courses
FROM departments d
LEFT JOIN courses c
    ON d.department_id = c.department_id
GROUP BY
    d.department_id,
    d.department_name;


-- =========================================================
-- 21. SEARCH COURSES BY KEYWORD
-- Example: Computer
-- =========================================================

SELECT
    course_id,
    course_name,
    course_level,
    duration,
    eligibility,
    description
FROM courses
WHERE course_name LIKE '%Computer%'
   OR description LIKE '%Computer%'
   OR eligibility LIKE '%Computer%';


-- =========================================================
-- 22. SEARCH COURSES BY COURSE LEVEL
-- Example: Undergraduate
-- =========================================================

SELECT
    course_id,
    course_name,
    course_level,
    duration,
    eligibility
FROM courses
WHERE course_level = 'Undergraduate';


-- =========================================================
-- 23. FIND COURSES WITH THEIR FEES AND DEPARTMENT
-- =========================================================

SELECT
    d.department_name,
    c.course_name,
    c.course_level,
    c.duration,
    f.tuition_fee,
    f.admission_fee,
    f.examination_fee,
    f.other_fee,
    f.academic_year
FROM departments d
JOIN courses c
    ON d.department_id = c.department_id
JOIN fees f
    ON c.course_id = f.course_id;


-- =========================================================
-- 24. FIND COURSES WITH ADMISSION DETAILS
-- =========================================================

SELECT
    c.course_name,
    c.eligibility,
    a.admission_process,
    a.required_documents,
    a.selection_process,
    a.application_start_date,
    a.application_end_date
FROM courses c
JOIN admissions a
    ON c.course_id = a.course_id;


-- =========================================================
-- 25. FIND COMPLETE INFORMATION ABOUT A COURSE
-- Example: BCA
-- =========================================================

SELECT
    d.department_name,
    c.course_name,
    c.course_level,
    c.duration,
    c.eligibility,
    c.description,
    f.tuition_fee,
    f.admission_fee,
    f.examination_fee,
    f.other_fee,
    f.academic_year,
    a.admission_process,
    a.required_documents,
    a.selection_process,
    a.application_start_date,
    a.application_end_date
FROM courses c
JOIN departments d
    ON c.department_id = d.department_id
LEFT JOIN fees f
    ON c.course_id = f.course_id
LEFT JOIN admissions a
    ON c.course_id = a.course_id
WHERE c.course_name LIKE '%BCA%';


-- =========================================================
-- END OF QUERIES
-- =========================================================
