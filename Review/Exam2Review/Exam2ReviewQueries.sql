-- Question 1
SELECT F.facId, F.name
    FROM Faculty F
        ORDER BY F.name;

-- TODO: Question 2
SELECT C.classNumber, S.lastName, S.firstName, S.major
    FROM Student S, Enroll E, Class C, Faculty F
        WHERE F.facId = 'F110' AND C.classNumber = E.classNumber AND E.stuId = S.stuId;

-- Question 3
SELECT C.classNumber
    FROM Class C
        WHERE C.facId = ( SELECT F.facId
                                FROM Faculty F
                                        WHERE
                                            F.name = 'Byrne' AND
                                            F.department = 'Math' );

-- Question 4
SELECT F.name AS FacultyName, F.facId AS FacultyID
    FROM Faculty F
        WHERE F.facId IN ( SELECT C.facId
                            FROM Class C
                                WHERE C.room = 'H221' );

-- Question 5
SELECT F.facId
    FROM Faculty F
        WHERE F.department = 'History'
UNION
SELECT C.facId
    FROM Class C
        WHERE C.room = 'H221';

-- Question 6
SELECT AVG( S.credits ) AS AverageCredits
    FROM Student S;

-- Question 7
SELECT S.major AS Major, SUM( S.credits ) AS TotalCredits
    FROM Student S
        GROUP BY S.major
        ORDER BY S.major;

-- Question 8
SELECT E.classNumber AS ClassNumber, COUNT( E.classNumber ) AS TotalStudents
    FROM Enroll E
        GROUP BY E.classNumber;

-- Question 9
SELECT * FROM Classes C
    WHERE C.classNumber LIKE 'MTH%';

-- Question 10
CREATE OR REPLACE VIEW HISTMATH ( lastName, firstName, stuId ) AS
    SELECT S.lastName, S.firstName, S.stuId
        FROM Student S
            WHERE S.major = 'History';
SELECT * FROM histmath;