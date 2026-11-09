--aggregate query
SELECT c.ClinicianName, COUNT(a.AppointmentID) AS TotalAppointments
FROM Clinicians c
JOIN Appointments a ON c.ClinicianID = a.ClinicianID
GROUP BY c.ClinicianName
HAVING COUNT(a.AppointmentID) > 1;

--inner join
SELECT p.FirstName, p.LastName, c.ClinicianName, cl.Location, a.AppointmentDate
FROM Appointments a
INNER JOIN Patients p ON a.PatientID = p.PatientID
INNER JOIN Clinicians c ON a.ClinicianID = c.ClinicianID
INNER JOIN Clinics cl ON a.ClinicID = cl.ClinicID;

--left JOIN
SELECT a.AppointmentID, a.AppointmentDate, f.DueDate, f.Priority
FROM Appointments a
LEFT JOIN FollowUpPlans f ON a.AppointmentID = f.AppointmentID;

--subquery
SELECT FirstName, LastName
FROM Patients
WHERE PatientID IN (SELECT PatientID
FROM Appointments
WHERE ClinicianID =
(SELECT ClinicianID FROM Clinicians WHERE ClinicianName = 'Dr Maya Shah'));