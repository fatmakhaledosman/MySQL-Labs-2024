-- 1. Insert new student and his score in exam in different subjects as transaction.

START TRANSACTION;
INSERT INTO Student (Student_ID, Email, Address ,Gender,Birth_Date, First_Name,Last_Name, Track_ID )  
VALUES   
(10, 'ali@example.com', '111 st St', 'Male', '1998-01-05', 'Ali',' Mahmoud', 1);
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)
VALUES 
(1, 10, 60), 
(2, 10, 90),
(3, 10, 55);
commit;


START TRANSACTION;
INSERT INTO Student (Student_ID, Email, Address ,Gender,Birth_Date, First_Name,Last_Name , Track_ID)  
VALUES   
(11, 'assma@example.com', '111 Oak St', 'Female', '1999-01-05', 'Assma',' Ahmed',2); 
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)
VALUES 
(1, 11, 85), 
(2, 11, 90),
(3, 11, 80);
commit;

-- 2. Display the date of exam as the following: day 'month name' year.

SELECT * FROM Exam;
+---------+------------+------------+
| Exam_ID | Exam_Date  | Subject_ID |
+---------+------------+------------+
|       1 | 2022-01-01 |          1 |
|       2 | 2022-01-15 |          2 |
|       3 | 2022-02-01 |          3 |
|       4 | 2022-02-15 |          4 |
|       5 | 2022-03-01 |          5 |
+---------+------------+------------+
5 rows in set (0.00 sec)


SELECT DATE_FORMAT(Exam_Date, '%d %M %Y') AS Exam_Date 
FROM Exam;

+------------------+
| Exam_Date        |
+------------------+
| 01 January 2022  |
| 15 January 2022  |
| 01 February 2022 |
| 15 February 2022 |
| 01 March 2022    |
+------------------+
5 rows in set (0.01 sec)

-- 3. Display name and age of each students

Student Table 
( Student_ID ,Email, Address ,Gender,   
Birth_Date ,First_Name ,Last_Name , Track_ID  )

mysql> SELECT * FROM Student;
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
| Student_ID | Email                  | Address      | Gender | Birth_Date | First_Name | Last_Name | Track_ID |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
|          1 | fatma@example.com      | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |        2 |
|          2 | mohamed@example.com    | 456 Elm St   | Male   | 1995-11-25 | Mohamed    | Awad      |        1 |
|          3 | wassem@example.com     | 789 Oak St   | Male   | 2020-12-05 | Wassem     | Mohamed   |        3 |
|          4 | laila@example.com      | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |        4 |
|          5 | hend@example.com       | 901 Pine St  | Female | 2029-11-12 | Hend       |  Mohamed  |        2 |
|          6 | suliman@example.com    | 111 Oak St   | Male   | 1990-01-12 | Suliman    |  Mohamed  |        2 |
|          7 | m_wassem@example.com   | 1 Oak St     | Male   | 2030-01-05 | Mohamed    |  Wassem   |        1 |
|          9 | mohamedali@example.com | 115 Oakto St | Male   | 1980-02-28 | Mohamed    | Ali       |        1 |
|         10 | ali@example.com        | 111 st St    | Male   | 1998-01-05 | Ali        |  Mahmoud  |        1 |
|         11 | assma@example.com      | 111 Oak St   | Female | 1999-01-05 | Assma      |  Ahmed    |        2 |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
10 rows in set (0.00 sec)

UPDATE Student 
SET 
    Birth_Date = '1992-10-23'
WHERE Student_ID = 5;

UPDATE Student 
SET 
    Birth_Date = '1996-12-23'
WHERE Student_ID = 7;


mysql> SELECT * FROM Student;
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
| Student_ID | Email                  | Address      | Gender | Birth_Date | First_Name | Last_Name | Track_ID |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
|          1 | fatma@example.com      | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |        2 |
|          2 | mohamed@example.com    | 456 Elm St   | Male   | 1995-11-25 | Mohamed    | Awad      |        1 |
|          3 | wassem@example.com     | 789 Oak St   | Male   | 2020-12-05 | Wassem     | Mohamed   |        3 |
|          4 | laila@example.com      | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |        4 |
|          5 | hend@example.com       | 901 Pine St  | Female | 1992-10-23 | Hend       |  Mohamed  |        2 |
|          6 | suliman@example.com    | 111 Oak St   | Male   | 1990-01-12 | Suliman    |  Mohamed  |        2 |
|          7 | m_wassem@example.com   | 1 Oak St     | Male   | 1996-12-23 | Mohamed    |  Wassem   |        1 |
|          9 | mohamedali@example.com | 115 Oakto St | Male   | 1980-02-28 | Mohamed    | Ali       |        1 |
|         10 | ali@example.com        | 111 st St    | Male   | 1998-01-05 | Ali        |  Mahmoud  |        1 |
|         11 | assma@example.com      | 111 Oak St   | Female | 1999-01-05 | Assma      |  Ahmed    |        2 |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
10 rows in set (0.00 sec)

-- Display name and age of each students

SELECT 
    CONCAT(First_Name,' ',Last_Name) AS Display_Name,  
    TIMESTAMPDIFF(YEAR, Birth_Date, CURDATE()) AS Age  
FROM 
    Student;
+------------------+------+
| Display_Name     | Age  |
+------------------+------+
| Fatma khaled     |   32 |
| Mohamed Awad     |   28 |
| Wassem Mohamed   |    3 |
| Laila Mohamed    |    3 |
| Hend  Mohamed    |   31 |
| Suliman  Mohamed |   34 |
| Mohamed  Wassem  |   27 |
| Mohamed Ali      |   44 |
| Ali  Mahmoud     |   26 |
| Assma  Ahmed     |   25 |
+------------------+------+
10 rows in set (0.00 sec)

-- 4. Display the name of students with their Rounded score in each Exam
Student Table 
( Student_ID ,Email, Address ,Gender,Birth_Date ,First_Name ,Last_Name , Track_ID  )
Exam ( Exam_ID , Exam_Date  , Subject_ID) 
Exam_Result ( Exam_ID , Student_ID , Score )

mysql> SELECT * FROM Exam_Result;
+---------+------------+-------+
| Exam_ID | Student_ID | Score |
+---------+------------+-------+
|       1 |          1 |    80 |
|       1 |          2 |    90 |
|       1 |          5 |    40 |
|       1 |          6 |    85 |
|       1 |          7 |    85 |
|       1 |         10 |    60 |
|       1 |         11 |    85 |
|       2 |          1 |    70 |
|       2 |          2 |    20 |
|       2 |          6 |    90 |
|       2 |          7 |    10 |
|       2 |         10 |    90 |
|       2 |         11 |    90 |
|       3 |          1 |   100 |
|       3 |          3 |   100 |
|       3 |          4 |    10 |
|       3 |          6 |    80 |
|       3 |          7 |    20 |
|       3 |         10 |    55 |
|       3 |         11 |    80 |
+---------+------------+-------+
20 rows in set (0.00 sec)



SELECT  
  CONCAT(s.First_Name, '', s.Last_Name) AS Student_Name,  
  e.Exam_Date,  
  ROUND(er.Score) AS Rounded_Score  
FROM  
  Student s  
  JOIN Exam_Result er ON s.Student_ID = er.Student_ID  
  JOIN Exam e ON er.Exam_ID = e.Exam_ID  
ORDER BY  
  s.Student_ID, e.Exam_Date;


+-----------------+------------+---------------+
| Student_Name    | Exam_Date  | Rounded_Score |
+-----------------+------------+---------------+
| Fatmakhaled     | 2022-01-01 |            80 |
| Fatmakhaled     | 2022-01-15 |            70 |
| Fatmakhaled     | 2022-02-01 |           100 |
| MohamedAwad     | 2022-01-01 |            90 |
| MohamedAwad     | 2022-01-15 |            20 |
| WassemMohamed   | 2022-02-01 |           100 |
| LailaMohamed    | 2022-02-01 |            10 |
| Hend Mohamed    | 2022-01-01 |            40 |
| Suliman Mohamed | 2022-01-01 |            85 |
| Suliman Mohamed | 2022-01-15 |            90 |
| Suliman Mohamed | 2022-02-01 |            80 |
| Mohamed Wassem  | 2022-01-01 |            85 |
| Mohamed Wassem  | 2022-01-15 |            10 |
| Mohamed Wassem  | 2022-02-01 |            20 |
| Ali Mahmoud     | 2022-01-01 |            60 |
| Ali Mahmoud     | 2022-01-15 |            90 |
| Ali Mahmoud     | 2022-02-01 |            55 |
| Assma Ahmed     | 2022-01-01 |            85 |
| Assma Ahmed     | 2022-01-15 |            90 |
| Assma Ahmed     | 2022-02-01 |            80 |
+-----------------+------------+---------------+
20 rows in set (0.01 sec)

-- 5. Display the name of students with the year of Birthdate 
mysql> SELECT * FROM Student;
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
| Student_ID | Email                  | Address      | Gender | Birth_Date | First_Name | Last_Name | Track_ID |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
|          1 | fatma@example.com      | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |        2 |
|          2 | mohamed@example.com    | 456 Elm St   | Male   | 1995-11-25 | Mohamed    | Awad      |        1 |
|          3 | wassem@example.com     | 789 Oak St   | Male   | 2020-12-05 | Wassem     | Mohamed   |        3 |
|          4 | laila@example.com      | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |        4 |
|          5 | hend@example.com       | 901 Pine St  | Female | 1992-10-23 | Hend       |  Mohamed  |        2 |
|          6 | suliman@example.com    | 111 Oak St   | Male   | 1990-01-12 | Suliman    |  Mohamed  |        2 |
|          7 | m_wassem@example.com   | 1 Oak St     | Male   | 1996-12-23 | Mohamed    |  Wassem   |        1 |
|          9 | mohamedali@example.com | 115 Oakto St | Male   | 1980-02-28 | Mohamed    | Ali       |        1 |
|         10 | ali@example.com        | 111 st St    | Male   | 1998-01-05 | Ali        |  Mahmoud  |        1 |
|         11 | assma@example.com      | 111 Oak St   | Female | 1999-01-05 | Assma      |  Ahmed    |        2 |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
10 rows in set (0.00 sec)



SELECT 
    CONCAT(First_Name,' ', Last_Name) AS Student_Name,
    YEAR(Birth_Date) AS Birth_Year  
FROM 
    Student;

+------------------+------------+
| Student_Name     | Birth_Year |
+------------------+------------+
| Fatma khaled     |       1992 |
| Mohamed Awad     |       1995 |
| Wassem Mohamed   |       2020 |
| Laila Mohamed    |       2020 |
| Hend  Mohamed    |       1992 |
| Suliman  Mohamed |       1990 |
| Mohamed  Wassem  |       1996 |
| Mohamed Ali      |       1980 |
| Ali  Mahmoud     |       1998 |
| Assma  Ahmed     |       1999 |
+------------------+------------+
10 rows in set (0.00 sec)

-- 6. Add new exam result, in date column use NOW
SELECT * FROM Exam;
+---------+------------+------------+
| Exam_ID | Exam_Date  | Subject_ID |
+---------+------------+------------+
|       1 | 2022-01-01 |          1 |
|       2 | 2022-01-15 |          2 |
|       3 | 2022-02-01 |          3 |
|       4 | 2022-02-15 |          4 |
|       5 | 2022-03-01 |          5 |
+---------+------------+------------+
5 rows in set (0.00 sec)

INSERT INTO Exam (Exam_ID, Exam_Date, Subject_ID) 
VALUES
(6, NOW(), 1);

Query OK, 1 row affected, 1 warning (0.01 sec)

SELECT * FROM Exam;
+---------+------------+------------+
| Exam_ID | Exam_Date  | Subject_ID |
+---------+------------+------------+
|       1 | 2022-01-01 |          1 |
|       2 | 2022-01-15 |          2 |
|       3 | 2022-02-01 |          3 |
|       4 | 2022-02-15 |          4 |
|       5 | 2022-03-01 |          5 |
|       6 | 2024-08-07 |          1 |
+---------+------------+------------+
6 rows in set (0.00 sec)

-- 7. Create Hello world function which take username and return welcome message to user using his name

CREATE FUNCTION hello (username VARCHAR(50)) 
RETURNS VARCHAR(100) 
DETERMINISTIC  
RETURN CONCAT('Hello, ', username, '!'); 

SELECT hello('Wassem Mohamed');
+-------------------------+
| hello('Wassem Mohamed') |
+-------------------------+
| Hello, Wassem Mohamed!  |
+-------------------------+
1 row in set (0.01 sec)

-- 8. Create multiply function which take two number and return the multiply of them
DROP FUNCTION IF EXISTS product;

CREATE FUNCTION product(num1 INT, num2 INT) 
RETURNS VARCHAR(50) 
DETERMINISTIC  
RETURN CONCAT('product= ',num1 * num2,';');


mysql> SELECT product(5 , 2);
+----------------+
| product(5 , 2) |
+----------------+
| product= 10;   |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT product(5 , 5);
+----------------+
| product(5 , 5) |
+----------------+
| product= 25;   |
+----------------+
1 row in set (0.00 sec)

-- 9. Create function which takes student id and Exam id and return score the student in Exam.
Student Table 
( Student_ID ,Email, Address ,Gender,Birth_Date ,First_Name ,Last_Name , Track_ID  )
Exam ( Exam_ID , Exam_Date  , Subject_ID) 
Exam_Result ( Exam_ID , Student_ID , Score )

mysql> SELECT Score FROM Exam_Result WHERE Student_ID = 1 AND Exam_ID = 1;
+-------+
| Score |
+-------+
|    80 |
+-------+
1 row in set (0.00 sec)



DROP FUNCTION IF EXISTS get_student_score;

CREATE FUNCTION get_student_score(p_student_id INT, p_exam_id INT)  
RETURNS INT  
DETERMINISTIC 
RETURN (SELECT Score FROM Exam_Result WHERE Student_ID = p_student_id AND Exam_ID = p_exam_id);

SELECT get_student_score(1, 1) AS score;

+-------+
| score |
+-------+
|    80 |
+-------+
1 row in set (0.00 sec)

mysql> SELECT get_student_score(1, 2) AS score;
+-------+
| score |
+-------+
|    70 |
+-------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Exam_Result;
+---------+------------+-------+
| Exam_ID | Student_ID | Score |
+---------+------------+-------+
|       1 |          1 |    80 |
|       1 |          2 |    90 |
|       1 |          5 |    40 |
|       1 |          6 |    85 |
|       1 |          7 |    85 |
|       1 |         10 |    60 |
|       1 |         11 |    85 |
|       2 |          1 |    70 |
|       2 |          2 |    20 |
|       2 |          6 |    90 |
|       2 |          7 |    10 |
|       2 |         10 |    90 |
|       2 |         11 |    90 |
|       3 |          1 |   100 |
|       3 |          3 |   100 |
|       3 |          4 |    10 |
|       3 |          6 |    80 |
|       3 |          7 |    20 |
|       3 |         10 |    55 |
|       3 |         11 |    80 |
+---------+------------+-------+
20 rows in set (0.00 sec)


-- 10. Create function which takes Exam id and return the number of students 
-- who failed in a Exam (Score less than 50).

mysql> SELECT * FROM Exam_Result;
+---------+------------+-------+
| Exam_ID | Student_ID | Score |
+---------+------------+-------+
|       1 |          1 |    80 |
|       1 |          2 |    90 |
|       1 |          5 |    40 |
|       1 |          6 |    85 |
|       1 |          7 |    85 |
|       1 |         10 |    60 |
|       1 |         11 |    85 |
|       2 |          1 |    70 |
|       2 |          2 |    20 |
|       2 |          6 |    90 |
|       2 |          7 |    10 |
|       2 |         10 |    90 |
|       2 |         11 |    90 |
|       3 |          1 |   100 |
|       3 |          3 |   100 |
|       3 |          4 |    10 |
|       3 |          6 |    80 |
|       3 |          7 |    20 |
|       3 |         10 |    55 |
|       3 |         11 |    80 |
+---------+------------+-------+
20 rows in set (0.00 sec)


SELECT COUNT(*) 
FROM Exam_Result 
WHERE Exam_ID = 1 AND Score < 50; 

+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

SELECT COUNT(*) 
FROM Exam_Result 
WHERE Exam_ID = 2 AND Score < 50; 

+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

SELECT COUNT(*) 
FROM Exam_Result 
WHERE Exam_ID = 3 AND Score < 50; 

+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)
 
DROP FUNCTION IF EXISTS get_failed_students;    

CREATE FUNCTION get_failed_students(exam_id INT)  
RETURNS INT  
DETERMINISTIC  
RETURN (  
  SELECT COUNT(DISTINCT er.Student_ID)  
  FROM Exam_Result er  
  WHERE er.Exam_ID = exam_id AND er.Score < 50  
);


mysql> SELECT get_failed_students(2) AS failed_students;
+-----------------+
| failed_students |
+-----------------+
|               2 |
+-----------------+
1 row in set (0.01 sec)

mysql> 
mysql> SELECT get_failed_students(1) AS failed_students;
+-----------------+
| failed_students |
+-----------------+
|               1 |
+-----------------+
1 row in set (0.01 sec)

mysql> SELECT get_failed_students(3) AS failed_students;
+-----------------+
| failed_students |
+-----------------+
|               2 |
+-----------------+
1 row in set (0.00 sec)



-- 11. Create function which take subject name and return the average of max grades for subject
mysql> SELECT * FROM Subject;
+------------+--------+----------------------------+-----------+----------+
| Subject_ID | Name   | Description                | Max_Score | Track_ID |
+------------+--------+----------------------------+-----------+----------+
|          1 | C      | C                          |       100 |        2 |
|          2 | CPP    | CPP                        |       100 |        1 |
|          3 | HTML   | Hyper Text Markup Language |       300 |        3 |
|          4 | CSS    | Cascading Style Sheet      |       100 |        4 |
|          5 | JS     | JavaScript                 |       200 |        2 |
|          6 | Python | Python Programming         |       300 |        2 |
+------------+--------+----------------------------+-----------+----------+
6 rows in set (0.01 sec)

DROP FUNCTION IF EXISTS GetAverageMaxGradeForSubject ; 

CREATE FUNCTION GetAverageMaxGradeForSubject (p_SubjectName VARCHAR(50)) 
RETURNS DECIMAL(5, 2) 
DETERMINISTIC 
RETURN (SELECT AVG(s.Max_Score) FROM Subject s WHERE s.Name = p_SubjectName);

 SELECT GetAverageMaxGradeForSubject('Python') AS AverageMaxGrade;

mysql> SELECT GetAverageMaxGradeForSubject('Python') AS AverageMaxGrade;
+-----------------+
| AverageMaxGrade |
+-----------------+
|          300.00 |
+-----------------+
1 row in set (0.00 sec)


-- 12. Create Table called Deleted_Students which will hold the deleted students info(same columns as in student tables)


-- 13. Create trigger to save the deleted student from Student table to Deleted_Students.


-- 14. Create trigger to save the newly added students to Student table to Backup_Students.


-- 15. (Bouns) Create trigger to keep track the changes of contact info table


--     (add/update rows); it will logs the time of action and description of action to another table.


-- 16. Dump your database (Grading Database) into SQL file.


-- 17. Dump Students table into file.


-- 18. Import SQL file into your backup database (Grading_Backup Database)