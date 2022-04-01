/*a.*/
CREATE TABLE InsuranceCo(
    name VARCHAR(100) PRIMARY KEY,
    phone INT,
    maxLiability REAL
)

CRAETE TABLE Person(
    ssn INR PRIMARY KEY,
    name VARCHAR(100)
)

CREATE TABLE Driver(
    ssn INT PRIMARY KEY,
    diverID INT,
    FOREIGN KEY(ssn) REFERENCES Person(ssn),
)

CREATE TABLE NonProfessionalDriver(
    ssn INT PRIMARY KEY,
    FOREIGN KEY(ssn) REFERENCES Driver(ssn),
)

CREATE TABLE ProfessionalDriver(
    ssn INT PRIMARY KEY,
    medicalHistory VARCHAR(100),
    FOREIGN KEY(ssn) REFERENCES Driver(ssn),
)

CREATE TABLE Vehicle(
    licensePlate VARCHAR(100) PRIMARY KEY,
    year INT,
    insuranceCo_name VARCHAR(100),
    ssn INT,
    maxLiability REAL,
    FOREIGN KEY(insuranceCo_name) REFERENCES InsuranceCo(name),
    FOREIGN KEY(ssn) REFERENCES Person(ssn)
)

CREATE TABLE Car(
    licensePlate VARCHAR(100) PRIMARY KEY,
    make VARCHAR(100),
    FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
)

CREATE TABLE Drives(
    licensePlate VARCHAR(100),
    ssn INT,
    PRIMARY KEY(licensePlate, ssn),
    FOREIGN KEY(licensePlate) REFERENCES Car(licensePlate),
    FOREIGN KEY(ssn) REFERENCES NonProfessionalDriver(ssn)
)

CREATE TABLE Truck(
    licensePlate VARCHAR(100) PRIMARY KEY,
    capacity INT,
    ssn INT,
    FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate),
    FOREIGN KEY(ssn) REFERENCES ProfessionalDriver(ssn)
)

/*b
The relationship "insures" between "Vehicle" and "InsuranceCo" is
"many to one" relation. And this relation is represented as foregin
key from "Vehicle" and "InsuranceCo". In the E/R diagram, there's arrow from 
"Vehicle" to "InsuranceCo", that is one insurance company can can
insure many vehicles, but one vehicle can be related to only one
insurance company.

c.
The "drives" relation has its own table containing pairs of car and 
its driver, but the "operations" relation is included in the table 
of "Truck" with referance to "ProfessionalDiver".
And the reason why these to relations are different is that "Drives"
is a "many to many" relateion, which require a seperate table,
 but the "Operates" is a "many to one" relation.