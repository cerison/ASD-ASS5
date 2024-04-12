CREATE DATABASE ADSDB;

CREATE TABLE Address (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE Appointment (
    id INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL
);

CREATE TABLE Dentist (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    app_id INT,
    FOREIGN KEY (app_id) REFERENCES Appointment(id)
);

CREATE TABLE Patient (
    id INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
	add_id INT,
    app_id INT,
    FOREIGN KEY (app_id) REFERENCES Appointment(id),
	FOREIGN KEY (add_id) REFERENCES Address(id)
);

CREATE TABLE Surgery (
    id INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
	name VARCHAR(50) NOT NULL,
	add_id INT,
    app_id INT,
    FOREIGN KEY (app_id) REFERENCES Appointment(id),
	FOREIGN KEY (add_id) REFERENCES Address(id)
);

INSERT INTO Address (location) VALUES ('Maple');
INSERT INTO Address (location) VALUES ('Oak');
INSERT INTO Address (location) VALUES ('Pine');
INSERT INTO Address (location) VALUES ('Birch');

INSERT INTO Appointment (date, time) VALUES ('2024-05-01', '09:00');
INSERT INTO Appointment (date, time) VALUES ('2024-05-02', '10:00');
INSERT INTO Appointment (date, time) VALUES ('2024-05-03', '11:00');
INSERT INTO Appointment (date, time) VALUES ('2024-05-04', '08:00');

INSERT INTO Dentist (fname, lname, app_id, app_id) VALUES ('John', 'Doe', 4);
INSERT INTO Dentist (fname, lname, app_id) VALUES ('Jane', 'Smith', 3);
INSERT INTO Dentist (fname, lname, app_id) VALUES ('Emily', 'Jones', 2);
INSERT INTO Dentist (fname, lname, app_id) VALUES ('Chris', 'Brown', 1);

INSERT INTO Patient (fname, lname, app_id, add_id) VALUES ('Alice', 'White', 1,3);
INSERT INTO Patient (fname, lname, app_id, add_id) VALUES ('Bob', 'Green', 3,4);
INSERT INTO Patient (fname, lname, app_id, add_id) VALUES ('Charlie', 'Black', 3,1);
INSERT INTO Patient (fname, lname, app_id, add_id) VALUES ('Diana', 'Blue', 4,2);

INSERT INTO Surgery (name, app_id, add_id) VALUES ("Spinal",1, 1);
INSERT INTO Surgery (name, app_id, add_id) VALUES ("Brain",2, 2);
INSERT INTO Surgery (name, app_id, add_id) VALUES ("Dental",3, 3);
INSERT INTO Surgery (name, app_id, add_id) VALUES ("Heart",4, 4);
