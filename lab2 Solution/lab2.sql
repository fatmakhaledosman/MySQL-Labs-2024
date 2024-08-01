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

-- 5. Update your information by changing data for (gender, birthdate, first name, last name).


-- 6. Insert new student and his score in exam in different subjects as transaction.


-- 7. Display all students’ information.


-- 8. Display male students only.


-- 9. Display the number of female students.


-- 10.Display male students who are born before 1991-10-01.


-- 11.Display subjects and their max score sorted by max score.


-- 12.Display the subject with highest max score


-- 13.Display students’ names that begin with A.


-- 14.Display the number of students’ their name is “Mohammed”


-- 15.Display the number of males and females.


-- 16.Display the repeated first names and their counts if higher than 2.


-- 17.Create a view for student names with their Tracks names which is belong to it.


-- 18.Create a view for Tracks names and the subjects which is belong/study to it.


-- 19.Create a view for student names with their subject's names which will study.


-- 20.Create a view for students’ names, their score and subject name.


-- 21.Create a temporary view for all subjects with their max_score.


-- 22.Delete students their score is lower than 50 in a particular subject exam.