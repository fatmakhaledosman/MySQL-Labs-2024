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


-- 7. Create AddNewStudent function which take Student firstName and lastname
--    and birthdate and TrackName and add this new student info at database


-- 8. Create function which takes StudentId and return the string/text that
--    describe the use info(firstname, last name, TrackName).


-- 9. Create function which takes student id and subject id and return score the
--    student in subject.


-- 10.How to Import SQL file into your database


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

