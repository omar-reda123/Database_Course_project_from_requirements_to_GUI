CREATE TABLE University
(
	University_ID INT PRIMARY KEY,
	University_Name VARCHAR(50) NOT NULL
);
CREATE TABLE Faculty
(
	Faculty_ID INT PRIMARY KEY,
	Faculty_Name VARCHAR(50) NOT NULL,
	University_ID INT REFERENCES University(University_ID)
);
CREATE TABLE Department
(
	Department_ID INT PRIMARY KEY,
	Department_Name VARCHAR(50) NOT NULL,
	Faculty_ID INT REFERENCES Faculty(Faculty_ID)
);
CREATE TABLE Student
(
	Student_ID INT PRIMARY KEY,
	Student_Name VARCHAR(50) NOT NULL,
	Student_DOB DATE,
	Student_Address VARCHAR(50),
	Student_Email VARCHAR(60) CHECK (Student_Email LIKE '%@%.%'),
	Department_ID INT REFERENCES Department(Department_ID)
);
CREATE TABLE Advisor
(
	Advisor_ID INT PRIMARY KEY,
	Advisor_Name VARCHAR(50) NOT NULL,
	Advisor_DOB DATE,
	Advisor_Address VARCHAR(50),
	Advisor_Email VARCHAR(60) CHECK (Advisor_Email LIKE '%@%.%'),
	Advisor_Title VARCHAR(20) CHECK (Advisor_Title IN ('Doctor','Professor','Emeritus')) ,
	Department_ID INT REFERENCES Department(Department_ID)
);
CREATE TABLE Thesis
(
	Thesis_ID INT PRIMARY KEY,
	Thesis_Subject VARCHAR(200) UNIQUE,
	Thesis_Type VARCHAR(10) CHECK(Thesis_Type IN('Master','PhD')),
	Thesis_Start_Date DATE,
	Thesis_Approval_Status VARCHAR(10) CHECK(Thesis_Approval_Status IN('Approved','Rejected','Pending')),
	Student_ID INT REFERENCES Student(Student_ID),
	Advisor_ID INT REFERENCES Advisor(Advisor_ID)
);
CREATE TABLE Plagiarism_Report
(
	Report_ID INT PRIMARY KEY,
	Report_Check_Date DATE,
	Plagiarism_Percentage INT CHECK(Plagiarism_Percentage BETWEEN 0 AND 100),
	Thesis_ID INT REFERENCES Thesis(Thesis_ID)
);
CREATE TABLE Embargo_Period
(
	Embargo_ID INT PRIMARY KEY,
	Embargo_Start_Date DATE,
	Embargo_End_Date DATE,
	Embargo_Reason VARCHAR(200),
	Thesis_ID INT REFERENCES Thesis(Thesis_ID),
	CONSTRAINT CHK_EndAfterStart CHECK (Embargo_End_Date > Embargo_Start_Date)
);
