# Creation of table:

CREATE TABLE STUDENT (
  Snum int Primary Key,
  Sname varchar(20),
  Major varchar(10),
  Lev varchar(20),
  age int);


CREATE TABLE FACULTY (
  Fid int Primary Key,
  Fname varchar(20),
  Depid int);
  

CREATE TABEL CLASS (
  Cname varchar(20) Primary Key,
  Meets_at varchar(20),
  Room varchar(20),
  Fid REFERENCES FACULTY(Fid) ON DELETE SET NULL);


CREATE TABLE ENROLLED (
Snum REFERENCES STUDENT(Snum),
Cname REFERENCES CLASS(Cname));


#Queries:

SELECT DISTINCT S.Snum, S.Sname FROM STUDENT S,CLASS C, ENROLLED E,FACULTY F WHERE S.Snum =
E.Snum AND E.Cname = C.Cname AND C.Fid = F.Fid AND F.Fname = 'Rakesh' AND S.Lev = 'JR'
ORDER BY Snum;


SELECT MAX(S.age) AS Age FROM STUDENT S WHERE (S.Major = 'History') OR S.Snum IN (Select E.Snum
FROM CLASS C , ENROLLED E, FACULTY F WHERE E.cname = C.cname AND C.Fid = F.Fid AND F.Fname =
'Ravi');


SELECT DISTINCT S.Sname FROM STUDENT S where S.Snum IN (SELECT E1.Snum FROM ENROLLED E1,ENROLLED
E2, CLASS C1, CLASS C2 where E1.snum = E2.snum AND E1.cname <> E2.cname AND E1.cname =
C1.cname AND E2.cname = C2.cname AND C1.meets_at = C2.meets_at);


SELECT DISTINCT F.Fname , COUNT(*) AS CourseCount FROM CLASS C , Faculty F WHERE C.FID NOT IN
(SELECT Fid FROM CLASS WHERE Room IN (SELECT Room FROM CLASS WHERE Room!= 'R128')) AND C.Fid =
F.Fid GROUP BY F.Fname;


CREATE VIEW STUDENT_DETAILS AS 
SELECT S.SNUM, S.SNAME, S.MAJOR, S.LEV, S.AGE,
E.CNAME FROM STUDENT S, ENROLLED E WHERE S.SNUM = E.SNUM;
