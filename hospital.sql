-- CREATE DATABASE
CREATE DATABASE hospital;
USE hospital;


-- CREATE TABLES
CREATE TABLE department (
    department_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    departmentName VARCHAR(50) NOT NULL,
    departmentHead VARCHAR(50) NOT NULL
);


CREATE TABLE doctor (
    doctor_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL,
    speciality VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department_id INT
);

ALTER TABLE doctor
ADD CONSTRAINT fk_doctor_department_id
FOREIGN KEY(department_id) REFERENCES department(department_id)
ON UPDATE CASCADE ON DELETE SET NULL;


CREATE TABLE patient (
    patient_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL
);


CREATE TABLE doctor_has_patient (
    doctor_id INT,
    patient_id INT
);

ALTER TABLE doctor_has_patient
ADD CONSTRAINT fk_doctor_has_patient_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE doctor_has_patient
ADD CONSTRAINT fk_doctor_has_patient_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
ON UPDATE CASCADE ON DELETE SET NULL;


CREATE TABLE test (
    test_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    testName VARCHAR(50) NOT NULL,
    testDate DATE NOT NULL,
    cost INT NOT NULL,
    patient_id INT NOT NULL
);

ALTER TABLE test
ADD CONSTRAINT fk_test_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE appointment (
    appointment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    startTime DATETIME NOT NULL,
    endTime DATETIME NOT NULL
);

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE diagnosis (
    diagnosis_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    diagnosisName VARCHAR(100) NOT NULL ,
    diagnosisDate DATE NOT NULL
);

ALTER TABLE diagnosis
ADD CONSTRAINT fk_diagnosis_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE diagnosis
ADD CONSTRAINT fk_diagnosis_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE treatment (
    treatment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    doctor_id INT NOT NULL ,
    patient_id INT NOT NULL ,
    diagnosis_id INT NOT NULL ,
    treatmentName VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL
);

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_diagnosis_id
FOREIGN KEY(diagnosis_id) REFERENCES diagnosis(diagnosis_id)
ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE bill (
    bill_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    patient_id INT NOT NULL,
    billDate DATE NOT NULL,
    payment INT NOT NULL
);

ALTER TABLE bill
ADD CONSTRAINT fk_bill_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
ON UPDATE CASCADE ON DELETE CASCADE;

-- INSERT VALUES INTO TABLES
INSERT INTO department(department_id, departmentName, departmentHead)
VALUES ()
/*
Anesthetics
Burn Center
Cardiology
Ear nose and throat (ENT)
Gastroenterology
General surgery
Haematology
Microbiology
Nephrology
Neurology
Oncology
Ophthalmology
Orthopaedics
Physiotherapy
Radiology
Radiotherapy
Rheumatology
Urology
*/



-- CREATE QUERIES (10)
-- CREATE PROCEDURES (2)
-- CREATE FUNCTIONS (2)
-- CREATE TRIGGERS (2)
