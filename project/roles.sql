-- Create Roles

CREATE ROLE db_receptionist;
CREATE ROLE db_doctor;
CREATE ROLE db_lab_tech;
CREATE ROLE db_billing;
CREATE ROLE db_admin;
 
-- Permissions

GRANT SELECT, INSERT ON Patients TO db_receptionist;

GRANT SELECT, INSERT ON Appointments TO db_receptionist;
 
GRANT SELECT ON Patients TO db_doctor;

GRANT INSERT, UPDATE ON MedicalRecords TO db_doctor;

GRANT INSERT, UPDATE ON Prescriptions TO db_doctor;
 
GRANT SELECT ON LabTests TO db_lab_tech;

GRANT UPDATE ON LabTests TO db_lab_tech;
 
GRANT SELECT ON vw_BillingPatient TO db_billing;

GRANT SELECT, INSERT, UPDATE ON Billing TO db_billing;
 
GRANT CONTROL TO db_admin; 

GO