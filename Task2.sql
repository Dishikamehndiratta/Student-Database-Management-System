CREATE DATABASE student_database;

Use student_database

CREATE TABLE student_table (
    Student_id INT PRIMARY KEY IDENTITY(1,1),
    Stu_name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    email_id VARCHAR(50) NOT NULL,
    Phone_no NUMERIC(10) NOT NULL,
    Address VARCHAR(50),
    Date_of_birth DATE NOT NULL,
    Gender VARCHAR(50) CHECK (Gender IN ('Male', 'Female', 'Other')),
    Major VARCHAR(50),
    GPA NUMERIC(3, 2),
    Grade VARCHAR(50) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);


--2
INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES 
('Aarav Patel', 'Computer Science', 'aarav.patel@example.com', 9876543210, '123 Bangalore, Karnataka', '2000-10-01', 'Male', 'Software Engineering', 3.80, 'A'),
('Priya Sharma', 'Mechanical Engineering', 'priya.sharma@example.com', 9123456789, '456 Delhi, India', '2001-05-15', 'Female', 'Thermodynamics', 3.65, 'B'),
('Rahul Verma', 'Electrical Engineering', 'rahul.verma@example.com', 9009876543, '789 Mumbai, Maharashtra', '1999-07-20', 'Male', 'Circuits and Systems', 3.40, 'C'),
('Ananya Gupta', 'Civil Engineering', 'ananya.gupta@example.com', 8787878787, '101 Noida, Uttar Pradesh', '2002-01-10', 'Female', 'Structural Engineering', 3.90, 'A'),
('Vishal Reddy', 'Information Technology', 'vishal.reddy@example.com', 8223344556, '202 Hyderabad, Telangana', '2000-11-30', 'Male', 'Web Development', 3.50, 'B'),
('Isha Joshi', 'Biotechnology', 'isha.joshi@example.com', 9988776655, '303 Pune, Maharashtra', '2001-03-25', 'Female', 'Genetics', 3.85, 'A'),
('Karan Singh', 'Chemical Engineering', 'karan.singh@example.com', 9856347231, '404 Jaipur, Rajasthan', '2000-08-05', 'Male', 'Process Engineering', 3.20, 'C'),
('Sneha Kumar', 'Electrical Engineering', 'sneha.kumar@example.com', 9776334455, '505 Chennai, Tamil Nadu', '2000-06-14', 'Female', 'Power Systems', 3.75, 'B'),
('Rohit Yadav', 'Mechanical Engineering', 'rohit.yadav@example.com', 9662112233, '606 Ahmedabad, Gujarat', '2001-09-17', 'Male', 'Automotive Engineering', 3.60, 'B'),
('Neha Nair', 'Civil Engineering', 'neha.nair@example.com', 9444556677, '707 Kochi, Kerala', '2000-04-22', 'Female', 'Water Resources Engineering', 3.95, 'A');

--3
SELECT * 
FROM student_table
ORDER BY Grade DESC;



--4
SELECT * 
FROM student_table
WHERE Gender = 'Male';

--5
SELECT * 
FROM student_table
WHERE GPA < 5.0;

--6
UPDATE student_table
SET 
    email_id = 'newemail3@example.com',
    Grade = 'A'
WHERE 
    Student_id = 3;

--7
SELECT 
    Stu_name,
    DATEDIFF(YEAR, Date_of_birth, GETDATE()) - 
    CASE 
        WHEN MONTH(Date_of_birth) > MONTH(GETDATE()) OR 
             (MONTH(Date_of_birth) = MONTH(GETDATE()) AND DAY(Date_of_birth) > DAY(GETDATE()))
        THEN 1 
        ELSE 0 
    END AS Age
FROM 
    student_table
WHERE 
    Grade = 'B';

--8
SELECT 
    Department,
    Gender,
    AVG(GPA) AS Average_GPA
FROM 
    student_table
GROUP BY 
    Department, Gender;

--9
EXEC sp_rename 'student_table', 'student_info';


--10
SELECT TOP 1 Stu_name
FROM student_info
ORDER BY GPA DESC;















