INSERT INTO University (University_ID, University_Name) 
VALUES (1, 'Menoufia University');
INSERT INTO University VALUES (2, 'Banha University');

INSERT INTO Faculty (Faculty_ID, Faculty_Name, University_ID)
VALUES (1, 'Faculty of Electronic Engineering', 1);

INSERT INTO Department (Department_ID, Department_Name, Faculty_ID)
VALUES (1, 'CSE', 1);

SELECT * FROM University