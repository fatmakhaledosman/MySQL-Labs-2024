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

CREATE DATABASE electronic_gradekeeping;

USE electronic_gradekeeping;

 SHOW DATABASES;
+--------------------------+
| Database                 |
+--------------------------+                 |
| electronic_gradekeeping  |
+--------------------------+

 SELECT DATABASE();  
+-------------------------+
| DATABASE()              |
+-------------------------+
| electronic_gradekeeping |
+-------------------------+

SHOW TABLES;
Empty set (0.01 sec)

CREATE TABLE Student (  
  Student_ID INT PRIMARY KEY,  
  Name VARCHAR(50),  
  Email VARCHAR(100),  
  Address VARCHAR(200)  
);  
  
CREATE TABLE Phone (  
  Phone_ID INT PRIMARY KEY,  
  Phone_Number VARCHAR(20),  
  Student_ID INT,  
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)  
); 

CREATE TABLE Subject (  
  Subject_ID INT PRIMARY KEY,  
  Name VARCHAR(50),  
  Description VARCHAR(200),  
  Max_Score INT  
); 

CREATE TABLE Exam (  
  Exam_ID INT PRIMARY KEY,  
  Exam_Date DATE,  
  Subject_ID INT,  
  FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)  
); 

CREATE TABLE Student_Subject (  
  Student_ID INT,  
  Subject_ID INT,  
  PRIMARY KEY (Student_ID, Subject_ID),  
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),  
  FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)  
);  
  
CREATE TABLE Exam_Result (  
  Exam_ID INT,  
  Student_ID INT,  
  Score INT,  
  PRIMARY KEY (Exam_ID, Student_ID),  
  FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),  
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)  
);

SHOW TABLES;
+-----------------------------------+
| Tables_in_electronic_gradekeeping |
+-----------------------------------+
| Exam                              |
| Exam_Result                       |
| Phone                             |
| Student                           |
| Student_Subject                   |
| Subject                           |
+-----------------------------------+
6 rows in set (0.00 sec)

-- 4.Insert your classmates data(5 rows for each table).

mysql> INSERT INTO Student (Student_ID, Name, Email, Address)  
    -> VALUES  
    -> (1, 'Fatma Khaled', 'fatma@example.com', '123 Main St'),  
    -> (2, 'Mohamed Awad', 'mohamed@example.com', '456 Elm St'),  
    -> (3, 'Wassem Mohamed', 'wassem@example.com', '789 Oak St'),  
    -> (4, 'Laila Mohamed', 'laila@example.com', '321 Maple St'),  
    -> (5, 'Hend Mohamed', 'hend@example.com', '901 Pine St'); 
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Student;
+------------+----------------+---------------------+--------------+
| Student_ID | Name           | Email               | Address      |
+------------+----------------+---------------------+--------------+
|          1 | Fatma Khaled   | fatma@example.com   | 123 Main St  |
|          2 | Mohamed Awad   | mohamed@example.com | 456 Elm St   |
|          3 | Wassem Mohamed | wassem@example.com  | 789 Oak St   |
|          4 | Laila Mohamed  | laila@example.com   | 321 Maple St |
|          5 | Hend Mohamed   | hend@example.com    | 901 Pine St  |
+------------+----------------+---------------------+--------------+
5 rows in set (0.00 sec)



mysql> INSERT INTO Phone (Phone_ID, Phone_Number, Student_ID)  
    -> VALUES  
    -> (1, '123-456-7890', 1),  
    -> (2, '987-654-3210', 2),  
    -> (3, '555-123-4567', 3),  
    -> (4, '555-901-2345', 4),  
    -> (5, '555-111-2222', 5);  
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Phone;
+----------+--------------+------------+
| Phone_ID | Phone_Number | Student_ID |
+----------+--------------+------------+
|        1 | 123-456-7890 |          1 |
|        2 | 987-654-3210 |          2 |
|        3 | 555-123-4567 |          3 |
|        4 | 555-901-2345 |          4 |
|        5 | 555-111-2222 |          5 |
+----------+--------------+------------+
5 rows in set (0.01 sec)



mysql> INSERT INTO Subject (Subject_ID, Name, Description, Max_Score)  
    -> VALUES  
    -> (1, 'C', 'C', 100),  
    -> (2, 'CPP', 'CPP', 100),  
    -> (3, 'HTML', 'Hyper Text Markup Language', 300),  
    -> (4, 'CSS', 'Cascading Style Sheet', 100),  
    -> (5, 'JS', 'JavaScript', 200); 
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Subject;
+------------+------+----------------------------+-----------+
| Subject_ID | Name | Description                | Max_Score |
+------------+------+----------------------------+-----------+
|          1 | C    | C                          |       100 |
|          2 | CPP  | CPP                        |       100 |
|          3 | HTML | Hyper Text Markup Language |       300 |
|          4 | CSS  | Cascading Style Sheet      |       100 |
|          5 | JS   | JavaScript                 |       200 |
+------------+------+----------------------------+-----------+
5 rows in set (0.01 sec)


mysql> INSERT INTO Exam (Exam_ID, Exam_Date, Subject_ID)  
    -> VALUES  
    -> (1, '2022-01-01', 1),  
    -> (2, '2022-01-15', 2),  
    -> (3, '2022-02-01', 3),  
    -> (4, '2022-02-15', 4),  
    -> (5, '2022-03-01', 5);  
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Exam;
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



mysql> INSERT INTO Student_Subject (Student_ID, Subject_ID)  
    -> VALUES  
    -> (1, 1),  
    -> (1, 2), 
    -> (1, 3), 
    -> (2, 1),  
    -> (2, 2),  
    -> (3, 3),
    -> (3, 5),
    -> (4, 3),
    -> (4, 4),
    -> (4, 5),
    -> (5, 1),
    -> (5, 5);
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Student_Subject;
+------------+------------+
| Student_ID | Subject_ID |
+------------+------------+
|          1 |          1 |
|          2 |          1 |
|          5 |          1 |
|          1 |          2 |
|          2 |          2 |
|          1 |          3 |
|          3 |          3 |
|          4 |          3 |
|          4 |          4 |
|          3 |          5 |
|          4 |          5 |
|          5 |          5 |
+------------+------------+
12 rows in set (0.00 sec)




mysql> INSERT INTO Exam_Result (Exam_ID, Student_ID, Score)  
    -> VALUES  
    -> (1, 1, 80),        
    -> (1, 2, 90),  
    -> (1, 5, 40), 
    -> (2, 1, 70),  
    -> (2, 2, 20),
    -> (3, 1, 100),
    -> (3, 3, 100),
    -> (3, 4, 10); 
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Exam_Result;
+---------+------------+-------+
| Exam_ID | Student_ID | Score |
+---------+------------+-------+
|       1 |          1 |    80 |
|       1 |          2 |    90 |
|       1 |          5 |    40 |
|       2 |          1 |    70 |
|       2 |          2 |    20 |
|       3 |          1 |   100 |
|       3 |          3 |   100 |
|       3 |          4 |    10 |
+---------+------------+-------+
8 rows in set (0.01 sec)





