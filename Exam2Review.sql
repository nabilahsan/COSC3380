create table Student(
stuId CHAR(5) not null,
lastName CHAR(15),
firstName CHAR(15),
major CHAR(15),
credits NUMBER(3),
PRIMARY KEY (stuId)
);

--Insert data

insert into Student values('S1001', 'Smith', 'Tom', 'History', '90');
insert into Student values('S1002', 'Chin', 'Ann', 'Math', '36');
insert into Student values('S1005', 'Lee', 'Perry', 'History', '3');
insert into Student values('S1010', 'Burns', 'Edward', 'Art', '63');
insert into Student values('S1013', 'McCarthy', 'Owen', 'Math', '8');
insert into Student values('S1015', 'Jones', 'Mary', 'Math', '42');
insert into Student values('S1020', 'Rivera', 'Jane', 'CSC', '15');
--

create table Faculty(
facId char(5) not null,
name char(15),
department char(15),
faculRank char(25),
PRIMARY KEY (facId)
);
--

insert into Faculty values('F101','Adams', 'Art', 'Professor');
insert into Faculty values('F105','Tanaka', 'CSC', 'Instructor');
insert into Faculty values('F110','Byrne', 'Math', 'Assistant');
insert into Faculty values('F115','Smith', 'History', 'Associate');
insert into Faculty values('F221','Smith', 'CSC', 'Professor');
--

create table Classes(
classNumber char(10) not null,
facId char(5) not null,
schedule char(10),
room char(10),
PRIMARY KEY(classNumber, facId),
FOREIGN KEY (facId) REFERENCES Faculty(facId)
);

insert into Classes values('ART103A', 'F101','MWF9', 'H221');
insert into Classes values('CSC201A', 'F105','TUTHF10', 'M110');
insert into Classes values('CSC203A', 'F105','MTHF12', 'M110');
insert into Classes values('HST205A', 'F115','MWF11', 'H221');
insert into Classes values('MTH101B', 'F110','MTUTH9', 'H225');
insert into Classes values('MTH103C', 'F110','MWF11', 'H225');
--


create table Enroll(
stuId CHAR(5) not null,
classNumber char(10) not null,
grade char(2) null,
PRIMARY KEY(stuId, classNumber),
FOREIGN KEY (stuId) REFERENCES Student(stuId) 
);

insert into Enroll values('S1001', 'ART103A','A');
insert into Enroll values('S1001', 'HST205A','C');
insert into Enroll values('S1002', 'ART103A','D');
insert into Enroll values('S1002', 'CSC201A','F');
insert into Enroll values('S1002', 'MTH103C','B');
insert into Enroll values('S1010', 'ART103A', null);
insert into Enroll values('S1010', 'MTH103C', null);
insert into Enroll values('S1020', 'CSC201A','B');
insert into Enroll values('S1020', 'MTH101B','A');
--

--Question 1
select facId, name
from Faculty
order by name;

--Question 5
