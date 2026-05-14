INSERT INTO University (University_ID, University_Name) 
VALUES (1, 'Menoufia University');
INSERT INTO University VALUES (2, 'Banha University');
INSERT INTO University VALUES (3, 'Minya University');

INSERT INTO Faculty (Faculty_ID, Faculty_Name, University_ID)
VALUES (1, 'Faculty of Electronic Engineering', 1);

INSERT INTO Department (Department_ID, Department_Name, Faculty_ID)
VALUES (1, 'CSE', 1);

INSERT INTO Department VALUES (2, 'ACE', 1);
INSERT INTO Thesis VALUES (1,'The evalution of GPU towards better AI futuer','PHD','1/10/2014','Pending',NULL,NULL)
INSERT INTO Thesis VALUES (2,'Hardware in egypt','Master','1/10/2015','Pending',NULL,NULL)
INSERT INTO Thesis VALUES (3,'Data analysis in control systems','Master','1/10/2016','Pending',NULL,NULL)

SELECT F.Faculty_Name,D.Department_Name 
FROM Faculty F    INNER JOIN Department D 
ON F.Faculty_ID=D.Faculty_ID

SELECT * FROM University
SELECT * FROM Faculty
SELECT * FROM Department
SELECT * FROM Thesis
