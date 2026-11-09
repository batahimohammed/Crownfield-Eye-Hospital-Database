
--procedure
DELIMITER //
CREATE PROCEDURE GetPatientAppointments(IN p_LastName VARCHAR(50))
BEGIN
    SELECT p.FirstName, p.LastName, a.AppointmentDate, a.AppointmentTime
    FROM Patients p
    JOIN Appointments a ON p.PatientID = a.PatientID
    WHERE p.LastName = p_LastName;
END //
DELIMITER ;
-- Call it:
CALL GetPatientAppointments('Yusuf');


--trigger
DELIMITER //
CREATE TRIGGER Before_FollowUp_Insert
BEFORE INSERT ON FollowUpPlans
FOR EACH ROW
BEGIN
    IF NEW.Status IS NULL OR NEW.Status = '' THEN
        SET NEW.Status = 'Pending';
    END IF;
END //
DELIMITER ;