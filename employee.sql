CREATE TABLE people (
    empId SERIAL PRIMARY KEY, 
    name VARCHAR (40),
    address VARCHAR (150),
    bday DATE
);

CREATE TABLE companies (
    comId SERIAL PRIMARY KEY,
    name VARCHAR (40),
    address VARCHAR (150)
);

CREATE TABLE empHistory (
    histId SERIAL PRIMARY KEY,
    comID INTEGER REFERENCES companies (comId),
    empId INTEGER REFERENCES people (empId),
    startDate DATE,endDate DATE
);

CREATE TABLE empSalary (
    salId SERIAL PRIMARY KEY,
    histId INTEGER REFERENCES empHistory(histId),
    salary FLOAT,
    salDate DATE
);

CREATE TABLE empHierarchy (
    hierId SERIAL PRIMARY KEY,
    histId INTEGER REFERENCES empHistory(histId),
    empId INTEGER REFERENCES people(empId)
);

CREATE TABLE timeclock (
    tcId SERIAL PRIMARY KEY, login timestamp, logout timestamp, histId INTEGER REFERENCES empHistory(histId));

//PEOPLE--------------------------------------------------------------------------------------------
INSERT INTO people(name, address, bday) VALUES ('Marl', 'Cebu City', '1997-12-09');
INSERT INTO people(name, address, bday) VALUES ('Shiela', 'Apas City', '1997-07-15');
INSERT INTO people(name, address, bday) VALUES ('Rjay', 'Canduman', '1997-08-01');

INSERT INTO people(name, address, bday) VALUES ('Cath', 'Cebu City', '1997-12-09');
INSERT INTO people(name, address, bday) VALUES ('Marjun', 'Apas City', '1997-07-15');
INSERT INTO people(name, address, bday) VALUES ('Madel', 'Canduman', '1997-08-01');

INSERT INTO people(name, address, bday) VALUES ('Rey', 'Canduman', '1997-08-01');
INSERT INTO people(name, address, bday) VALUES ('Shad', 'Canduman', '1997-08-01');

//COMPANIES--------------------------------------------------------------------------------------------
INSERT INTO companies(name, address) VALUES ('Coding Avenue','Oakridge Bussines Park');

INSERT INTO companies(name, address) VALUES ('Symph','Lahug');
INSERT INTO companies(name, address) VALUES ('Headstrong Solutions','Lahug');

//EMPHISTORY--------------------------------------------------------------------------------------------
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(1,1,'2010-06-2',null);
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(1,2,'2010-06-2',null);
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(1,3,'2010-06-2',null);

INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(2,4,'2010-06-2',null);
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(2,5,'2010-06-2',null);
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(2,6,'2010-06-2',null);

INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(1,7,'2010-06-2',null);
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(2,8,'2010-06-2',null);

INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(3,7,'2008-06-2','2010-06-01');
INSERT INTO empHistory(comid,empid,startDate,endDate) VALUES(3,8,'2008-06-2','2010-06-01');



//EMPHIERARCHY-----------------------------------------------------------------------------------------
INSERT INTO empHierarchy(histId,empId) VALUES(1,7);
INSERT INTO empHierarchy(histId,empId) VALUES(2,7);
INSERT INTO empHierarchy(histId,empId) VALUES(3,7);

INSERT INTO empHierarchy(histId,empId) VALUES(4,8);
INSERT INTO empHierarchy(histId,empId) VALUES(5,8);
INSERT INTO empHierarchy(histId,empId) VALUES(6,8);

//EMPSALARY-------------------------------------------------------------------------------------------
INSERT INTO empSalary(histid,salary,salDate) VALUES(1,0,'2010-07-2');
INSERT INTO empSalary(histid,salary,salDate) VALUES(2,0,'2010-07-2');
INSERT INTO empSalary(histid,salary,salDate) VALUES(3,0,'2010-07-2');

INSERT INTO empSalary(histid,salary,salDate) VALUES(4,0,'2010-07-2');
INSERT INTO empSalary(histid,salary,salDate) VALUES(5,0,'2010-07-2');
INSERT INTO empSalary(histid,salary,salDate) VALUES(6,0,'2010-07-2');

INSERT INTO empSalary(histid,salary,salDate) VALUES(7,50000,'2010-07-2');
INSERT INTO empSalary(histid,salary,salDate) VALUES(8,50000,'2010-07-2');

INSERT INTO empSalary(histid,salary,salDate) VALUES(9,1000,'2010-07-2');
INSERT INTO empSalary(histid,salary,salDate) VALUES(10,500,'2010-07-2');

