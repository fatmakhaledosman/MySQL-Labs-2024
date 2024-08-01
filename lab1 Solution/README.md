# MySQL-Labs-2024
## Lab1 Solution

## Lab1
![lab1](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1.png)

##  1.Install MYSQL DBMS.


## 2.Design ERD and write down the mapping schema.

![ERD]()

![Mapping-Schema]()

## electronic_gradekeeping database

## Entities:
### ---------
## 1. Student
###     - Student_ID (Primary key)
###     - Name
###     - Email
###     - Address
### ---------------------------------------------------------------
###
## 2. Phone 
###     - Phone_ID (Primary key)
###     - Phone_Number
###     - Student_ID (Foreign key referencing Student)
###  ---------------------------------------------------------------
###
## 3. Subject 
###     - Subject_ID (Primary key)
###     - Name
###     - Description 
###     - Max_Score 
###  ---------------------------------------------------------------
###
## 4. Student_Subject  
###     - Student_ID (Foreign key referencing Student)
###     - Subject_ID (Foreign key referencing Subject)
###     - PRIMARY KEY (Student_ID, Subject_ID)
###  ---------------------------------------------------------------
###
## 5.Exam 
###     - Exam_ID (Primary key)
###     - Exam_Date
###     - Subject_ID (Foreign key referencing Subject)
###  ---------------------------------------------------------------
###
## 6. Exam_Result
###     - Exam_ID (Foreign key referencing Exam)
###     - Student_ID (Foreign key referencing Student)
###     - Score 
###     - PRIMARY KEY (Exam_ID, Student_ID)
### ---------------------------------------------------------------
###
## 3.Create your mapped tables with their columns.

![lab1-1](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-1.png)

![lab1-2](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-2.png)

![lab1-3](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-3.png)

![lab1-4](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-4.png)

![lab1-5](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-5.png)

## 4.Insert your classmates data(5 rows for each table).

![lab1-6](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-6.png)

![lab1-7](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-7.png)

![lab1-8](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-8.png)

![lab1-9](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-9.png)

![lab1-10](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-10.png)

![lab1-11](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-11.png)

![lab1-12](https://github.com/fatmakhaledosman/MySQL-Labs-2024/blob/main/Labs-images/lab1/lab1-12.png)
