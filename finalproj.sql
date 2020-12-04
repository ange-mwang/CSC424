CREATE TABLE Outlet(
    outletNum VARCHAR(100),
    address VARCHAR(100),
    phoneNum VARCHAR(100),
    faxNum VARCHAR(100),

    PRIMARY KEY(outletNum)
);
INSERT INTO Outlet VALUES('o001','1st street', '101-210-232', '101-210-232');
INSERT INTO Outlet VALUES('o002','2nd street', '101-450-280', '101-450-2801');
INSERT INTO Outlet VALUES('o003','3rd street', '101-293-5720', '101-293-5720');
INSERT INTO Outlet VALUES('o004','4th street','101-472-2139','101-472-2139');
INSERT INTO Outlet VALUES('o005','5th street','101-582-1293','101-582-1293');

SELECT *
FROM Outlet;


CREATE TABLE Vehicles(
    registrationNum VARCHAR(100),
    model VARCHAR(100),
    make VARCHAR(100),
    engineSize VARCHAR(100),
    capacity VARCHAR(100),
    currentMileage VARCHAR(100),
    dailyHireRate VARCHAR(100),
    currentLocation VARCHAR(100),

    PRIMARY KEY(registrationNum)
);

INSERT INTO Vehicles VALUES('r001','model1','toyota','3','5','0','40','Georgia');
INSERT INTO Vehicles VALUES('r002','model2','tesla','2','6','1000','100','Maryland');
INSERT INTO Vehicles VALUES('r003','model3','honda','5','4','2500','50','Mars');
INSERT INTO Vehicles VALUES('r004','model4','toyota','3','7','2000','40','Miami');
INSERT INTO Vehicles VALUES('r005','model5','toyota','5','5','100','40','DC');

SELECT *
FROM Vehicles;

CREATE TABLE Clients(
    clientNum VARCHAR(100),
    name VARCHAR(100),
    homeAddress VARCHAR(100),
    phoneNum VARCHAR(100),
    dob VARCHAR(100),
    licenseNum VARCHAR(100),

    PRIMARY KEY (clientNum)
);

INSERT INTO Clients VALUES('c001','Angela','apple corridor','293-123-5820','05-16-2000','l001');
INSERT INTO Clients VALUES('c002','Irene','pear tower','120-203-1234','03-14-1999','l002');
INSERT INTO Clients VALUES('c003','Kevin','orange stool','490-251-1958','01-28-2000','l003');
INSERT INTO Clients VALUES('c004','Liqing','apple corridor','298-192-1582','04-24-1969','l004');
INSERT INTO Clients VALUES('c005','Sabrina','corn tower','120-240-1951','05-07-2000','l005');

SELECT *
FROM Clients;


CREATE TABLE HireAgreements(
    hireNum VARCHAR(100),
    clientNum VARCHAR(100),
    name VARCHAR(100),
    homeAddress VARCHAR(100),
    phoneNum VARCHAR(100),
    startDate VARCHAR(100),
    registrationNum VARCHAR(100),
    model VARCHAR(100),
    make VARCHAR(100),
    startMileage VARCHAR(100),

    PRIMARY KEY (hireNum),
    FOREIGN KEY (clientNum) references Clients,
    FOREIGN KEY (registrationNum) references Vehicles
);

DROP TABLE HireAgreements;

INSERT INTO HireAgreements VALUES('h001','c001','Angela','apple corridor','293-123-5820','01-14-2020','r001','model1','toyota','0');
INSERT INTO HireAgreements VALUES('h002','c002','Irene','pear tower','120-203-1234','10-01-2020','r002','model2','tesla','1000');
INSERT INTO HireAgreements VALUES('h003','c003','Kevin','orange stool','490-251-1958','10-02-2020','r003','model3','honda','2500');
INSERT INTO HireAgreements VALUES('h004','c004','Liqing','apple corridor','298-192-1582','10-03-2020','r004','model4','toyota','2000');
INSERT INTO HireAgreements VALUES('h005','c005','Sabrina','corn tower','120-240-1951','10-04-2020','r005','model5','toyota','100');

SELECT *
FROM HireAgreements;

SELECT *
FROM HireAgreements
WHERE clientNum = 'c001';

CREATE TABLE Dates(
    startDate VARCHAR(100),
    endDate VARCHAR(100),

    PRIMARY KEY (startDate)
);
DROP TABLE Dates;
SELECT *
FROM Dates;

INSERT INTO Dates VALUES('01-14-2020','01-30-2020');
INSERT INTO Dates VALUES('10-01-2020','10-02-2020');
INSERT INTO Dates VALUES('10-02-2020','11-01-2020');
INSERT INTO Dates VALUES('10-03-2020','12-20-2020');
INSERT INTO Dates VALUES('10-04-2020','12-31-2020');

SELECT *
FROM HireAgreements h
INNER JOIN Dates d on h.startDate = d.startDate
WHERE d.endDate = '10-02-2020';


CREATE TABLE Mileage(
    startMileage VARCHAR(100),
    endMileage VARCHAR(100),

    PRIMARY KEY (startMileage)
);

INSERT INTO Mileage Values('0','100');
INSERT INTO Mileage Values('1000','1400');
INSERT INTO Mileage Values('2500','3500');
INSERT INTO Mileage Values('2000','2600');
INSERT INTO Mileage Values('100','200');

SELECT *
FROM MILEAGE;

SELECT *
FROM HireAgreements h
INNER JOIN Mileage m on m.startMileage = h.startMileage
WHERE m.endMileage > '100';


CREATE TABLE CarStaff(
    staffNum VARCHAR(100),
    name VARCHAR(100),
    homeAddress VARCHAR(100),
    phoneNum VARCHAR(100),
    dob VARCHAR(100),
    sex VARCHAR(100),
    hireDate VARCHAR(100),
    jobTitle VARCHAR(100),
    salary VARCHAR(100),
    outletNum VARCHAR(100),

    PRIMARY KEY (staffNum),
    FOREIGN KEY (outletNum) references Outlet
);

INSERT INTO CarStaff VALUES('s001','timmy','calico lane','120-123-1052','01-20-1975','m','05-16-2010','sales man','10000','o001');
INSERT INTO CarStaff VALUES('s002','tommy','doggy lane','130-123-1204','01-20-1987','m','05-12-2011','mechanic','5000','o001');
INSERT INTO CarStaff VALUES('s003','tammy','bird lane','104-034-1205','02-04-1987','f','07-12-2011','mechanic','5000','o001');
INSERT INTO CarStaff VALUES('s004','tina','parrot lane','120-402-5012','05-29-1999','f','10-10-2020','sales man','4000','o001');
INSERT INTO CarStaff VALUES('S005','reggie','reggiehouse','690-420-4269','01-01-2000','m','10-12-2020','mechanic','5000','o001');

SELECT *
FROM CarStaff;

SELECT *
FROM CarStaff c
JOIN Outlet o ON o.outletNum = c.outletNum
WHERE o.address = '1st street';
