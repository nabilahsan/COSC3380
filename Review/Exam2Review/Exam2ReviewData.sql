DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Faculty CASCADE CONSTRAINTS;
DROP TABLE Class CASCADE CONSTRAINTS;
DROP TABLE Enroll CASCADE CONSTRAINTS;
DROP VIEW HISTMATH;

CREATE TABLE Student (
    stuId CHAR(5) NOT NULL,
    lastName CHAR(15),
    firstName CHAR(15),
    major CHAR(15),
    credits NUMBER(3),
    PRIMARY KEY (stuId) );

INSERT INTO Student VALUES( 'S1001', 'Smith', 'Tom', 'History', '90' );
INSERT INTO Student VALUES( 'S1002', 'Chin', 'Ann', 'Math', '36' );
INSERT INTO Student VALUES( 'S1005', 'Lee', 'Perry', 'History', '3' );
INSERT INTO Student VALUES( 'S1010', 'Burns', 'Edward', 'Art', '63' );
INSERT INTO Student VALUES( 'S1013', 'McCarthy', 'Owen', 'Math', '0' );
INSERT INTO Student VALUES( 'S1015', 'Jones', 'Mary', 'Math', '42' );
INSERT INTO Student VALUES( 'S1020', 'Rivera', 'Jane', 'CSC', '15' );

CREATE TABLE Faculty (
    facId CHAR(5) NOT NULL,
    name CHAR(15),
    department CHAR(15),
    faculRank CHAR(25), -- rank is a key word?
    PRIMARY KEY (facId) );

INSERT INTO Faculty VALUES( 'F101','Adams', 'Art', 'Professor' );
INSERT INTO Faculty VALUES( 'F105','Tanaka', 'CSC', 'Instructor' );
INSERT INTO Faculty VALUES( 'F110','Byrne', 'Math', 'Assistant' );
INSERT INTO Faculty VALUES( 'F115','Smith', 'History', 'Associate' );
INSERT INTO Faculty VALUES( 'F221','Smith', 'CSC', 'Professor' );

CREATE TABLE Class (
    classNumber CHAR(10) NOT NULL,
    facId CHAR(5) NOT NULL,
    schedule CHAR(10),
    room CHAR(10),
    PRIMARY KEY(classNumber, facId),
    FOREIGN KEY (facId) REFERENCES Faculty(facId) );

INSERT INTO Class VALUES('ART103A', 'F101','MWF9', 'H221');
INSERT INTO Class VALUES('CSC201A', 'F105','TUTHF10', 'M110');
INSERT INTO Class VALUES('CSC203A', 'F105','MTHF12', 'M110');
INSERT INTO Class VALUES('HST205A', 'F115','MWF11', 'H221');
INSERT INTO Class VALUES('MTH101B', 'F110','MTUTH9', 'H225');
INSERT INTO Class VALUES('MTH103C', 'F110','MWF11', 'H225');

CREATE TABLE Enroll (
    stuId CHAR(5) NOT NULL,
    classNumber CHAR(10) NOT NULL,
    grade CHAR(2) NULL,
    FOREIGN KEY (stuId) REFERENCES Student(stuId) );

INSERT INTO Enroll VALUES('S1001', 'ART103A','A');
INSERT INTO Enroll VALUES('S1001', 'HST205A','C');
INSERT INTO Enroll VALUES('S1002', 'ART103A','D');
INSERT INTO Enroll VALUES('S1002', 'CSC201A','F');
INSERT INTO Enroll VALUES('S1002', 'MTH103C','B');
INSERT INTO Enroll VALUES('S1010', 'ART103A', NULL);
INSERT INTO Enroll VALUES('S1010', 'MTH103C', NULL);
INSERT INTO Enroll VALUES('S1020', 'CSC201A','B');
INSERT INTO Enroll VALUES('S1020', 'MTH101B','A');
