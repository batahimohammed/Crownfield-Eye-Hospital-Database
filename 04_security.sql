USE CrownfieldEyeHospital;

CREATE ROLE 'Admin', 'Doctor', 'Receptionist', 'Patient';

GRANT ALL PRIVILEGES ON CrownfieldEyeHospital.* TO 'Admin';

GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.Patients TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.Appointments TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.Diagnoses TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.Prescriptions TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.PrescriptionItems TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.FollowUpPlans TO 'Doctor';

GRANT SELECT ON CrownfieldEyeHospital.Patients TO 'Receptionist';
GRANT SELECT, INSERT, UPDATE ON CrownfieldEyeHospital.Appointments TO 'Receptionist';
GRANT SELECT ON CrownfieldEyeHospital.Clinicians TO 'Receptionist';
GRANT SELECT ON CrownfieldEyeHospital.Clinics TO 'Receptionist';

GRANT SELECT ON CrownfieldEyeHospital.Appointments TO 'Patient';
GRANT SELECT ON CrownfieldEyeHospital.Diagnoses TO 'Patient';

FLUSH PRIVILEGES;

SELECT SHA2('PatientPassword123', 256) AS HashedPassword;

PREPARE stmt FROM 'SELECT * FROM Patients WHERE PatientID = ?';
SET @id = 1;
EXECUTE stmt USING @id;
DEALLOCATE PREPARE stmt;

START TRANSACTION;
INSERT INTO Appointments (PatientID, ClinicianID, ClinicID, AppointmentDate, AppointmentTime)
VALUES (1, 1, 1, '2026-12-01', '10:00:00');
INSERT INTO Diagnoses (AppointmentID, DiagnosisDetails)
VALUES (LAST_INSERT_ID(), 'Routine check-up');
COMMIT;

START TRANSACTION;
INSERT INTO Appointments (PatientID, ClinicianID, ClinicID, AppointmentDate, AppointmentTime)
VALUES (999, 999, 999, '2026-12-01', '10:00:00'); -- This will fail (FK violation)
ROLLBACK;
