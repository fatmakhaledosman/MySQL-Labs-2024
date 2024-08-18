-- 1. Display the date of exam as the following: day 'month name' year.
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

-- 2. Display the name of students with the year of Birthdate
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

-- 3. Add new exam result, in date column use NOW
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

-- 4. Create Hello world function which take username and return welcome
--    message to user using his name
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

-- 5. Create multiply function which take two number and return the multiply of them
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

-- 6. Create function which takes number and return if this number is odd or even.
DROP FUNCTION IF EXISTS is_even;


CREATE FUNCTION is_even(n INT) 
RETURNS VARCHAR(5) 
DETERMINISTIC  
RETURN IF(MOD(N,2) = 0, 'even' , 'odd');


mysql> SELECT is_even(10);
+-------------+
| is_even(10) |
+-------------+
| even        |
+-------------+
1 row in set (0.01 sec)

mysql> SELECT is_even(11);
+-------------+
| is_even(11) |
+-------------+
| odd         |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT is_even(25);
+-------------+
| is_even(25) |
+-------------+
| odd         |
+-------------+
1 row in set (0.01 sec)


-- 7. Create AddNewStudent function which take Student firstName and lastname and birthdate and TrackName and add this new student info at database

1.Student Table 
(Student_ID ,Email, Address ,Gender,Birth_Date ,First_Name ,Last_Name , Track_ID  )
2.Phone (Phone_ID ,Phone_Number, Student_ID )
3.Subject (Subject_ID ,Name, Description ,Max_Score ,Track_ID)
4. Student_Subject (Student_ID ,Subject_ID )
5.Track (Track_ID, Track_Name)
6.Exam ( Exam_ID , Exam_Date  , Subject_ID) 
7.Exam_Result ( Exam_ID , Student_ID , Score )

DROP FUNCTION IF EXISTS AddNewStudent;

-- DELIMITER //  
-- CREATE FUNCTION AddNewStudent(  
--   firstName VARCHAR(50),  
--   lastName VARCHAR(50),  
--   birthDate DATE,  
--   trackName VARCHAR(50)  
-- ) RETURNS INT DETERMINISTIC  
-- BEGIN  
--   DECLARE trackID INT;  
--   DECLARE newStudentID INT;  
--   SELECT Track_ID INTO trackID  
--   FROM Track  
--   WHERE Track_Name = trackName;  
--   INSERT INTO Student (Email, Address, Gender, Birth_Date, First_Name, Last_Name, Track_ID)  
--   VALUES (NULL, NULL, NULL, birthDate, firstName, lastName, trackID);  
--   SET newStudentID = LAST_INSERT_ID();  
--   INSERT INTO Phone (Phone_Number, Student_ID)  
--   VALUES ('000-000-0000', newStudentID);  
--   RETURN newStudentID;  
-- END//


DELIMITER //  
CREATE FUNCTION Add_NewStudent(  
  studentID INT,  
  firstName VARCHAR(50),  
  lastName VARCHAR(50),  
  birthDate DATE,  
  trackName VARCHAR(50)  
) RETURNS INT DETERMINISTIC  
BEGIN  
  DECLARE trackID INT;  
  SELECT Track_ID INTO trackID  
  FROM Track  
  WHERE Track_Name = trackName;  
  INSERT INTO Student (Student_ID, Email, Address, Gender, Birth_Date, First_Name, Last_Name, Track_ID)  
  VALUES (studentID, NULL, NULL, NULL, birthDate, firstName, lastName, trackID);  
  INSERT INTO Phone (Phone_ID,Phone_Number, Student_ID)  
  VALUES (15,'000-000-0000', studentID);  
  RETURN studentID;  
END//


SELECT Add_NewStudent(15, 'Ali', 'Mahmoud', '1990-01-01', 'Open Source Application') 
AS new_student_id;


mysql> SELECT Add_NewStudent(15, 'Ali', 'Mahmoud', '1990-01-01', 'Open Source Application') 
    -> AS new_student_id;
    -> //
+----------------+
| new_student_id |
+----------------+
|             15 |
+----------------+
1 row in set (0.02 sec)

mysql> SELECT * FROM Student;
    -> //
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
|         12 | walaa@example.com      | 111 st St    | Female | 1990-01-05 | Walaa      |  Mahmoud  |        1 |
|         15 | NULL                   | NULL         | NULL   | 1990-01-01 | Ali        | Mahmoud   |        1 |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
12 rows in set (0.00 sec)

mysql> SELECT * FROM Phone;
    -> //
+----------+--------------+------------+
| Phone_ID | Phone_Number | Student_ID |
+----------+--------------+------------+
|        1 | 123-456-7890 |          1 |
|        2 | 987-654-3210 |          2 |
|        3 | 555-123-4567 |          3 |
|        4 | 555-901-2345 |          4 |
|        5 | 555-111-2222 |          5 |
|        6 | 555-123-4567 |          6 |
|        7 | 777-123-4567 |          7 |
|       15 | 000-000-0000 |         15 |
+----------+--------------+------------+
8 rows in set (0.00 sec)

-- 8. Create function which takes StudentId and return the string/text that
--    describe the use info(firstname, last name, TrackName).

DROP FUNCTION IF EXISTS get_student_info;

CREATE FUNCTION GetStudentInfo(p_StudentId INT)  
RETURNS VARCHAR(255)  
DETERMINISTIC
RETURN (  
   SELECT CONCAT_WS(' ', s.First_Name, s.Last_Name, t.Track_Name)  
   FROM Student s  
   JOIN Track t ON s.Track_ID = t.Track_ID  
   WHERE s.Student_ID = p_StudentId  
   );

SELECT GetStudentInfo(1) AS Student_Info; 
SELECT GetStudentInfo(2) AS Student_Info; 
SELECT GetStudentInfo(3) AS Student_Info;


mysql> SELECT GetStudentInfo(1) AS Student_Info; 
+-----------------------------------------+
| Student_Info                            |
+-----------------------------------------+
| Fatma khaled Cloud Platform Development |
+-----------------------------------------+
1 row in set (0.02 sec)

mysql> SELECT GetStudentInfo(2) AS Student_Info;
+--------------------------------------+
| Student_Info                         |
+--------------------------------------+
| Mohamed Awad Open Source Application |
+--------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT GetStudentInfo(3) AS Student_Info;
+----------------------------------------+
| Student_Info                           |
+----------------------------------------+
| Wassem Mohamed Artificial intelligence |
+----------------------------------------+
1 row in set (0.00 sec)




-- 9. Create function which takes student id and subject id and return score the student in subject.
1.Student Table 
(Student_ID ,Email, Address ,Gender,Birth_Date ,First_Name ,Last_Name , Track_ID  )
2.Phone (Phone_ID ,Phone_Number, Student_ID )
3.Subject (Subject_ID ,Name, Description ,Max_Score ,Track_ID)
4. Student_Subject (Student_ID ,Subject_ID )
5.Track (Track_ID, Track_Name)
6.Exam ( Exam_ID , Exam_Date  , Subject_ID) 
7.Exam_Result ( Exam_ID , Student_ID , Score )

DROP FUNCTION IF EXISTS get_student_score;

DELIMITER //  
CREATE FUNCTION get_student_score(p_student_id INT, p_subject_id INT)  
RETURNS DECIMAL(5,2)  
DETERMINISTIC  
BEGIN  
    DECLARE score DECIMAL(5,2);  
    SELECT er.Score  INTO score  
    FROM Exam_Result er  
    INNER JOIN Exam e ON er.Exam_ID = e.Exam_ID  
    WHERE er.Student_ID = p_student_id 
    AND e.Subject_ID = p_subject_id;  
    RETURN score;  
END//  
DELIMITER ;

mysql> DELIMITER ;
mysql> SELECT get_student_score(1, 2) AS score;
+-------+
| score |
+-------+
| 70.00 |
+-------+
1 row in set (0.00 sec)

mysql> SELECT get_student_score(1, 1) AS score;
+-------+
| score |
+-------+
| 80.00 |
+-------+
1 row in set (0.00 sec)

SELECT get_student_score(1, 1) AS score;

-- 10.How to Import SQL file into your database

mysql> CREATE DATABASE ITI;
Query OK, 1 row affected (0.01 sec)

mysql> USE ITI;
Database changed

mysql> SOURCE /home/fatma/dump.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


mysql> SHOW TABLES;
+-----------------------------------+
| Tables_in_electronic_gradekeeping |
+-----------------------------------+
| Backup_Students                   |
| Deleted_Students                  |
| Exam                              |
| Exam_Result                       |
| Phone                             |
| Student                           |
| StudentNames_subjects             |
| StudentNames_subjects2            |
| Student_Subject                   |
| Subject                           |
| Track                             |
| student_scores                    |
| student_tracks                    |
| subject_max_scores                |
| track_subjects                    |
+-----------------------------------+
15 rows in set (0.00 sec)

-- 11.Create Table called Archive_Students which will hold the deleted students
--    info(same columns as in student tables)
mysql> DESCRIBE Student;
+------------+-----------------------+------+-----+---------+-------+
| Field      | Type                  | Null | Key | Default | Extra |
+------------+-----------------------+------+-----+---------+-------+
| Student_ID | int                   | NO   | PRI | NULL    |       |
| Email      | varchar(100)          | YES  |     | NULL    |       |
| Address    | varchar(200)          | YES  |     | NULL    |       |
| Gender     | enum('Male','Female') | YES  |     | NULL    |       |
| Birth_Date | date                  | YES  |     | NULL    |       |
| First_Name | varchar(50)           | YES  |     | NULL    |       |
| Last_Name  | varchar(50)           | YES  |     | NULL    |       |
| Track_ID   | int                   | YES  | MUL | NULL    |       |
+------------+-----------------------+------+-----+---------+-------+
8 rows in set (0.02 sec)

CREATE TABLE Deleted_Students 
( Student_ID int, 
  Email varchar(100), 
  Address varchar(200), 
  Gender enum('Male', 'Female'),
  Birth_Date date, 
  First_Name varchar(50), 
  Last_Name varchar(50),
  Track_ID int ,
  FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID) ON DELETE CASCADE 
); 

mysql> DESCRIBE Deleted_Students;
+------------+-----------------------+------+-----+---------+-------+
| Field      | Type                  | Null | Key | Default | Extra |
+------------+-----------------------+------+-----+---------+-------+
| Student_ID | int                   | YES  |     | NULL    |       |
| Email      | varchar(100)          | YES  |     | NULL    |       |
| Address    | varchar(200)          | YES  |     | NULL    |       |
| Gender     | enum('Male','Female') | YES  |     | NULL    |       |
| Birth_Date | date                  | YES  |     | NULL    |       |
| First_Name | varchar(50)           | YES  |     | NULL    |       |
| Last_Name  | varchar(50)           | YES  |     | NULL    |       |
| Track_ID   | int                   | YES  | MUL | NULL    |       |
+------------+-----------------------+------+-----+---------+-------+
8 rows in set (0.00 sec)


-- 12.Create trigger to save the deleted student from Student table to Deleted_Students.

CREATE TRIGGER trg_SaveDeletedStudent  
AFTER DELETE ON Student  
FOR EACH ROW  
INSERT INTO Deleted_Students (Student_ID, Email, Address, Gender, Birth_Date, First_Name, Last_Name, Track_ID)  
VALUES (OLD.Student_ID, OLD.Email, OLD.Address, OLD.Gender, OLD.Birth_Date, OLD.First_Name, OLD.Last_Name, OLD.Track_ID);

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
10 rows in set (0.01 sec)

mysql> SELECT * FROM Deleted_Students;
Empty set (0.00 sec)


DELETE FROM Student WHERE Student_ID = 11;

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
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
9 rows in set (0.00 sec)

mysql> SELECT * FROM Deleted_Students;
+------------+-------------------+------------+--------+------------+------------+-----------+----------+
| Student_ID | Email             | Address    | Gender | Birth_Date | First_Name | Last_Name | Track_ID |
+------------+-------------------+------------+--------+------------+------------+-----------+----------+
|         11 | assma@example.com | 111 Oak St | Female | 1999-01-05 | Assma      |  Ahmed    |        2 |
+------------+-------------------+------------+--------+------------+------------+-----------+----------+
1 row in set (0.00 sec)

-- 13.Create trigger to save the newly added students to Student table to
--    Backup_Students.
CREATE TABLE Backup_Students LIKE Student;

mysql> SELECT * FROM Backup_Students;
Empty set (0.01 sec)

mysql> DESCRIBE Backup_Students;
+------------+-----------------------+------+-----+---------+-------+
| Field      | Type                  | Null | Key | Default | Extra |
+------------+-----------------------+------+-----+---------+-------+
| Student_ID | int                   | NO   | PRI | NULL    |       |
| Email      | varchar(100)          | YES  |     | NULL    |       |
| Address    | varchar(200)          | YES  |     | NULL    |       |
| Gender     | enum('Male','Female') | YES  |     | NULL    |       |
| Birth_Date | date                  | YES  |     | NULL    |       |
| First_Name | varchar(50)           | YES  |     | NULL    |       |
| Last_Name  | varchar(50)           | YES  |     | NULL    |       |
| Track_ID   | int                   | YES  | MUL | NULL    |       |
+------------+-----------------------+------+-----+---------+-------+
8 rows in set (0.01 sec)


-- or

-- CREATE TABLE Backup_Students ( 
--   Student_ID int, 
--   Email varchar(100), 
--   Address varchar(200), 
--   Gender enum('Male', 'Female'),
--   Birth_Date date, 
--   First_Name varchar(50), 
--   Last_Name varchar(50),
--   Track_ID int ,
--   FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID) ON DELETE CASCADE 
-- ); 

CREATE TRIGGER trg_Backup_New_Students 
AFTER INSERT ON Student 
FOR EACH ROW 
INSERT INTO Backup_Students (Student_ID, Email, Address, Gender, Birth_Date, First_Name, Last_Name , Track_ID)
VALUES (NEW.Student_ID, NEW.Email, NEW.Address, NEW.Gender, NEW.Birth_Date, NEW.First_Name, NEW.Last_Name, NEW.Track_ID);

SELECT * FROM Backup_Students;

INSERT INTO Student (Student_ID, Email, Address ,Gender,Birth_Date, First_Name,Last_Name, Track_ID )  
VALUES   
(12, 'walaa@example.com', '111 st St', 'Female', '1990-01-05', 'Walaa',' Mahmoud', 1);

SELECT * FROM Backup_Students;

+------------+-------------------+-----------+--------+------------+------------+-----------+----------+
| Student_ID | Email             | Address   | Gender | Birth_Date | First_Name | Last_Name | Track_ID |
+------------+-------------------+-----------+--------+------------+------------+-----------+----------+
|         12 | walaa@example.com | 111 st St | Female | 1990-01-05 | Walaa      |  Mahmoud  |        1 |
+------------+-------------------+-----------+--------+------------+------------+-----------+----------+
1 row in set (0.00 sec)


SELECT * FROM Student;

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
|         12 | walaa@example.com      | 111 st St    | Female | 1990-01-05 | Walaa      |  Mahmoud  |        1 |
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
11 rows in set (0.01 sec)

-- 14.Create trigger to keep track the changes of Tracks table (update rows); it will
--    logs the time of action and description of action to another Logs table.


-- 1.Student Table 
-- (Student_ID ,Email, Address ,Gender,Birth_Date ,First_Name ,Last_Name , Track_ID  )
-- 2.Phone (Phone_ID ,Phone_Number, Student_ID )
-- 3.Subject (Subject_ID ,Name, Description ,Max_Score ,Track_ID)
-- 4. Student_Subject (Student_ID ,Subject_ID )
-- 5.Track (Track_ID, Track_Name)
-- 6.Exam ( Exam_ID , Exam_Date  , Subject_ID) 
-- 7.Exam_Result ( Exam_ID , Student_ID , Score )

CREATE TABLE Logs (  
  Log_ID INT AUTO_INCREMENT,  
  Track_ID INT,  
  Action_Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
  Action_Description VARCHAR(255),  
  PRIMARY KEY (Log_ID),  
  FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID)  ON DELETE CASCADE
);  
  
DELIMITER //  
  
CREATE TRIGGER trg_track_update  
AFTER UPDATE ON Track 
FOR EACH ROW  
BEGIN  
  INSERT INTO Logs (Track_ID, Action_Description)  
  VALUES (NEW.Track_ID, CONCAT('Updated Track ', NEW.Track_Name, 'n ', NOW()));  
END//  
DELIMITER ;


mysql> SELECT * FROM Track;
+----------+-------------------------------------+
| Track_ID | Track_Name                          |
+----------+-------------------------------------+
|        1 | Open Source Application             |
|        2 | Cloud Platform Development          |
|        3 | Artificial intelligence             |
|        4 | Full Stack Development Using Python |
+----------+-------------------------------------+
4 rows in set (0.01 sec)

mysql> INSERT INTO Track (Track_ID , Track_Name ) VALUES (5,'IOT');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Track;
+----------+-------------------------------------+
| Track_ID | Track_Name                          |
+----------+-------------------------------------+
|        1 | Open Source Application             |
|        2 | Cloud Platform Development          |
|        3 | Artificial intelligence             |
|        4 | Full Stack Development Using Python |
|        5 | IOT                                 |
+----------+-------------------------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Logs;
Empty set (0.01 sec)


mysql> UPDATE  Track SET Track_Name='OS IOT' WHERE  Track_ID = 5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> SELECT * FROM Track;
+----------+-------------------------------------+
| Track_ID | Track_Name                          |
+----------+-------------------------------------+
|        1 | Open Source Application             |
|        2 | Cloud Platform Development          |
|        3 | Artificial intelligence             |
|        4 | Full Stack Development Using Python |
|        5 | OS IOT                              |
+----------+-------------------------------------+
5 rows in set (0.00 sec)


mysql> SELECT * FROM Logs;
+--------+----------+---------------------+-------------------------------------------+
| Log_ID | Track_ID | Action_Timestamp    | Action_Description                        |
+--------+----------+---------------------+-------------------------------------------+
|      1 |        5 | 2024-08-18 13:59:59 | Updated Track OS IOTn 2024-08-18 13:59:59 |
+--------+----------+---------------------+-------------------------------------------+
1 row in set (0.00 sec)




