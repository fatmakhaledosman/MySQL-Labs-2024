-- 1.Install MYSQL DBMS.



-- The scenario is that as an instructor in ITI, you have grade-keeping responsibilities.
-- You want to convert the grading process from a manual operation using a gradebook to an
-- electronic representation using database. In this case:
-- • For each student, you keep track his name, contact info (email, address), 
--   and multiple phone numbers.
-- • Each student study different subjects such as (C, CPP, HTML, …), there some students 
--   study (C,CPP only), and the other students study (HTML,JS only), and so on
-- • For each subject, you need to define the name and the description and max score.
-- • The students achieve score in subject by exam result.
-- • For each exam which taken by student you must store Exam date, score in exam.
-- • Keep track of subjects which will studied by each student

-- 2.Design ERD and write down the mapping schema.

electronic_gradekeeping database

Entities:
---------
1. Student
    - Student_ID (Primary key)
    - Name
    - Email
    - Address

2. Phone 
    - Phone_ID (Primary key)
    - Phone_Number
    - Student_ID (Foreign key referencing Student)

3. Subject 
    - Subject_ID (Primary key)
    - Name
    - Description 
    - Max_Score 

4. Student_Subject  
    - Student_ID (Foreign key referencing Student)
    - Subject_ID (Foreign key referencing Subject)
    - PRIMARY KEY (Student_ID, Subject_ID)

5.Exam 
    - Exam_ID (Primary key)
    - Exam_Date
    - Subject_ID (Foreign key referencing Subject)

6. Exam_Result
    - Exam_ID (Foreign key referencing Exam)
    - Student_ID (Foreign key referencing Student)
    - Score 
    - PRIMARY KEY (Exam_ID, Student_ID)



-- 3.Create your mapped tables with their columns.




-- 4.Insert your classmates data(5 rows for each table).