create table Flights(FLNO int primary key, Source varchar(30), Destination varchar(30), Distance int, Departs varchar(20), Arrives varchar(20), price int);
insert into Flights values(&FLNO,'&Source','&Destination','&Distance','&Departs','&Arrives',&Price); 

create table AirCraft(Aid int primary key, Aname varchar(20), CrusingRange int); 
insert into AirCraft values(&Aid,'&AName',&CruisingRange); 

create table Employees(Eid int primary key, Ename varchar(20), Salary int); 
insert into Employees values(&Eid,'&Ename',&Salary); 

create table Certified(Eid references Employees(Eid), Aid references AirCraft(Aid)); 
insert into Certified values(&Eid,&Aid); 

select Aname from AirCraft A, Employees E, Certified C where A.Aid = C.Aid and E.Eid = C.Eid and E.Salary > 80000; 

select E.Eid, Max(CrusingRange) from Employees E, Certified C, AirCraft A where E.Eid=C.Eid and A.Aid = C.Aid group by E.Eid having count(*) >= 3; 

select A.Aname ,avg(Salary) from Employees E, Certified C , Aircraft A where C.Eid = E.Eid and A.Aid = C.Aid and A.CrusingRange>1000 group by A.Aname; 



select Ename
from Employees E, AirCraft A, Certified C
where A.Aid=C.Aid AND
E.Eid=C.Eid AND
A.CrusingRange>2000
AND C.Aid NOT IN
(Select distinct Aid from AirCraft where Aname like 'Dishan');

select Eid, Ename, Salary from Employees where salary > (select avg(salary) from Employees) and Eid not in ( select Eid from Certified); 
