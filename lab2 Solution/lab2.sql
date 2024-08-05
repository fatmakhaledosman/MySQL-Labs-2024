-- 1. Add gender column for the student table. It holds two value (male or female).
      ALTER TABLE Student ADD COLUMN Gender ENUM('Male', 'Female');
-- 2. Add birth date column for the student table.
      ALTER TABLE Student ADD COLUMN Birth_Date DATE;
-- 3. Delete the name column and replace it with two columns first name and last name.
      ALTER TABLE Student DROP COLUMN Name; 
      ALTER TABLE Student ADD COLUMN First_Name VARCHAR(50); 
      ALTER TABLE Student ADD COLUMN Last_Name VARCHAR(50); 


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
+------------+-----------------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> SELECT * FROM Student;
+------------+---------------------+--------------+--------+------------+------------+-----------+
| Student_ID | Email               | Address      | Gender | Birth_Date | First_Name | Last_Name |
+------------+---------------------+--------------+--------+------------+------------+-----------+
|          1 | fatma@example.com   | 123 Main St  | NULL   | NULL       | NULL       | NULL      |
|          2 | mohamed@example.com | 456 Elm St   | NULL   | NULL       | NULL       | NULL      |
|          3 | wassem@example.com  | 789 Oak St   | NULL   | NULL       | NULL       | NULL      |
|          4 | laila@example.com   | 321 Maple St | NULL   | NULL       | NULL       | NULL      |
|          5 | hend@example.com    | 901 Pine St  | NULL   | NULL       | NULL       | NULL      |
+------------+---------------------+--------------+--------+------------+------------+-----------+
5 rows in set (0.00 sec)

-- 4. Add foreign key constrains in Your Tables with options on delete cascaded.

-- Note that if you want to modify an existing foreign key constraint,
-- you would need to drop the existing constraint first and then recreate it with the desired changes. but I found Error so .
-- I dropped tables. then Recreate them again .

DROP TABLE Phone;
DROP TABLE Exam_Result;
DROP TABLE Exam;
DROP TABLE Student_Subject;

SHOW TABLES;
+-----------------------------------+
| Tables_in_electronic_gradekeeping |
+-----------------------------------+
| Student                           |
| Subject                           |
+-----------------------------------+
2 rows in set (0.00 sec)


CREATE TABLE Phone (  
  Phone_ID INT PRIMARY KEY,  
  Phone_Number VARCHAR(20),  
  Student_ID INT,  
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE  
);  
  

CREATE TABLE Exam (  
  Exam_ID INT PRIMARY KEY,  
  Exam_Date DATE,  
  Subject_ID INT,  
  FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID) ON DELETE CASCADE 
);  

CREATE TABLE Student_Subject (  
  Student_ID INT,  
  Subject_ID INT,  
  PRIMARY KEY (Student_ID, Subject_ID),  
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,  
  FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID) ON DELETE CASCADE  
); 

CREATE TABLE Exam_Result (  
  Exam_ID INT,  
  Student_ID INT,  
  Score INT,  
  PRIMARY KEY (Exam_ID, Student_ID),  
  FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID) ON DELETE CASCADE,  
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE  
); 


INSERT INTO Phone (Phone_ID, Phone_Number, Student_ID)  
VALUES  
(1, '123-456-7890', 1),  
(2, '987-654-3210', 2),  
(3, '555-123-4567', 3),  
(4, '555-901-2345', 4),  
(5, '555-111-2222', 5);  

INSERT INTO Exam (Exam_ID, Exam_Date, Subject_ID)  
VALUES  
(1, '2022-01-01', 1),  
(2, '2022-01-15', 2),  
(3, '2022-02-01', 3),  
(4, '2022-02-15', 4),  
(5, '2022-03-01', 5);  


INSERT INTO Student_Subject (Student_ID, Subject_ID)  
VALUES  
(1, 1),  
(1, 2), 
(1, 3), 
(2, 1),  
(2, 2),  
(3, 3),
(3, 5),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 5);  


 
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)  
VALUES  
(1, 1, 80),        
(1, 2, 90),  
(1, 5, 40), 
(2, 1, 70),  
(2, 2, 20),
(3, 1, 100),
(3, 3, 100),
(3, 4, 10);  

-- to verify it is working you can delete student  with Student_ID = 5
DELETE FROM Student WHERE Student_ID=5;

-- data for Student that has a Student_ID =5 had been deleted from al tables 

mysql> SELECT * FROM Student;
+------------+---------------------+--------------+--------+------------+------------+-----------+
| Student_ID | Email               | Address      | Gender | Birth_Date | First_Name | Last_Name |
+------------+---------------------+--------------+--------+------------+------------+-----------+
|          1 | fatma@example.com   | 123 Main St  | NULL   | NULL       | NULL       | NULL      |
|          2 | mohamed@example.com | 456 Elm St   | NULL   | NULL       | NULL       | NULL      |
|          3 | wassem@example.com  | 789 Oak St   | NULL   | NULL       | NULL       | NULL      |
|          4 | laila@example.com   | 321 Maple St | NULL   | NULL       | NULL       | NULL      |
+------------+---------------------+--------------+--------+------------+------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Phone;
+----------+--------------+------------+
| Phone_ID | Phone_Number | Student_ID |
+----------+--------------+------------+
|        1 | 123-456-7890 |          1 |
|        2 | 987-654-3210 |          2 |
|        3 | 555-123-4567 |          3 |
|        4 | 555-901-2345 |          4 |
+----------+--------------+------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Student_Subject;
+------------+------------+
| Student_ID | Subject_ID |
+------------+------------+
|          1 |          1 |
|          2 |          1 |
|          1 |          2 |
|          2 |          2 |
|          1 |          3 |
|          3 |          3 |
|          4 |          3 |
|          4 |          4 |
|          3 |          5 |
|          4 |          5 |
+------------+------------+
10 rows in set (0.01 sec)

mysql> SELECT * FROM Exam_Result;
+---------+------------+-------+
| Exam_ID | Student_ID | Score |
+---------+------------+-------+
|       1 |          1 |    80 |
|       1 |          2 |    90 |
|       2 |          1 |    70 |
|       2 |          2 |    20 |
|       3 |          1 |   100 |
|       3 |          3 |   100 |
|       3 |          4 |    10 |
+---------+------------+-------+
7 rows in set (0.00 sec)

-- The benefits of using ON DELETE CASCADE include:
-- Data consistency: Ensures that related data is deleted when the parent row is deleted, maintaining data integrity.
-- Reduced data redundancy: Prevents orphaned rows in the child table, reducing data redundancy and improving data quality.
-- Simplified data management: Automates the deletion of related data, reducing the need for manual intervention.
-- However, it's essential to use ON DELETE CASCADE judiciously, as it can have unintended consequences, such as:

-- Data loss: Deleting a parent row can result in the loss of related data in the child table.
-- Performance impact: Cascading deletes can impact performance, especially in large datasets.
-- To mitigate these risks, it's crucial to carefully design your database schema, consider alternative approaches, such as using ON DELETE SET NULL or ON DELETE RESTRICT, and thoroughly test your database operations.
-- .............
-- ON DELETE CASCADE constraint is used in MySQL to delete the rows from the child table automatically, when the rows from the parent table are deleted. For example when a student registers in an online learning platform, then all the details of the student are recorded with their unique number/id. All the courses in these online learning platforms had their own code, title, and name. Students can enroll in any course according to their wishes. 

-- There is no rule that all students must enroll in all courses, or they have to join the course on the same date. A student can enroll in one or more courses. Suppose you delete a row from the “Student” table, now you will also want to delete all rows in the “Enroll” table that references the row in the “Student” table. For that, we need ON DELETE CASCADE.  Below are the steps that explain how ON DELETE CASCADE referential action works.

-- 5. Update your information by changing data for (gender, birthdate, first name, last name).
UPDATE Student 
SET First_Name = 'Fatma',
    Last_Name = 'khaled', 
    Gender = 'Female', 
    Birth_Date = '1992-01-03'
WHERE Student_ID = 1;

UPDATE Student 
SET First_Name = 'Mohamed',
    Last_Name = 'Awad', 
    Gender = 'Male', 
    Birth_Date = '1995-11-25'
WHERE Student_ID = 2;

UPDATE Student 
SET First_Name = 'Wassem',
    Last_Name = 'Mohamed', 
    Gender = 'Male', 
    Birth_Date = '2020-12-5'
WHERE Student_ID = 3;


UPDATE Student 
SET First_Name = 'Laila',
    Last_Name = 'Mohamed', 
    Gender = 'Female', 
    Birth_Date = '2020-12-5'
WHERE Student_ID = 4;


 SELECT * FROM Student;
+------------+---------------------+--------------+--------+------------+------------+-----------+
| Student_ID | Email               | Address      | Gender | Birth_Date | First_Name | Last_Name |
+------------+---------------------+--------------+--------+------------+------------+-----------+
|          1 | fatma@example.com   | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |
|          2 | mohamed@example.com | 456 Elm St   | Male   | 1995-11-25 | Mohamed    | Awad      |
|          3 | wassem@example.com  | 789 Oak St   | Male   | 2020-12-05 | Wassem     | Mohamed   |
|          4 | laila@example.com   | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |
+------------+---------------------+--------------+--------+------------+------------+-----------+
4 rows in set (0.00 sec)

INSERT INTO Student (Student_ID, Email, Address ,Gender,Birth_Date, First_Name,Last_Name )  
VALUES   
(5, 'hend@example.com', '901 Pine St', 'Female', '2029-11-12 ', 'Hend',' Mohamed'); 

INSERT INTO Phone (Phone_ID, Phone_Number, Student_ID)  
VALUES    
(5, '555-111-2222', 5);  

INSERT INTO Student_Subject (Student_ID, Subject_ID)  
VALUES  
(5, 1),
(5, 5);  
 
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)  
VALUES    
(1, 5, 40); 

-- 6. Insert new student and his score in exam in different subjects as transaction.
START TRANSACTION; 
INSERT INTO Student (Student_ID, Email, Address ,Gender,Birth_Date, First_Name,Last_Name )  
VALUES   
(6, 'suliman@example.com', '111 Oak St', 'Male', '2026-01-05', 'Suliman',' Mohamed');

INSERT INTO Phone (Phone_ID, Phone_Number, Student_ID)  
VALUES    
(6, '555-123-4567', 6); 

INSERT INTO Student_Subject (Student_ID, Subject_ID)  
VALUES 
(6, 1), 
(6, 2), 
(6, 3);  
  
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)
 VALUES 
 (1, 6, 85), 
 (2, 6, 90),
 (3, 6, 80);
   
COMMIT;  

-- 7. Display all students’ information.
SELECT * FROM Student;
+------------+---------------------+--------------+--------+------------+------------+-----------+
| Student_ID | Email               | Address      | Gender | Birth_Date | First_Name | Last_Name |
+------------+---------------------+--------------+--------+------------+------------+-----------+
|          1 | fatma@example.com   | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |
|          2 | mohamed@example.com | 456 Elm St   | Male   | 1995-11-25 | Mohamed    | Awad      |
|          3 | wassem@example.com  | 789 Oak St   | Male   | 2020-12-05 | Wassem     | Mohamed   |
|          4 | laila@example.com   | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |
|          5 | hend@example.com    | 901 Pine St  | Female | 2029-11-12 | Hend       |  Mohamed  |
|          6 | suliman@example.com | 111 Oak St   | Male   | 2026-01-05 | Suliman    |  Mohamed  |
+------------+---------------------+--------------+--------+------------+------------+-----------+
6 rows in set (0.00 sec)


-- 8. Display male students only.

SELECT * 
FROM Student 
WHERE Gender = 'male';

-- 9. Display the number of female students.

SELECT * 
FROM Student 
WHERE Gender = 'female';

+------------+-------------------+--------------+--------+------------+------------+-----------+
| Student_ID | Email             | Address      | Gender | Birth_Date | First_Name | Last_Name |
+------------+-------------------+--------------+--------+------------+------------+-----------+
|          1 | fatma@example.com | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |
|          4 | laila@example.com | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |
|          5 | hend@example.com  | 901 Pine St  | Female | 2029-11-12 | Hend       |  Mohamed  |
+------------+-------------------+--------------+--------+------------+------------+-----------+
3 rows in set (0.00 sec)


 SELECT COUNT(*) 
 AS Num_Female_Students 
 FROM Student 
 WHERE Gender = 'female';

+---------------------+
| Num_Female_Students |
+---------------------+
|                   3 |
+---------------------+
1 row in set (0.01 sec)


-- 10.Display male students who are born before 1991-10-01.

SELECT * 
FROM Student
WHERE Gender = 'Male' 
AND Birth_Date < '1991-10-01';

Empty set (0.01 sec)

UPDATE Student 
SET Birth_Date = '1990-1-12' 
WHERE Student_ID = 6;

SELECT * 
FROM Student
WHERE Gender = 'Male' 
AND Birth_Date < '1991-10-01';
+------------+---------------------+------------+--------+------------+------------+-----------+
| Student_ID | Email               | Address    | Gender | Birth_Date | First_Name | Last_Name |
+------------+---------------------+------------+--------+------------+------------+-----------+
|          6 | suliman@example.com | 111 Oak St | Male   | 1990-01-12 | Suliman    |  Mohamed  |
+------------+---------------------+------------+--------+------------+------------+-----------+
1 row in set (0.00 sec)


-- 11.Display subjects and their max score sorted by max score.

SELECT * FROM Subject;
+------------+------+----------------------------+-----------+
| Subject_ID | Name | Description                | Max_Score |
+------------+------+----------------------------+-----------+
|          1 | C    | C                          |       100 |
|          2 | CPP  | CPP                        |       100 |
|          3 | HTML | Hyper Text Markup Language |       300 |
|          4 | CSS  | Cascading Style Sheet      |       100 |
|          5 | JS   | JavaScript                 |       200 |
+------------+------+----------------------------+-----------+
5 rows in set (0.00 sec)

SELECT * 
FROM Subject 
ORDER BY Max_Score 
DESC ;

+------------+------+----------------------------+-----------+
| Subject_ID | Name | Description                | Max_Score |
+------------+------+----------------------------+-----------+
|          3 | HTML | Hyper Text Markup Language |       300 |
|          5 | JS   | JavaScript                 |       200 |
|          1 | C    | C                          |       100 |
|          2 | CPP  | CPP                        |       100 |
|          4 | CSS  | Cascading Style Sheet      |       100 |
+------------+------+----------------------------+-----------+
5 rows in set (0.00 sec)

 SELECT Name, Max_Score 
 FROM Subject 
 ORDER BY Max_Score 
 DESC ;

 +------+-----------+
| Name | Max_Score |
+------+-----------+
| HTML |       300 |
| JS   |       200 |
| C    |       100 |
| CPP  |       100 |
| CSS  |       100 |
+------+-----------+
5 rows in set (0.00 sec)


-- 12.Display the subject with highest max score
SELECT Name, Max_Score 
FROM Subject 
ORDER BY Max_Score 
DESC 
LIMIT 1 ;

+------+-----------+
| Name | Max_Score |
+------+-----------+
| HTML |       300 |
+------+-----------+
1 row in set (0.00 sec)



SELECT Name, Max_Score  
FROM Subject 
WHERE Max_Score = (SELECT MAX(Max_Score) FROM Subject);

+------+-----------+
| Name | Max_Score |
+------+-----------+
| HTML |       300 |
+------+-----------+
1 row in set (0.00 sec)


SELECT * FROM Subject;
+------------+------+----------------------------+-----------+
| Subject_ID | Name | Description                | Max_Score |
+------------+------+----------------------------+-----------+
|          1 | C    | C                          |       100 |
|          2 | CPP  | CPP                        |       100 |
|          3 | HTML | Hyper Text Markup Language |       300 |
|          4 | CSS  | Cascading Style Sheet      |       100 |
|          5 | JS   | JavaScript                 |       200 |
+------------+------+----------------------------+-----------+
5 rows in set (0.00 sec)
-----------------------------------------------------------------------------------------
INSERT INTO Subject (Subject_ID, Name, Description, Max_Score)  
VALUES  
(6, 'Python', 'Python Programming', 300);

Query OK, 1 row affected (0.01 sec)

SELECT * FROM Subject;
+------------+--------+----------------------------+-----------+
| Subject_ID | Name   | Description                | Max_Score |
+------------+--------+----------------------------+-----------+
|          1 | C      | C                          |       100 |
|          2 | CPP    | CPP                        |       100 |
|          3 | HTML   | Hyper Text Markup Language |       300 |
|          4 | CSS    | Cascading Style Sheet      |       100 |
|          5 | JS     | JavaScript                 |       200 |
|          6 | Python | Python Programming         |       300 |
+------------+--------+----------------------------+-----------+
6 rows in set (0.00 sec)
----------------------------------------------------------------------------------------
SELECT Name, Max_Score 
FROM Subject 
ORDER BY Max_Score 
DESC 
LIMIT 1 ;

+--------+-----------+
| Name   | Max_Score |
+--------+-----------+
| Python |       300 |
+--------+-----------+
1 row in set (0.00 sec)


SELECT Name, Max_Score  
FROM Subject 
WHERE Max_Score = (SELECT MAX(Max_Score) FROM Subject);

+--------+-----------+
| Name   | Max_Score |
+--------+-----------+
| HTML   |       300 |
| Python |       300 |
+--------+-----------+
2 rows in set (0.00 sec)

-- 13.Display students’ names that begin with A.
SELECT First_Name, Last_Name 
FROM Student 
WHERE First_Name 
LIKE 'M%';

+------------+-----------+
| First_Name | Last_Name |
+------------+-----------+
| Mohamed    | Awad      |
+------------+-----------+
1 row in set (0.00 sec)

-- 14.Display the number of students’ their name is “Mohammed”

SELECT *
FROM Student 
WHERE First_Name = 'Mohamed';

+------------+---------------------+------------+--------+------------+------------+-----------+
| Student_ID | Email               | Address    | Gender | Birth_Date | First_Name | Last_Name |
+------------+---------------------+------------+--------+------------+------------+-----------+
|          2 | mohamed@example.com | 456 Elm St | Male   | 1995-11-25 | Mohamed    | Awad      |
+------------+---------------------+------------+--------+------------+------------+-----------+
1 row in set (0.00 sec)


SELECT COUNT(*) AS Num_Students 
FROM Student 
WHERE First_Name = 'Mohamed';

+--------------+
| Num_Students |
+--------------+
|            1 |
+--------------+
1 row in set (0.01 sec)



START TRANSACTION;   

INSERT INTO Student (Student_ID, Email, Address ,Gender,Birth_Date, First_Name,Last_Name )  
VALUES   
(7, 'm_wassem@example.com', '1 Oak St', 'Male', '2030-01-05', 'Mohamed',' Wassem');

INSERT INTO Phone (Phone_ID, Phone_Number, Student_ID)  
VALUES    
(7, '777-123-4567', 7); 

INSERT INTO Student_Subject (Student_ID, Subject_ID)  
VALUES 
(7, 2), 
(7, 4), 
(7, 5);  

INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)
 VALUES 
 (1, 7, 85), 
 (2, 7, 10),
 (3, 7, 20);

COMMIT;  



SELECT COUNT(*) AS Num_Students 
FROM Student 
WHERE First_Name = 'Mohamed';

+--------------+
| Num_Students |
+--------------+
|            2 |
+--------------+
1 row in set (0.01 sec)

-- 15.Display the number of males and females.

SELECT Gender, COUNT(*) AS Num_Students 
FROM Student 
GROUP BY Gender;

+--------+--------------+
| Gender | Num_Students |
+--------+--------------+
| Female |            3 |
| Male   |            4 |
+--------+--------------+
2 rows in set (0.02 sec)

-- 16.Display the repeated first names and their counts if higher than 2.
SELECT First_Name
FROM Student 
GROUP BY First_Name 
HAVING COUNT(*) > 1;

+------------+
| First_Name |
+------------+
| Mohamed    |
+------------+


SELECT First_Name, COUNT(*) AS Count 
FROM Student 
GROUP BY First_Name 
HAVING COUNT(*) > 1;

+------------+-------+
| First_Name | Count |
+------------+-------+
| Mohamed    |     2 |
+------------+-------+
1 row in set (0.00 sec)

INSERT INTO Student (Student_ID, First_Name, Last_Name, Email, Address, Gender, Birth_Date) 
VALUES
(9, 'Mohamed', 'Ali', 'mohamedali@example.com', '115 Oakto St', 'Male', '1980-02-28');

SELECT First_Name, COUNT(*) AS Count 
FROM Student 
GROUP BY First_Name 
HAVING COUNT(*) > 2;

+------------+-------+
| First_Name | Count |
+------------+-------+
| Mohamed    |     3 |
+------------+-------+
1 row in set (0.00 sec)

-- 17.Create a view for student names with their Tracks names which is belong to it.
-- part 1 ---add Track table and its relations 


SELECT * FROM Student;
+------------+------------------------+--------------+--------+------------+------------+-----------+
| Student_ID | Email                  | Address      | Gender | Birth_Date | First_Name | Last_Name |
+------------+------------------------+--------------+--------+------------+------------+-----------+
|          1 | fatma@example.com      | 123 Main St  | Female | 1992-01-03 | Fatma      | khaled    |
|          2 | mohamed@example.com    | 456 Elm St   | Male   | 1995-11-25 | Mohamed    | Awad      |
|          3 | wassem@example.com     | 789 Oak St   | Male   | 2020-12-05 | Wassem     | Mohamed   |
|          4 | laila@example.com      | 321 Maple St | Female | 2020-12-05 | Laila      | Mohamed   |
|          5 | hend@example.com       | 901 Pine St  | Female | 2029-11-12 | Hend       |  Mohamed  |
|          6 | suliman@example.com    | 111 Oak St   | Male   | 1990-01-12 | Suliman    |  Mohamed  |
|          7 | m_wassem@example.com   | 1 Oak St     | Male   | 2030-01-05 | Mohamed    |  Wassem   |
|          9 | mohamedali@example.com | 115 Oakto St | Male   | 1980-02-28 | Mohamed    | Ali       |
+------------+------------------------+--------------+--------+------------+------------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM Subject;
+------------+--------+----------------------------+-----------+
| Subject_ID | Name   | Description                | Max_Score |
+------------+--------+----------------------------+-----------+
|          1 | C      | C                          |       100 |
|          2 | CPP    | CPP                        |       100 |
|          3 | HTML   | Hyper Text Markup Language |       300 |
|          4 | CSS    | Cascading Style Sheet      |       100 |
|          5 | JS     | JavaScript                 |       200 |
|          6 | Python | Python Programming         |       300 |
+------------+--------+----------------------------+-----------+
6 rows in set (0.00 sec)

CREATE TABLE Track 
(Track_ID int PRIMARY KEY, 
 Track_Name varchar(50) 
); 

INSERT INTO Track (Track_ID, Track_Name)
VALUES 
(1, 'Open Sourec Application'), 
(2, 'Cloud Platform Development'), 
(3, 'Artificial intelligence'),
(4, 'Full Stack Development Using Python'); 

SELECT * FROM Track;

+----------+-------------------------------------+
| Track_ID | Track_Name                          |
+----------+-------------------------------------+
|        1 | Open Source Application             |
|        2 | Cloud Platform Development          |
|        3 | Artificial intelligence             |
|        4 | Full Stack Development Using Python |
+----------+-------------------------------------+
4 rows in set (0.00 sec)



ALTER TABLE Student  
ADD COLUMN Track_ID INT,  
ADD FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID) ON DELETE CASCADE;

Query OK, 8 rows affected (0.10 sec)
Records: 8  Duplicates: 0  Warnings: 0



ALTER TABLE Subject  
ADD COLUMN Track_ID INT,  
ADD FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID) ON DELETE CASCADE;


Query OK, 6 rows affected (0.09 sec)
Records: 6  Duplicates: 0  Warnings: 0



UPDATE Student  
SET Track_ID = CASE  
   WHEN Student_ID = 1 THEN 2  
   WHEN Student_ID = 2 THEN 1
   WHEN Student_ID = 3 THEN 3
   WHEN Student_ID = 4 THEN 4  
   WHEN Student_ID = 5 THEN 2
   WHEN Student_ID = 6 THEN 2
   WHEN Student_ID = 7 THEN 1
   WHEN Student_ID = 9 THEN 1
END;


Query OK, 8 rows affected (0.01 sec)
Rows matched: 8  Changed: 8  Warnings: 0


UPDATE Subject  
SET Track_ID = CASE  
   WHEN Subject_ID = 1 THEN 2  
   WHEN Subject_ID = 2 THEN 1
   WHEN Subject_ID = 3 THEN 3
   WHEN Subject_ID = 4 THEN 4  
   WHEN Subject_ID = 5 THEN 2
   WHEN Subject_ID = 6 THEN 2
END;

Query OK, 6 rows affected (0.02 sec)
Rows matched: 6  Changed: 6  Warnings: 0



SELECT * FROM Student;
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
+------------+------------------------+--------------+--------+------------+------------+-----------+----------+
8 rows in set (0.00 sec)


SELECT * FROM Subject;

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
6 rows in set (0.00 sec)


-- Create a view for student names with their Tracks names which is belong to it.

CREATE VIEW student_tracks AS  
SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , t.Track_Name 
FROM Student s
JOIN Track t ON s.Track_ID = t.Track_ID;

SELECT * FROM student_tracks;



SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , t.Track_Name 
FROM Student s
JOIN Track t ON s.Track_ID = t.Track_ID;
+-----------------+-------------------------------------+
| Student_Name    | Track_Name                          |
+-----------------+-------------------------------------+
| Fatmakhaled     | Cloud Platform Development          |
| MohamedAwad     | Open Source Application             |
| WassemMohamed   | Artificial intelligence             |
| LailaMohamed    | Full Stack Development Using Python |
| Hend Mohamed    | Cloud Platform Development          |
| Suliman Mohamed | Cloud Platform Development          |
| Mohamed Wassem  | Open Source Application             |
| MohamedAli      | Open Source Application             |
+-----------------+-------------------------------------+
8 rows in set (0.00 sec)

CREATE VIEW student_tracks AS  
SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , t.Track_Name 
FROM Student s
 JOIN Track t ON s.Track_ID = t.Track_ID;
Query OK, 0 rows affected (0.02 sec)


SELECT * FROM student_tracks;
+-----------------+-------------------------------------+
| Student_Name    | Track_Name                          |
+-----------------+-------------------------------------+
| Fatmakhaled     | Cloud Platform Development          |
| MohamedAwad     | Open Source Application             |
| WassemMohamed   | Artificial intelligence             |
| LailaMohamed    | Full Stack Development Using Python |
| Hend Mohamed    | Cloud Platform Development          |
| Suliman Mohamed | Cloud Platform Development          |
| Mohamed Wassem  | Open Source Application             |
| MohamedAli      | Open Source Application             |
+-----------------+-------------------------------------+
8 rows in set (0.00 sec)



-- 18.Create a view for Tracks names and the subjects which is belong/study to it.

SELECT * FROM track_subjects;

SELECT t.Track_Name , GROUP_CONCAT(s.Name) AS Subject_Name 
FROM Track t
JOIN Subject s ON t.Track_ID = s.Track_ID
GROUP BY t.Track_Name;

+-------------------------------------+--------------+
| Track_Name                          | Subject_Name |
+-------------------------------------+--------------+
| Artificial intelligence             | HTML         |
| Cloud Platform Development          | C,JS,Python  |
| Full Stack Development Using Python | CSS          |
| Open Source Application             | CPP          |
+-------------------------------------+--------------+
4 rows in set (0.00 sec)

CREATE VIEW track_subjects AS 
SELECT t.Track_Name , GROUP_CONCAT(s.Name) AS Subject_Name 
FROM Track t
JOIN Subject s ON t.Track_ID = s.Track_ID
GROUP BY t.Track_Name;
Query OK, 0 rows affected (0.02 sec)


SELECT * FROM track_subjects;
+-------------------------------------+--------------+
| Track_Name                          | Subject_Name |
+-------------------------------------+--------------+
| Artificial intelligence             | HTML         |
| Cloud Platform Development          | Python,JS,C  |
| Full Stack Development Using Python | CSS          |
| Open Source Application             | CPP          |
+-------------------------------------+--------------+
4 rows in set (0.01 sec)


-- 19.Create a view for student names with their subject's names which will study.

SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , sub.Name AS Subject_Name 
FROM Student s 
JOIN Student_Subject ss ON s.Student_ID = ss.Student_ID 
JOIN Subject sub ON ss.Subject_ID = sub.Subject_ID;
+-----------------+--------------+
| Student_Name    | Subject_Name |
+-----------------+--------------+
| Fatmakhaled     | C            |
| MohamedAwad     | C            |
| Hend Mohamed    | C            |
| Suliman Mohamed | C            |
| Fatmakhaled     | CPP          |
| MohamedAwad     | CPP          |
| Suliman Mohamed | CPP          |
| Mohamed Wassem  | CPP          |
| Fatmakhaled     | HTML         |
| WassemMohamed   | HTML         |
| LailaMohamed    | HTML         |
| Suliman Mohamed | HTML         |
| LailaMohamed    | CSS          |
| Mohamed Wassem  | CSS          |
| WassemMohamed   | JS           |
| LailaMohamed    | JS           |
| Hend Mohamed    | JS           |
| Mohamed Wassem  | JS           |
+-----------------+--------------+
18 rows in set (0.00 sec)


CREATE VIEW StudentNames_subjects AS  
SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , sub.Name AS Subject_Name 
FROM Student s 
JOIN Student_Subject ss ON s.Student_ID = ss.Student_ID 
JOIN Subject sub ON ss.Subject_ID = sub.Subject_ID;

Query OK, 0 rows affected (0.02 sec)


SELECT * FROM StudentNames_subjects;
+-----------------+--------------+
| Student_Name    | Subject_Name |
+-----------------+--------------+
| Fatmakhaled     | C            |
| MohamedAwad     | C            |
| Hend Mohamed    | C            |
| Suliman Mohamed | C            |
| Fatmakhaled     | CPP          |
| MohamedAwad     | CPP          |
| Suliman Mohamed | CPP          |
| Mohamed Wassem  | CPP          |
| Fatmakhaled     | HTML         |
| WassemMohamed   | HTML         |
| LailaMohamed    | HTML         |
| Suliman Mohamed | HTML         |
| LailaMohamed    | CSS          |
| Mohamed Wassem  | CSS          |
| WassemMohamed   | JS           |
| LailaMohamed    | JS           |
| Hend Mohamed    | JS           |
| Mohamed Wassem  | JS           |
+-----------------+--------------+
18 rows in set (0.00 sec)


SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , GROUP_CONCAT(sub.Name) AS Subject_Name
FROM Student s
JOIN Student_Subject ss ON s.Student_ID = ss.Student_ID 
JOIN Subject sub ON ss.Subject_ID = sub.Subject_ID
GROUP BY s.Student_ID , s.First_Name , s.Last_Name;
+-----------------+--------------+
| Student_Name    | Subject_Name |
+-----------------+--------------+
| Fatmakhaled     | C,CPP,HTML   |
| MohamedAwad     | C,CPP        |
| WassemMohamed   | HTML,JS      |
| LailaMohamed    | HTML,CSS,JS  |
| Hend Mohamed    | C,JS         |
| Suliman Mohamed | CPP,C,HTML   |
| Mohamed Wassem  | CPP,CSS,JS   |
+-----------------+--------------+
7 rows in set (0.01 sec)


CREATE VIEW StudentNames_subjects2 AS 
SELECT CONCAT(s.First_Name, s.Last_Name) AS Student_Name , GROUP_CONCAT(sub.Name) AS Subject_Name
FROM Student s
JOIN Student_Subject ss ON s.Student_ID = ss.Student_ID 
JOIN Subject sub ON ss.Subject_ID = sub.Subject_ID
GROUP BY s.Student_ID , s.First_Name , s.Last_Name;


mysql> SELECT * FROM StudentNames_subjects2;
+-----------------+--------------+
| Student_Name    | Subject_Name |
+-----------------+--------------+
| Fatmakhaled     | C,CPP,HTML   |
| MohamedAwad     | C,CPP        |
| WassemMohamed   | HTML,JS      |
| LailaMohamed    | HTML,CSS,JS  |
| Hend Mohamed    | C,JS         |
| Suliman Mohamed | CPP,C,HTML   |
| Mohamed Wassem  | CPP,CSS,JS   |
+-----------------+--------------+
7 rows in set (0.01 sec)

-- 20.Create a view for students’ names, their score and subject name.

CREATE VIEW student_scores AS  
SELECT s.name AS student_name, e.score, sub.subject_name  
FROM students s  
JOIN exam_results e ON s.student_id = e.student_id  
JOIN exams ex ON e.exam_id = ex.exam_id  
JOIN subjects sub ON ex.subject_id = sub.subject_id;
-- 21.Create a temporary view for all subjects with their max_score.

CREATE TEMPORARY VIEW subject_max_scores AS SELECT subject_name, max_score FROM subjects;
-- 22.Delete students their score is lower than 50 in a particular subject exam.

DELETE s FROM students s
 JOIN exam_results e 
 ON s.student_id = e.student_id
  JOIN exams ex ON e.exam_id = ex.exam_id 
  JOIN subjects sub ON ex.subject_id = sub.subject_id
   WHERE e.score < 50 
   AND sub.subject_name = 'Subject_Name';



   DELETE FROM students WHERE student_id IN (SELECT e.student_id
    FROM exam_results e 
   JOIN exams ex ON e.exam_id = ex.exam_id 
   JOIN subjects sub ON ex.subject_id = sub.subject_id 
   WHERE e.score < 50 
   AND sub.subject_name = 'Subject_Name');


   DELETE s FROM students s 
   WHERE s.student_id 
   IN (SELECT student_id 
   FROM exam_results 
   WHERE score < 50 
   AND exam_id 
   IN (SELECT exam_id FROM exams 
   WHERE subject_id 
   IN (SELECT subject_id FROM subjects WHERE subject_name = 'Subject_Name')));