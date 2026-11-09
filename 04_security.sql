
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
