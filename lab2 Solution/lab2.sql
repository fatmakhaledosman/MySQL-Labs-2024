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