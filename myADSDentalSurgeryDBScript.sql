CREATE TABLE Address (
    id INT PRIMARY KEY NOT NULL,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE Dentist (
    id INT PRIMARY KEY NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL
);

CREATE TABLE Patient (
    id INT PRIMARY KEY NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    addressId INT,
    FOREIGN KEY (addressId) REFERENCES Address(id)
);

CREATE TABLE Appointment (
    id INT PRIMARY KEY NOT NULL,
    dentistId INT NOT NULL,
    patientId INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    FOREIGN KEY (dentistId) REFERENCES Dentist(id),
    FOREIGN KEY (patientId) REFERENCES Patient(id)
);

ALTER TABLE Dentist ADD COLUMN appointmentId INT, ADD FOREIGN KEY (appointmentId) REFERENCES Appointment(id);
ALTER TABLE Patient ADD COLUMN appointmentId INT, ADD FOREIGN KEY (appointmentId) REFERENCES Appointment(id);

CREATE TABLE Surgery (
    id INT PRIMARY KEY NOT NULL,
    addressId INT NOT NULL,
    appointmentId INT NOT NULL,
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id),
    FOREIGN KEY (addressId) REFERENCES Address(id)
);


INSERT INTO Address (id, location) VALUES (1, '1234 Maple St');
INSERT INTO Address (id, location) VALUES (2, '5678 Oak St');
INSERT INTO Address (id, location) VALUES (3, '9101 Pine St');
INSERT INTO Address (id, location) VALUES (4, '2345 Birch St');

INSERT INTO Dentist (id, fname, lname) VALUES (1, 'John', 'Doe');
INSERT INTO Dentist (id, fname, lname) VALUES (2, 'Jane', 'Smith');
INSERT INTO Dentist (id, fname, lname) VALUES (3, 'Emily', 'Jones');
INSERT INTO Dentist (id, fname, lname) VALUES (4, 'Chris', 'Brown');

INSERT INTO Patient (id, fname, lname, addressId) VALUES (1, 'Alice', 'White', 1);
INSERT INTO Patient (id, fname, lname, addressId) VALUES (2, 'Bob', 'Green', 2);
INSERT INTO Patient (id, fname, lname, addressId) VALUES (3, 'Charlie', 'Black', 3);
INSERT INTO Patient (id, fname, lname, addressId) VALUES (4, 'Diana', 'Blue', 4);

INSERT INTO Appointment (id, dentistId, patientId, date, time) VALUES (1, 1, 1, '2024-05-01', '09:00');
INSERT INTO Appointment (id, dentistId, patientId, date, time) VALUES (2, 2, 2, '2024-05-02', '10:00');
INSERT INTO Appointment (id, dentistId, patientId, date, time) VALUES (3, 3, 3, '2024-05-03', '11:00');
INSERT INTO Appointment (id, dentistId, patientId, date, time) VALUES (4, 4, 4, '2024-05-04', '08:00');

INSERT INTO Surgery (id, addressId, appointmentId) VALUES (1, 1, 1);
INSERT INTO Surgery (id, addressId, appointmentId) VALUES (2, 2, 2);
INSERT INTO Surgery (id, addressId, appointmentId) VALUES (3, 3, 3);
INSERT INTO Surgery (id, addressId, appointmentId) VALUES (4, 4, 4);
