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
    patient_id INT,
    PRIMARY KEY(doctor_id, patient_id)
);

ALTER TABLE doctor_has_patient
ADD CONSTRAINT fk_doctor_has_patient_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id);

ALTER TABLE doctor_has_patient
ADD CONSTRAINT fk_doctor_has_patient_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id);


CREATE TABLE test (
    test_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    testName VARCHAR(50) NOT NULL,
    testDate DATE NOT NULL,
    cost INT NOT NULL,
    patient_id INT NOT NULL
);

ALTER TABLE test
ADD CONSTRAINT fk_test_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id);


CREATE TABLE appointment (
    appointment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    startTime DATETIME NOT NULL,
    endTime DATETIME NOT NULL
);

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id);

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id);


CREATE TABLE diagnosis (
    diagnosis_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    diagnosisName VARCHAR(100) NOT NULL,
    diagnosisDescription VARCHAR(255) NOT NULL
);

ALTER TABLE diagnosis
ADD CONSTRAINT fk_diagnosis_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id);

ALTER TABLE diagnosis
ADD CONSTRAINT fk_diagnosis_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id);


CREATE TABLE treatment (
    treatment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    doctor_id INT NOT NULL ,
    patient_id INT NOT NULL ,
    diagnosis_id INT NOT NULL ,
    treatmentTool VARCHAR(100) NOT NULL,
    careType ENUM('inpatient', 'outpatient') NOT NULL
);

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_doctor_id
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id);

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id);

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_diagnosis_id
FOREIGN KEY(diagnosis_id) REFERENCES diagnosis(diagnosis_id);


-- INSERT VALUES INTO TABLES
INSERT INTO department(departmentName, departmentHead)
VALUES
('neurology', 'Winifred Curtis'),
('cardiology', 'Osama Zimmerman'),
('otolaryngology', 'Davey Beard'),
('gastroenterology', 'Lena Mckay'),
('urology', 'Marcia Robbins');


INSERT INTO doctor(firstname, lastname, dateOfBirth, gender, phoneNumber, speciality, department_id)
VALUES
('Ella', 'Field', '1964-12-13', 'F', '(991) 350-0765', 'child neurology', 1),
('Frankie', 'Cousins', '1977-11-11', 'M', '(224) 694-4712', 'intervention neuroradiology', 1),
('Tristan', 'Horton', '1987-07-27', 'M', '(427) 601-7008', 'endourology', 5),
('Robson', 'Mann', '1986-11-16', 'M', '(755) 788-0012', 'interventional cardiologist', 2),
('Ray', 'Newman', '1970-07-17', 'F', '(841) 966-6250', 'neurotology', 3),
('Kloe', 'Berry', '1977-03-03', 'F', '(473) 908-4622', 'urologic surgery', 5),
('Zayan', 'Penn', '1985-05-30', 'M', '(264) 489-3479', 'laryngology', 3),
('Haiden', 'Sellers', '1991-12-20', 'M', '(571) 817-7814', 'general gastroenterology', 4),
('Leslie', 'Crane', '1965-10-04', 'M', '(322) 315-6709', 'geriatric neurology', 1),
('Tania', 'Parkinson', '1983-11-24', 'F', '(909) 333-7554', 'echocardiologist', 2),
('Dylan', 'Cotton', '1966-02-16', 'M', '(244) 441-5750', 'pediatric otolaryngology', 3),
('Jeevan', 'Alvarez', '1973-04-25', 'F', '(251) 694-7141', 'general gastroenterology', 4),
('Anis', 'Miller', '1987-12-23', 'F', '(796) 731-7004', 'pediatric cardiologist', 2),
('Sydney', 'Lovell', '1994-11-26', 'F', '(997) 972-6482', 'general gastroenterology', 4),
('Arlo', 'Navarro', '1973-01-28', 'M', '(275) 637-1130', 'pediatric urology', 5);


INSERT INTO patient(firstname, lastname, dateOfBirth, gender, phoneNumber)
VALUES
('Yasemin', 'Ford', '1965-09-30', 'F', '(607) 529-3237'),
('Ishika', 'Cortes', '1953-05-16', 'F', '(924) 909-0978'),
('Thiago', 'Humphreys', '1999-11-21', 'M', '(235) 963-7022'),
('Mayur', 'Rooney', '1983-02-15', 'M', '(504) 391-4910'),
('Sanaa', 'Seymour', '1993-09-19', 'F', '(840) 969-1143'),
('Kier', 'Horn', '2006-10-14', 'F', '(454) 400-3279'),
('Dewi', 'Fleming', '2009-01-17', 'M', '(454) 400-3279'),
('Cairo', 'Velasquez', '1967-10-01', 'M', '(516) 820-9165'),
('Mackenzie', 'Leal', '1975-04-05', 'F', '(728) 443-6114'),
('Ivie', 'Sinclair', '1999-12-29', 'F', '(588) 765-0338'),
('Horace', 'Horn', '2000-05-16', 'M', '(481) 420-8923'),
('Charlene', 'Clay', '1984-06-11', 'F', '(498) 860-8429'),
('Jae', 'Browning', '1995-05-11', 'M', '(907) 716-7689'),
('Nahla', 'Monaghan', '1984-12-22', 'F', '(936) 378-3920'),
('Leroy', 'Gibbs', '1989-10-22', 'M', '(956) 863-1717'),
('Lyndon', 'Heaton', '2002-12-07', 'M', '(211) 380-5526'),
('Oakley', 'Weeks', '1990-05-22', 'M', '(291) 971-3674'),
('Tiegan', 'Miles', '2000-01-18', 'F', '(974) 630-9997'),
('Cristina', 'Mccaffrey', '1977-11-11', 'F', '(398) 613-0231'),
('Geoffrey', 'Hood', '1977-01-09', 'F', '(740) 869-5299'),
('Tyla', 'Almond', '1998-07-03', 'F', '(888) 548-4072'),
('Akeem', 'Thompson', '1965-02-26', 'M', '(222) 712-4036'),
('Greyson', 'Magana', '1983-11-01', 'M', '(357) 423-7647'),
('Klaudia', 'Cote', '2008-07-29', 'F', '(866) 629-1355'),
('Caio', 'Smith', '2008-01-21', 'M', '(475) 273-7363'),
('Nellie', 'Boone', '2016-09-07', 'F', '(587) 636-1132'),
('Johnnie', 'Whitfield', '1980-05-13', 'M', '(278) 964-8018'),
('Laiba', 'Chapman', '1987-06-20', 'F', '(390) 751-7541'),
('Zain', 'Mclaughlin', '2007-12-05', 'M', '(343) 333-6088'),
('Darien', 'Whiteley', '2009-03-31', 'M', '(274) 651-7503');


INSERT INTO doctor_has_patient(doctor_id, patient_id)
VALUES
(1, 6),
(1, 7),
(2, 9),
(2, 10),
(3, 15),
(3, 16),
(4, 20),
(4, 21),
(5, 27),
(5, 28),
(6, 13),
(6, 14),
(7, 1),
(7, 2),
(8, 5),
(8, 8),
(9, 3),
(9, 4),
(10, 11),
(10, 12),
(11, 24),
(11, 23),
(12, 17),
(12, 18),
(13, 25),
(13, 26),
(14, 19),
(14, 22),
(15, 29),
(15, 30);


INSERT INTO test(testName, testDate, cost, patient_id)
VALUES
('MRI scan', '2021-10-02', 400, 6),
('CT scan', '2021-11-21', 1500, 7),
('MRI scan', '2021-11-19', 400, 9),
('CT scan', '2021-11-25', 1500, 10),
('ureteroscopy', '2021-10-28', 2645, 15),
('blood test', '2021-10-01', 432, 16),
('electrocardiogram', '2021-11-12', 76, 20),
('echocardiogram', '2021-10-07', 2000, 21),
('ENT examination', '2021-11-11', 144, 27),
('audiometric testing', '2021-09-24', 500, 28),
('ureteroscopy', '2021-11-02', 2645, 13),
('blood test', '2021-11-15', 432, 14),
('ENT examination', '2021-10-25', 144, 1),
('audiometric testing', '2021-09-24', 500, 2),
('colonoscopy', '2021-09-04', 2750, 5),
('pancreas scan', '2021-10-20', 325, 8),
('MRI scan', '2021-09-15', 400, 3),
('CT scan', '2021-11-25', 1500, 4),
('electrocardiogram', '2021-11-20', 76, 11),
('echocardiogram', '2021-10-11', 2000, 12),
('ENT examination', '2021-10-12', 144, 24),
('audiometric testing', '2021-09-01', 500, 23),
('colonoscopy', '2021-10-29', 2750, 17),
('pancreas scan', '2021-11-27', 325, 18),
('electrocardiogram', '2021-11-18', 76, 25),
('echocardiogram', '2021-11-20', 76, 26),
('colonoscopy', '2021-09-02', 2750, 19),
('pancreas scan', '2021-11-24', 325, 22),
('ureteroscopy', '2021-11-04', 2645, 29),
('blood test', '2021-10-20', 432, 30);


INSERT INTO appointment(doctor_id, patient_id, startTime, endTime)
VALUES
(1, 6, '2021-09-19 16:20:00', '2021-09-19 16:50:00'),
(1, 7, '2021-11-08 14:45:00', '2021-11-08 15:20:00'),
(2, 9, '2021-10-25 12:02:00', '2021-10-25 12:45:00'),
(2, 10, '2021-10-20 11:00:00', '2021-10-20 11:35:00'),
(3, 15, '2021-10-09 14:40:00', '2021-10-09 15:25:00'),
(3, 16, '2021-11-23 11:25:00', '2021-11-23 12:00:00'),
(4, 20, '2021-10-12 11:55:00', '2021-10-12 12:15:00'),
(4, 21, '2021-11-16 09:35:00', '2021-11-16 10:00:00'),
(5, 27, '2021-09-08 14:20:00', '2021-09-08 15:00:00'),
(5, 28, '2021-09-23 10:40:00', '2021-09-23 11:05:00'),
(6, 13, '2021-09-28 14:35:00', '2021-09-28 15:00:00'),
(6, 14, '2021-11-11 10:25:00', '2021-11-11 10:55:00'),
(7, 1, '2021-11-28 15:10:00', '2021-11-28 15:35:00'),
(7, 2, '2021-11-06 09:45:00', '2021-11-06 10:20:00'),
(8, 5, '2021-10-16 16:50:00', '2021-10-16 17:20:00'),
(8, 8, '2021-10-01 10:35:00', '2021-10-01 11:00:00'),
(9, 3, '2021-09-02 09:25:00', '2021-09-02 10:00:00'),
(9, 4, '2021-09-19 14:10:00', '2021-09-19 14:35:00'),
(10, 11, '2021-11-08 17:15:00', '2021-11-08 17:40:00'),
(10, 12, '2021-10-25 16:30:00', '2021-10-25 17:00:00'),
(11, 24, '2021-10-20 15:25:00', '2021-10-20 16:00:00'),
(11, 23, '2021-10-09 10:25:00', '2021-10-09 11:25:00'),
(12, 17, '2021-11-23 11:10:00', '2021-11-23 11:35:00'),
(12, 18, '2021-10-12 11:25:00', '2021-10-12 11:45:00'),
(13, 25, '2021-11-16 12:35:00', '2021-11-16 12:55:00'),
(13, 26, '2021-09-08 15:50:00', '2021-09-08 16:20:00'),
(14, 19, '2021-09-23 10:25:00', '2021-09-23 11:05:00'),
(14, 22, '2021-09-28 14:40:00', '2021-09-28 15:15:00'),
(15, 29, '2021-11-11 15:25:00', '2021-11-11 16:00:00'),
(15, 30, '2021-11-28 14:05:00', '2021-11-28 14:45:00');


INSERT INTO diagnosis(doctor_id, patient_id, diagnosisName, diagnosisDescription)
VALUES
(1, 6, 'migraine', 'a headache that can cause severe throbbing pain or a pulsing sensation'),
(1, 7, 'seizure', 'a sudden, uncontrolled electrical disturbance in the brain'),
(2, 9, 'meningitis', 'an inflammation of the protective membranes covering the brain and spinal cord'),
(2, 10, 'migraine', 'a headache that can cause severe throbbing pain or a pulsing sensation'),
(3, 15, 'stone disease', 'a crystal concretion formed usually within the kidneys'),
(3, 16, 'stone disease', 'a crystal concretion formed usually within the kidneys'),
(4, 20, 'arrhythmias', 'a problem with the rate or rhythm of heartbeat'),
(4, 21, 'high blood pressure', 'blood pressure that is higher than normal'),
(5, 27, 'dizziness', ' feeling faint, woozy, weak or unsteady'),
(5, 28, 'cholesteatoma', 'an abnormal collection of skin cells deep inside ear'),
(6, 13, 'stones', 'a crystal concretion formed usually within the kidneys'),
(6, 14, 'cancer', ' cancer that begins in the kidneys'),
(7, 1, 'dizziness', ' feeling faint, woozy, weak or unsteady'),
(7, 2, 'cholesteatoma', 'an abnormal collection of skin cells deep ear'),
(8, 5, 'celiac disease', 'immune system attacks own tissues while eating gluten'),
(8, 8, 'GERD', 'gastroesophageal reflux disease'),
(9, 3, 'stroke', 'elder’s brain cells do not get enough supply of oxygen and nutrients'),
(9, 4, 'Parkinsons disease', 'a brain disorder that leads to shaking, stiffness, and difficulty with walking, balance, and coordination'),
(10, 11, 'arrhythmias', 'a problem with the rate or rhythm of heartbeat'),
(10, 12, 'cardiomyopathy', 'the walls of the heart chambers have become stretched, thickened or stiff'),
(11, 24, 'sleep apnea', 'breathing repeatedly stops and starts'),
(11, 23, 'tongue-tie', 'an unusually short, thick or tight band of tissue'),
(12, 17, 'GERD', 'gastroesophageal reflux disease'),
(12, 18, 'celiac disease', 'immune system attacks own tissues while eating gluten'),
(13, 25, 'mitral stenosis', 'a narrowing of the heart''s mitral valve'),
(13, 26, 'arrhythmias', 'a problem with the rate or rhythm of heartbeat'),
(14, 19, 'gastritis', 'inflammation of the lining of the stomach'),
(14, 22, 'gastroenteritis', 'stomach flu'),
(15, 29, 'pyelonephritis', 'a type of urinary tract infection'),
(15, 30, 'ectopic kidney', 'a birth defect in which a kidney is located in an abnormal position');


INSERT INTO treatment(doctor_id, patient_id, diagnosis_id, treatmentTool, careType)
VALUES
(1, 6, 1, 'sumatriptan pills', 'outpatient'),
(1, 7, 2, 'anti-epileptic drugs', 'outpatient'),
(2, 9, 3, 'intravenous antibiotics', 'outpatient'),
(2, 10, 4, 'sumatriptan pills', 'outpatient'),
(3, 15, 5, 'surgery', 'inpatient'),
(3, 16, 6, 'surgery', 'inpatient'),
(4, 20, 7, 'cardioversion therapy', 'inpatient'),
(4, 21, 8, 'diuretics', 'outpatient'),
(5, 27, 9, 'water pills', 'outpatient'),
(5, 28, 10, 'surgery', 'inpatient'),
(6, 13, 11, 'surgery', 'inpatient'),
(6, 14, 12, 'immunotherapy', 'outpatient'),
(7, 1, 13, 'water pills', 'outpatient'),
(7, 2, 14, 'surgery', 'inpatient'),
(8, 5, 15, 'gluten-free diet', 'outpatient'),
(8, 8, 16, 'antacids', 'outpatient'),
(9, 3, 17, 'alteplase', 'inpatient'),
(9, 4, 18, 'levodopa', 'inpatient'),
(10, 11, 19, 'surgery', 'inpatient'),
(10, 12, 20, 'pacemakers and defibrillators', 'inpatient'),
(11, 24, 21, 'CPAP machine', 'inpatient'),
(11, 23, 22, 'surgery', 'inpatient'),
(12, 17, 23, 'antacids', 'outpatient'),
(12, 18, 24, 'gluten-free diet', 'outpatient'),
(13, 25, 25, 'anticoagulants', 'outpatient'),
(13, 26, 26, 'surgery', 'inpatient'),
(14, 19, 27, 'antibiotic medications', 'outpatient'),
(14, 22, 28, 'drink plenty of liquid every', 'outpatient'),
(15, 29, 29, 'antibiotic therapy', 'outpatient'),
(15, 30, 30, 'surgery', 'inpatient');

-- CREATE QUERIES (3)
-- Show departmentname, departmentHead, group doctors
SELECT department.departmentName, department.departmentHead, GROUP_CONCAT(CONCAT_WS(', ', doctor.firstname, doctor.lastname) SEPARATOR '; ') AS 'Doctors'
FROM department, doctor
WHERE department.department_id = doctor.department_id
GROUP BY doctor.department_id;

-- Show doctorname, patientname, diagnosis
SELECT CONCAT_WS(', ', doctor.firstname, doctor.lastname) AS 'Doctor',
       CONCAT_WS(', ', patient.firstname, patient.lastname) AS 'Patient',
       diagnosis.diagnosisName AS 'Diagnosis'
FROM doctor, patient, diagnosis
WHERE diagnosis.doctor_id = doctor.doctor_id AND diagnosis.patient_id = patient.patient_id;

-- Show patientName, testName, testDate
SELECT CONCAT_WS(', ', patient.firstname, patient.lastname) AS 'Patient', test.testName AS 'Test', test.testDate AS 'Date and time'
FROM patient, test
WHERE test.patient_id = patient.patient_id;


-- CREATE PROCEDURES (2)
DELIMITER //
CREATE PROCEDURE GetPatientInfoByDepartment(
    IN deptName VARCHAR(255)
)
BEGIN
    SELECT CONCAT_WS(', ', doctor.firstname, doctor.lastname) AS 'Doctor',
           GROUP_CONCAT(CONCAT_WS(', ', patient.firstname, patient.lastname) SEPARATOR '; ') AS 'Patients'
    FROM department, doctor, patient, doctor_has_patient
    WHERE department.departmentName = deptName
    AND
          doctor.department_id = department.department_id
    AND doctor_has_patient.doctor_id = doctor.doctor_id
    AND doctor_has_patient.patient_id = patient.patient_id
    GROUP BY doctor.doctor_id;
END //
DELIMITER ;

-- CALL GetPatientInfoByDepartment('neurology');
-- CALL GetPatientInfoByDepartment('cardiology');


DELIMITER //
CREATE PROCEDURE GetPatientInfoByTest(
    IN tName VARCHAR(255)
)
BEGIN
    SELECT patient.patient_id AS 'Patient ID',
           CONCAT_WS(', ', patient.firstname, patient.lastname) AS 'Name, surname',
           test.testDate AS 'Date'
    FROM patient, test
    WHERE test.testName = tName
    AND
          test.patient_id = patient.patient_id;
END //
DELIMITER ;

-- CALL GetPatientInfoByTest('blood test');
-- CALL GetPatientInfoByTest('ENT examination');


-- CREATE FUNCTIONS (2)
DELIMITER //
CREATE FUNCTION PatientCategoryForAge(
    dateOfBirth DATE
)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE ageCategory VARCHAR(50);
    IF TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) >= 18 THEN
    SET ageCategory = 'adult';
    ELSEIF TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) < 18 THEN
    SET ageCategory = 'child';
    END IF;
RETURN (ageCategory);
END //
DELIMITER ;

SELECT CONCAT_WS(', ', doctor.firstname, doctor.lastname) AS 'Doctor',
       CONCAT_WS(', ', patient.firstname, patient.lastname) AS 'Patient',
       PatientCategoryForAge(patient.dateOfBirth) AS 'Age category'
FROM doctor, patient, doctor_has_patient
WHERE doctor_has_patient.doctor_id = doctor.doctor_id
    AND doctor_has_patient.patient_id = patient.patient_id;


DELIMITER //
CREATE FUNCTION AppointmentDuration(
    startTime DATETIME,
    endTime DATETIME
)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE duration INT;
    SET duration = TIMESTAMPDIFF(MINUTE , startTime, endTime);
RETURN (duration);
END //
DELIMITER ;

SELECT CONCAT_WS(', ', doctor.firstname, doctor.lastname) AS 'Doctor',
       CONCAT_WS(', ', patient.firstname, patient.lastname) AS 'Patient',
       AppointmentDuration(appointment.startTime, appointment.endTime) AS 'Duration (with minutes)'
FROM doctor, patient, appointment
WHERE appointment.doctor_id = doctor.doctor_id AND appointment.patient_id = patient.patient_id;


-- CREATE TRIGGERS (2)
DROP TABLE IF EXISTS departmentChanges;

CREATE TABLE departmentChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departmentName VARCHAR(50),
    formerHead VARCHAR(50),
    currentHead VARCHAR(50),
    changeDate DATE
);

DELIMITER //
CREATE TRIGGER after_department_update
    AFTER UPDATE
    ON department FOR EACH ROW
BEGIN
    IF OLD.departmentHead <> NEW.departmentHead THEN
        INSERT INTO departmentChanges(departmentName, formerHead, currentHead, changeDate)
            VALUES (OLD.departmentName, OLD.departmentHead, NEW.departmentHead, CURDATE());
    END IF;
END //
DELIMITER ;

-- UPDATE department
-- SET departmentHead = 'Alexandria Clark'
-- WHERE department_id = 3;


DROP TABLE IF EXISTS appointmentArchives;

CREATE TABLE appointmentArchives (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    doctor_id INT,
    patient_id INT,
    startTime DATETIME,
    endTime DATETIME,
    deletedDate DATE
);

DELIMITER //
CREATE TRIGGER before_appointment_delete
BEFORE DELETE
ON appointment FOR EACH ROW
BEGIN
    INSERT INTO appointmentArchives(appointment_id, doctor_id, patient_id, startTime, endTime, deletedDate)
    VALUES(OLD.appointment_id, OLD.doctor_id, OLD.patient_id, OLD.startTime, OLD.endTime, CURDATE());
END //
DELIMITER ;

DELETE FROM appointment
WHERE appointment_id = 30;

