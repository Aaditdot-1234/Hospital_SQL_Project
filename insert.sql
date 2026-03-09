-- INSERT INTO Patients (patient_name, email, phone_number, date_of_birth, gender, address) VALUES
-- ('John Doe', 'john.doe@example.com', '1234567890', '1980-01-01', 'Male', '123 Main St'),
-- ('Jane Smith', 'jane.smith@example.com', '0987654321', '1990-05-15', 'Female', '456 Oak Ave');

-- -- Bulk insert for 100 Patients
-- INSERT INTO Patients (patient_name, email, phone_number, date_of_birth, gender, address) VALUES
-- -- 1 to 100
-- ('Patient 1', 'patient1@example.com', '1000000001', '1980-01-01', 'Male', 'Address 1'),
-- ('Patient 2', 'patient2@example.com', '1000000002', '1980-01-02', 'Female', 'Address 2'),
-- ('Patient 3', 'patient3@example.com', '1000000003', '1980-01-03', 'Other', 'Address 3'),
-- ('Patient 4', 'patient4@example.com', '1000000004', '1980-01-04', 'Male', 'Address 4'),
-- ('Patient 5', 'patient5@example.com', '1000000005', '1980-01-05', 'Female', 'Address 5'),
-- ('Patient 6', 'patient6@example.com', '1000000006', '1980-01-06', 'Other', 'Address 6'),
-- ('Patient 7', 'patient7@example.com', '1000000007', '1980-01-07', 'Male', 'Address 7'),
-- ('Patient 8', 'patient8@example.com', '1000000008', '1980-01-08', 'Female', 'Address 8'),
-- ('Patient 9', 'patient9@example.com', '1000000009', '1980-01-09', 'Other', 'Address 9'),
-- ('Patient 10', 'patient10@example.com', '1000000010', '1980-01-10', 'Male', 'Address 10'),
-- ('Patient 11', 'patient11@example.com', '1000000011', '1980-01-11', 'Female', 'Address 11'),
-- ('Patient 12', 'patient12@example.com', '1000000012', '1980-01-12', 'Other', 'Address 12'),
-- ('Patient 13', 'patient13@example.com', '1000000013', '1980-01-13', 'Male', 'Address 13'),
-- ('Patient 14', 'patient14@example.com', '1000000014', '1980-01-14', 'Female', 'Address 14'),
-- ('Patient 15', 'patient15@example.com', '1000000015', '1980-01-15', 'Other', 'Address 15'),
-- ('Patient 16', 'patient16@example.com', '1000000016', '1980-01-16', 'Male', 'Address 16'),
-- ('Patient 17', 'patient17@example.com', '1000000017', '1980-01-17', 'Female', 'Address 17'),
-- ('Patient 18', 'patient18@example.com', '1000000018', '1980-01-18', 'Other', 'Address 18'),
-- ('Patient 19', 'patient19@example.com', '1000000019', '1980-01-19', 'Male', 'Address 19'),
-- ('Patient 20', 'patient20@example.com', '1000000020', '1980-01-20', 'Female', 'Address 20'),
-- ('Patient 21', 'patient21@example.com', '1000000021', '1980-01-21', 'Other', 'Address 21'),
-- ('Patient 22', 'patient22@example.com', '1000000022', '1980-01-22', 'Male', 'Address 22'),
-- ('Patient 23', 'patient23@example.com', '1000000023', '1980-01-23', 'Female', 'Address 23'),
-- ('Patient 24', 'patient24@example.com', '1000000024', '1980-01-24', 'Other', 'Address 24'),
-- ('Patient 25', 'patient25@example.com', '1000000025', '1980-01-25', 'Male', 'Address 25'),
-- ('Patient 26', 'patient26@example.com', '1000000026', '1980-01-26', 'Female', 'Address 26'),
-- ('Patient 27', 'patient27@example.com', '1000000027', '1980-01-27', 'Other', 'Address 27'),
-- ('Patient 28', 'patient28@example.com', '1000000028', '1980-01-28', 'Male', 'Address 28'),
-- ('Patient 29', 'patient29@example.com', '1000000029', '1980-01-29', 'Female', 'Address 29'),
-- ('Patient 30', 'patient30@example.com', '1000000030', '1980-01-30', 'Other', 'Address 30'),
-- ('Patient 31', 'patient31@example.com', '1000000031', '1980-01-31', 'Male', 'Address 31'),
-- ('Patient 32', 'patient32@example.com', '1000000032', '1980-02-01', 'Female', 'Address 32'),
-- ('Patient 33', 'patient33@example.com', '1000000033', '1980-02-02', 'Other', 'Address 33'),
-- ('Patient 34', 'patient34@example.com', '1000000034', '1980-02-03', 'Male', 'Address 34'),
-- ('Patient 35', 'patient35@example.com', '1000000035', '1980-02-04', 'Female', 'Address 35'),
-- ('Patient 36', 'patient36@example.com', '1000000036', '1980-02-05', 'Other', 'Address 36'),
-- ('Patient 37', 'patient37@example.com', '1000000037', '1980-02-06', 'Male', 'Address 37'),
-- ('Patient 38', 'patient38@example.com', '1000000038', '1980-02-07', 'Female', 'Address 38'),
-- ('Patient 39', 'patient39@example.com', '1000000039', '1980-02-08', 'Other', 'Address 39'),
-- ('Patient 40', 'patient40@example.com', '1000000040', '1980-02-09', 'Male', 'Address 40'),
-- ('Patient 41', 'patient41@example.com', '1000000041', '1980-02-10', 'Female', 'Address 41'),
-- ('Patient 42', 'patient42@example.com', '1000000042', '1980-02-11', 'Other', 'Address 42'),
-- ('Patient 43', 'patient43@example.com', '1000000043', '1980-02-12', 'Male', 'Address 43'),
-- ('Patient 44', 'patient44@example.com', '1000000044', '1980-02-13', 'Female', 'Address 44'),
-- ('Patient 45', 'patient45@example.com', '1000000045', '1980-02-14', 'Other', 'Address 45'),
-- ('Patient 46', 'patient46@example.com', '1000000046', '1980-02-15', 'Male', 'Address 46'),
-- ('Patient 47', 'patient47@example.com', '1000000047', '1980-02-16', 'Female', 'Address 47'),
-- ('Patient 48', 'patient48@example.com', '1000000048', '1980-02-17', 'Other', 'Address 48'),
-- ('Patient 49', 'patient49@example.com', '1000000049', '1980-02-18', 'Male', 'Address 49'),
-- ('Patient 50', 'patient50@example.com', '1000000050', '1980-02-19', 'Female', 'Address 50'),
-- ('Patient 51', 'patient51@example.com', '1000000051', '1980-02-20', 'Other', 'Address 51'),
-- ('Patient 52', 'patient52@example.com', '1000000052', '1980-02-21', 'Male', 'Address 52'),
-- ('Patient 53', 'patient53@example.com', '1000000053', '1980-02-22', 'Female', 'Address 53'),
-- ('Patient 54', 'patient54@example.com', '1000000054', '1980-02-23', 'Other', 'Address 54'),
-- ('Patient 55', 'patient55@example.com', '1000000055', '1980-02-24', 'Male', 'Address 55'),
-- ('Patient 56', 'patient56@example.com', '1000000056', '1980-02-25', 'Female', 'Address 56'),
-- ('Patient 57', 'patient57@example.com', '1000000057', '1980-02-26', 'Other', 'Address 57'),
-- ('Patient 58', 'patient58@example.com', '1000000058', '1980-02-27', 'Male', 'Address 58'),
-- ('Patient 59', 'patient59@example.com', '1000000059', '1980-02-28', 'Female', 'Address 59'),
-- ('Patient 60', 'patient60@example.com', '1000000060', '1980-02-29', 'Other', 'Address 60'),
-- ('Patient 61', 'patient61@example.com', '1000000061', '1980-03-01', 'Male', 'Address 61'),
-- ('Patient 62', 'patient62@example.com', '1000000062', '1980-03-02', 'Female', 'Address 62'),
-- ('Patient 63', 'patient63@example.com', '1000000063', '1980-03-03', 'Other', 'Address 63'),
-- ('Patient 64', 'patient64@example.com', '1000000064', '1980-03-04', 'Male', 'Address 64'),
-- ('Patient 65', 'patient65@example.com', '1000000065', '1980-03-05', 'Female', 'Address 65'),
-- ('Patient 66', 'patient66@example.com', '1000000066', '1980-03-06', 'Other', 'Address 66'),
-- ('Patient 67', 'patient67@example.com', '1000000067', '1980-03-07', 'Male', 'Address 67'),
-- ('Patient 68', 'patient68@example.com', '1000000068', '1980-03-08', 'Female', 'Address 68'),
-- ('Patient 69', 'patient69@example.com', '1000000069', '1980-03-09', 'Other', 'Address 69'),
-- ('Patient 70', 'patient70@example.com', '1000000070', '1980-03-10', 'Male', 'Address 70'),
-- ('Patient 71', 'patient71@example.com', '1000000071', '1980-03-11', 'Female', 'Address 71'),
-- ('Patient 72', 'patient72@example.com', '1000000072', '1980-03-12', 'Other', 'Address 72'),
-- ('Patient 73', 'patient73@example.com', '1000000073', '1980-03-13', 'Male', 'Address 73'),
-- ('Patient 74', 'patient74@example.com', '1000000074', '1980-03-14', 'Female', 'Address 74'),
-- ('Patient 75', 'patient75@example.com', '1000000075', '1980-03-15', 'Other', 'Address 75'),
-- ('Patient 76', 'patient76@example.com', '1000000076', '1980-03-16', 'Male', 'Address 76'),
-- ('Patient 77', 'patient77@example.com', '1000000077', '1980-03-17', 'Female', 'Address 77'),
-- ('Patient 78', 'patient78@example.com', '1000000078', '1980-03-18', 'Other', 'Address 78'),
-- ('Patient 79', 'patient79@example.com', '1000000079', '1980-03-19', 'Male', 'Address 79'),
-- ('Patient 80', 'patient80@example.com', '1000000080', '1980-03-20', 'Female', 'Address 80'),
-- ('Patient 81', 'patient81@example.com', '1000000081', '1980-03-21', 'Other', 'Address 81'),
-- ('Patient 82', 'patient82@example.com', '1000000082', '1980-03-22', 'Male', 'Address 82'),
-- ('Patient 83', 'patient83@example.com', '1000000083', '1980-03-23', 'Female', 'Address 83'),
-- ('Patient 84', 'patient84@example.com', '1000000084', '1980-03-24', 'Other', 'Address 84'),
-- ('Patient 85', 'patient85@example.com', '1000000085', '1980-03-25', 'Male', 'Address 85'),
-- ('Patient 86', 'patient86@example.com', '1000000086', '1980-03-26', 'Female', 'Address 86'),
-- ('Patient 87', 'patient87@example.com', '1000000087', '1980-03-27', 'Other', 'Address 87'),
-- ('Patient 88', 'patient88@example.com', '1000000088', '1980-03-28', 'Male', 'Address 88'),
-- ('Patient 89', 'patient89@example.com', '1000000089', '1980-03-29', 'Female', 'Address 89'),
-- ('Patient 90', 'patient90@example.com', '1000000090', '1980-03-30', 'Other', 'Address 90'),
-- ('Patient 91', 'patient91@example.com', '1000000091', '1980-03-31', 'Male', 'Address 91'),
-- ('Patient 92', 'patient92@example.com', '1000000092', '1980-04-01', 'Female', 'Address 92'),
-- ('Patient 93', 'patient93@example.com', '1000000093', '1980-04-02', 'Other', 'Address 93'),
-- ('Patient 94', 'patient94@example.com', '1000000094', '1980-04-03', 'Male', 'Address 94'),
-- ('Patient 95', 'patient95@example.com', '1000000095', '1980-04-04', 'Female', 'Address 95'),
-- ('Patient 96', 'patient96@example.com', '1000000096', '1980-04-05', 'Other', 'Address 96'),
-- ('Patient 97', 'patient97@example.com', '1000000097', '1980-04-06', 'Male', 'Address 97'),
-- ('Patient 98', 'patient98@example.com', '1000000098', '1980-04-07', 'Female', 'Address 98'),
-- ('Patient 99', 'patient99@example.com', '1000000099', '1980-04-08', 'Other', 'Address 99'),
-- ('Patient 100', 'patient100@example.com', '1000000100', '1980-04-09', 'Male', 'Address 100');

-- INSERT INTO Doctors (doctor_name, email, phone_number, date_of_birth, gender, address, specialization, fees) VALUES
-- ('Dr. Alice Brown', 'alice.brown@hospital.com', '1112223333', '1975-03-10', 'Female', '789 Pine Rd', 'Cardiology', 500.00),
-- ('Dr. Bob White', 'bob.white@hospital.com', '4445556666', '1982-07-22', 'Male', '321 Maple Ln', 'Neurology', 600.00);

-- -- Bulk insert for 20 Doctors
-- INSERT INTO Doctors (doctor_name, email, phone_number, date_of_birth, gender, address, specialization, fees) VALUES
-- ('Dr. Doctor 1', 'doctor1@hospital.com', '2000000001', '1970-01-01', 'Male', 'Doctor Address 1', 'Specialization 1', 400.00),
-- ('Dr. Doctor 2', 'doctor2@hospital.com', '2000000002', '1970-01-02', 'Female', 'Doctor Address 2', 'Specialization 2', 410.00),
-- ('Dr. Doctor 3', 'doctor3@hospital.com', '2000000003', '1970-01-03', 'Other', 'Doctor Address 3', 'Specialization 3', 420.00),
-- ('Dr. Doctor 4', 'doctor4@hospital.com', '2000000004', '1970-01-04', 'Male', 'Doctor Address 4', 'Specialization 4', 430.00),
-- ('Dr. Doctor 5', 'doctor5@hospital.com', '2000000005', '1970-01-05', 'Female', 'Doctor Address 5', 'Specialization 5', 440.00),
-- ('Dr. Doctor 6', 'doctor6@hospital.com', '2000000006', '1970-01-06', 'Other', 'Doctor Address 6', 'Specialization 6', 450.00),
-- ('Dr. Doctor 7', 'doctor7@hospital.com', '2000000007', '1970-01-07', 'Male', 'Doctor Address 7', 'Specialization 7', 460.00),
-- ('Dr. Doctor 8', 'doctor8@hospital.com', '2000000008', '1970-01-08', 'Female', 'Doctor Address 8', 'Specialization 8', 470.00),
-- ('Dr. Doctor 9', 'doctor9@hospital.com', '2000000009', '1970-01-09', 'Other', 'Doctor Address 9', 'Specialization 9', 480.00),
-- ('Dr. Doctor 10', 'doctor10@hospital.com', '2000000010', '1970-01-10', 'Male', 'Doctor Address 10', 'Specialization 10', 490.00),
-- ('Dr. Doctor 11', 'doctor11@hospital.com', '2000000011', '1970-01-11', 'Female', 'Doctor Address 11', 'Specialization 11', 500.00),
-- ('Dr. Doctor 12', 'doctor12@hospital.com', '2000000012', '1970-01-12', 'Other', 'Doctor Address 12', 'Specialization 12', 510.00),
-- ('Dr. Doctor 13', 'doctor13@hospital.com', '2000000013', '1970-01-13', 'Male', 'Doctor Address 13', 'Specialization 13', 520.00),
-- ('Dr. Doctor 14', 'doctor14@hospital.com', '2000000014', '1970-01-14', 'Female', 'Doctor Address 14', 'Specialization 14', 530.00),
-- ('Dr. Doctor 15', 'doctor15@hospital.com', '2000000015', '1970-01-15', 'Other', 'Doctor Address 15', 'Specialization 15', 540.00),
-- ('Dr. Doctor 16', 'doctor16@hospital.com', '2000000016', '1970-01-16', 'Male', 'Doctor Address 16', 'Specialization 16', 550.00),
-- ('Dr. Doctor 17', 'doctor17@hospital.com', '2000000017', '1970-01-17', 'Female', 'Doctor Address 17', 'Specialization 17', 560.00),
-- ('Dr. Doctor 18', 'doctor18@hospital.com', '2000000018', '1970-01-18', 'Other', 'Doctor Address 18', 'Specialization 18', 570.00),
-- ('Dr. Doctor 19', 'doctor19@hospital.com', '2000000019', '1970-01-19', 'Male', 'Doctor Address 19', 'Specialization 19', 580.00),
-- ('Dr. Doctor 20', 'doctor20@hospital.com', '2000000020', '1970-01-20', 'Female', 'Doctor Address 20', 'Specialization 20', 590.00);

-- -- Insert sample data for Medicines
-- INSERT INTO Medicines (medicine_name, description, price, stock, expiry_date) VALUES
-- ('Aspirin', 'Pain reliever', 10.00, 100, '2027-12-31'),
-- ('Paracetamol', 'Fever reducer', 8.50, 200, '2028-06-30');

-- -- Insert sample data for Insurance
-- INSERT INTO Insurance (provider_name, coverage_details) VALUES
-- ('HealthCare Inc.', 'Covers general health expenses'),
-- ('LifeSecure', 'Covers life-threatening conditions');

-- -- Insert sample data for Departments
-- INSERT INTO Departments (department_name, head_doctor_id) VALUES
-- ('Cardiology', 1),
-- ('Neurology', 2);

-- -- Insert sample data for Time_Table
-- INSERT INTO Time_Table (day_of_week, time_start, time_end, doctor_id) VALUES
-- ('Monday', '09:00', '12:00', 1),
-- ('Tuesday', '14:00', '17:00', 2);

-- -- Insert sample data for Appointments
-- INSERT INTO Appointments (status, patient_id, doctor_id, time_table_id) VALUES
-- ('Pending', 1, 1, 1),
-- ('Confirmed', 2, 2, 2);

-- -- Insert sample data for Diagnosis
-- INSERT INTO Diagnosis (diagnosis_description, doctor_id, patient_id) VALUES
-- ('High blood pressure', 1, 1),
-- ('Migraine', 2, 2);

-- -- Insert sample data for Patients_Insurance
-- INSERT INTO Patients_Insurance (policy_number, start_date, end_date, insurance_id, patient_id) VALUES
-- ('POL123', '2026-01-01', '2027-01-01', 1, 1),
-- ('POL456', '2026-02-01', '2027-02-01', 2, 2);

-- -- Insert sample data for Bills
-- INSERT INTO Bills (amount, status, appointment_id) VALUES
-- (500.00, 'Pending', 1),
-- (600.00, 'Paid', 2);

-- -- Insert sample data for Payments
-- INSERT INTO Payments (amount_paid, payment_method, bill_id) VALUES
-- (500.00, 'Cash', 1),
-- (600.00, 'CreditCard', 2);

-- -- Insert sample data for Prescriptions
-- INSERT INTO Prescriptions (prescription_description, patient_id, doctor_id, appointment_id) VALUES
-- ('Take Aspirin daily', 1, 1, 1),
-- ('Take Paracetamol as needed', 2, 2, 2);

-- -- Insert sample data for prescribed_medicines
-- INSERT INTO prescribed_medicines (dosage, quantity, prescription_id, medicine_id) VALUES
-- ('100mg', 10, 1, 1),
-- ('500mg', 20, 2, 2);
-- -- =============================================
-- -- INSERT STATEMENTS FOR HOSPITAL MANAGEMENT DB
-- -- =============================================

-- -- 1. Patients
-- INSERT INTO Patients (patient_name, email, phone_number, date_of_birth, gender, address) VALUES
-- ('Rahul Sharma', 'rahul.sharma@email.com', '9876543210', '1990-05-15', 'Male', '12 MG Road, Delhi'),
-- ('Priya Patel', 'priya.patel@email.com', '9876543211', '1985-08-22', 'Female', '45 Park Street, Mumbai'),
-- ('Amit Kumar', 'amit.kumar@email.com', '9876543212', '1978-12-01', 'Male', '78 Lake View, Bangalore'),
-- ('Sneha Reddy', 'sneha.reddy@email.com', '9876543213', '1995-03-10', 'Female', '23 Hill Road, Hyderabad'),
-- ('Vikram Singh', 'vikram.singh@email.com', '9876543214', '2000-07-28', 'Male', '56 Station Road, Jaipur');

-- -- 2. Doctors
-- INSERT INTO Doctors (doctor_name, email, phone_number, date_of_birth, gender, address, specialization, fees) VALUES
-- ('Dr. Anil Mehta', 'anil.mehta@hospital.com', '9988776601', '1975-02-20', 'Male', '10 Civil Lines, Delhi', 'Cardiology', 1500.00),
-- ('Dr. Kavita Desai', 'kavita.desai@hospital.com', '9988776602', '1980-06-14', 'Female', '22 Bandra West, Mumbai', 'Dermatology', 1200.00),
-- ('Dr. Rajesh Nair', 'rajesh.nair@hospital.com', '9988776603', '1970-09-05', 'Male', '33 Koramangala, Bangalore', 'Orthopedics', 1800.00),
-- ('Dr. Sunita Rao', 'sunita.rao@hospital.com', '9988776604', '1982-11-30', 'Female', '44 Jubilee Hills, Hyderabad', 'Pediatrics', 1000.00),
-- ('Dr. Manoj Gupta', 'manoj.gupta@hospital.com', '9988776605', '1968-04-18', 'Male', '55 MI Road, Jaipur', 'Neurology', 2000.00);

-- -- 3. Medicines
-- INSERT INTO Medicines (medicine_name, description, price, stock, expiry_date) VALUES
-- ('Paracetamol 500mg', 'Fever and pain relief tablet', 25.00, 500, '2027-06-30'),
-- ('Amoxicillin 250mg', 'Antibiotic for bacterial infections', 80.00, 300, '2027-03-15'),
-- ('Cetirizine 10mg', 'Antihistamine for allergies', 15.00, 400, '2027-12-01'),
-- ('Omeprazole 20mg', 'Proton pump inhibitor for acidity', 45.00, 350, '2027-09-20'),
-- ('Metformin 500mg', 'Oral diabetes medication', 30.00, 600, '2028-01-10');

-- -- 4. Insurance
-- INSERT INTO Insurance (provider_name, coverage_details) VALUES
-- ('Star Health Insurance', 'Covers hospitalization, surgery, and post-operative care up to 5 lakhs'),
-- ('ICICI Lombard', 'Comprehensive health plan covering OPD and IPD up to 10 lakhs'),
-- ('Max Bupa', 'Family floater plan with maternity and newborn coverage up to 7 lakhs'),
-- ('New India Assurance', 'Government health insurance covering critical illness up to 3 lakhs'),
-- ('HDFC Ergo', 'Individual health plan with cashless treatment at network hospitals up to 8 lakhs');

-- -- 5. Departments (depends on Doctors)
-- INSERT INTO Departments (department_name, head_doctor_id) VALUES
-- ('Cardiology', 1),
-- ('Dermatology', 2),
-- ('Orthopedics', 3),
-- ('Pediatrics', 4),
-- ('Neurology', 5);

-- -- 6. Time_Table (depends on Doctors)
-- INSERT INTO Time_Table (day_of_week, time_start, time_end, doctor_id) VALUES
-- ('Monday', '09:00', '13:00', 1),
-- ('Monday', '14:00', '18:00', 2),
-- ('Tuesday', '09:00', '13:00', 3),
-- ('Tuesday', '14:00', '18:00', 4),
-- ('Wednesday', '09:00', '13:00', 5),
-- ('Wednesday', '14:00', '18:00', 1),
-- ('Thursday', '09:00', '13:00', 2),
-- ('Thursday', '14:00', '18:00', 3),
-- ('Friday', '09:00', '13:00', 4),
-- ('Friday', '14:00', '18:00', 5);

-- -- 7. Appointments (depends on Patients, Doctors, Time_Table)
-- INSERT INTO Appointments (status, patient_id, doctor_id, time_table_id) VALUES
-- ('Confirmed', 1, 1, 1),
-- ('Pending', 2, 2, 2),
-- ('Confirmed', 3, 3, 3),
-- ('Cancelled', 4, 4, 4),
-- ('Confirmed', 5, 5, 5),
-- ('Pending', 1, 2, 7),
-- ('Confirmed', 2, 3, 8),
-- ('Pending', 3, 1, 6),
-- ('Confirmed', 4, 5, 10),
-- ('Cancelled', 5, 4, 9);

-- -- 8. Diagnosis (depends on Doctors, Patients)
-- INSERT INTO Diagnosis (diagnosis_description, doctor_id, patient_id) VALUES
-- ('Mild hypertension detected, advised lifestyle changes', 1, 1),
-- ('Eczema on forearms, prescribed topical cream', 2, 2),
-- ('Hairline fracture in left wrist', 3, 3),
-- ('Seasonal flu with mild fever', 4, 4),
-- ('Chronic migraine episodes', 5, 5);

-- -- 9. Patients_Insurance (depends on Insurance, Patients)
-- INSERT INTO Patients_Insurance (policy_number, start_date, end_date, insurance_id, patient_id) VALUES
-- ('POL-2025-001', '2025-01-01', '2026-01-01', 1, 1),
-- ('POL-2025-002', '2025-03-15', '2026-03-15', 2, 2),
-- ('POL-2025-003', '2025-06-01', '2026-06-01', 3, 3),
-- ('POL-2025-004', '2025-02-20', '2026-02-20', 4, 4),
-- ('POL-2025-005', '2025-07-10', '2026-07-10', 5, 5);

-- -- 10. Bills (depends on Appointments)
-- INSERT INTO Bills (amount, status, appointment_id) VALUES
-- (1500.00, 'Paid', 1),
-- (1200.00, 'Pending', 2),
-- (1800.00, 'Paid', 3),
-- (1000.00, 'Cancelled', 4),
-- (2000.00, 'PartiallyPaid', 5),
-- (1200.00, 'Pending', 6),
-- (1800.00, 'Paid', 7),
-- (1500.00, 'Pending', 8),
-- (2000.00, 'Paid', 9),
-- (1000.00, 'Pending', 10);

-- -- 11. Payments (depends on Bills)
-- INSERT INTO Payments (amount_paid, payment_method, bill_id) VALUES
-- (1500.00, 'CreditCard', 1),
-- (1800.00, 'DebitCard', 3),
-- (1000.00, 'Cash', 5),
-- (1000.00, 'NetBanking', 5),
-- (1800.00, 'CreditCard', 7),
-- (2000.00, 'DebitCard', 9);

-- -- 12. Prescriptions (depends on Patients, Doctors, Appointments)
-- INSERT INTO Prescriptions (prescription_description, patient_id, doctor_id, appointment_id) VALUES
-- ('Take medication daily after meals for 2 weeks', 1, 1, 1),
-- ('Apply cream twice daily on affected area for 10 days', 2, 2, 2),
-- ('Immobilize wrist with cast, take painkillers as needed', 3, 3, 3),
-- ('Rest and hydration, take prescribed medicines for 5 days', 4, 4, 4),
-- ('Daily migraine prevention medication for 1 month', 5, 5, 5);

-- -- 13. prescribed_medicines (depends on Prescriptions, Medicines)
-- INSERT INTO prescribed_medicines (dosage, quantity, prescription_id, medicine_id) VALUES
-- ('1 tablet twice daily', 28, 1, 1),
-- ('1 capsule thrice daily', 21, 2, 2),
-- ('1 tablet once daily', 10, 3, 1),
-- ('1 tablet twice daily', 14, 3, 3),
-- ('1 capsule twice daily', 10, 4, 1),
-- ('1 tablet once daily', 5, 4, 3),
-- ('1 tablet once at night', 30, 5, 4);


-- =====================================
-- PATIENTS
-- =====================================
INSERT INTO Patients (patient_name,email,phone_number,date_of_birth,gender,address) VALUES
('Rahul Sharma','rahul@email.com','9000000001','1990-05-15','Male','Delhi'),
('Priya Patel','priya@email.com','9000000002','1988-08-22','Female','Mumbai'),
('Amit Kumar','amit@email.com','9000000003','1979-12-01','Male','Bangalore'),
('Sneha Reddy','sneha@email.com','9000000004','1995-03-10','Female','Hyderabad'),
('Vikram Singh','vikram@email.com','9000000005','2000-07-28','Male','Jaipur');

-- =====================================
-- DOCTORS
-- =====================================
INSERT INTO Doctors (doctor_name,email,phone_number,date_of_birth,gender,address,specialization,fees) VALUES
('Dr. Anil Mehta','anil@hospital.com','9100000001','1975-02-20','Male','Delhi','Cardiology',1500),
('Dr. Kavita Desai','kavita@hospital.com','9100000002','1980-06-14','Female','Mumbai','Dermatology',1200),
('Dr. Rajesh Nair','rajesh@hospital.com','9100000003','1970-09-05','Male','Bangalore','Orthopedics',1800),
('Dr. Sunita Rao','sunita@hospital.com','9100000004','1982-11-30','Female','Hyderabad','Pediatrics',1000),
('Dr. Manoj Gupta','manoj@hospital.com','9100000005','1968-04-18','Male','Jaipur','Neurology',2000);

-- =====================================
-- MEDICINES
-- =====================================
INSERT INTO Medicines (medicine_name,description,price,stock,expiry_date) VALUES
('Paracetamol','Fever medicine',25,500,'2027-06-30'),
('Amoxicillin','Antibiotic',80,300,'2027-03-15'),
('Cetirizine','Allergy medicine',15,400,'2027-12-01'),
('Omeprazole','Acidity medicine',45,350,'2027-09-20'),
('Metformin','Diabetes medicine',30,600,'2028-01-10');

-- =====================================
-- INSURANCE
-- =====================================
INSERT INTO Insurance (provider_name,coverage_details) VALUES
('Star Health','Hospital coverage upto 5 lakhs'),
('ICICI Lombard','Health insurance upto 10 lakhs'),
('Max Bupa','Family floater insurance'),
('New India Assurance','Government insurance plan'),
('HDFC Ergo','Individual coverage upto 8 lakhs');

-- =====================================
-- DEPARTMENTS
-- =====================================
INSERT INTO Departments (department_name,head_doctor_id) VALUES
('Cardiology',1),
('Dermatology',2),
('Orthopedics',3),
('Pediatrics',4),
('Neurology',5);

-- =====================================
-- DOCTOR TIMETABLE
-- =====================================
INSERT INTO Time_Table (day_of_week,time_start,time_end,doctor_id) VALUES
('Monday','09:00:00','13:00:00',1),
('Monday','14:00:00','18:00:00',2),
('Tuesday','09:00:00','13:00:00',3),
('Tuesday','14:00:00','18:00:00',4),
('Wednesday','09:00:00','13:00:00',5);

-- =====================================
-- APPOINTMENTS
-- =====================================
INSERT INTO Appointments (appointment_date,status,patient_id,doctor_id,time_table_id) VALUES
('2026-03-01','Confirmed',1,1,1),
('2026-03-02','Pending',2,2,2),
('2026-03-03','Confirmed',3,3,3),
('2026-03-04','Cancelled',4,4,4),
('2026-03-05','Confirmed',5,5,5);

-- =====================================
-- DIAGNOSIS
-- =====================================
INSERT INTO Diagnosis (diagnosis_description,doctor_id,patient_id) VALUES
('High blood pressure',1,1),
('Skin allergy',2,2),
('Bone fracture',3,3),
('Seasonal flu',4,4),
('Migraine headaches',5,5);

-- =====================================
-- PATIENT INSURANCE
-- =====================================
INSERT INTO Patients_Insurance (policy_number,start_date,end_date,insurance_id,patient_id) VALUES
('POL001','2025-01-01','2026-01-01',1,1),
('POL002','2025-03-15','2026-03-15',2,2),
('POL003','2025-06-01','2026-06-01',3,3),
('POL004','2025-02-20','2026-02-20',4,4),
('POL005','2025-07-10','2026-07-10',5,5);

-- =====================================
-- BILLS
-- =====================================
INSERT INTO Bills (amount,status,appointment_id) VALUES
(1500,'Paid',1),
(1200,'Pending',2),
(1800,'Paid',3),
(1000,'Cancelled',4),
(2000,'PartiallyPaid',5);

-- =====================================
-- PAYMENTS
-- =====================================
INSERT INTO Payments (amount_paid,payment_method,bill_id) VALUES
(1500,'CreditCard',1),
(1800,'DebitCard',3),
(1000,'Cash',5),
(1000,'NetBanking',5);

-- =====================================
-- PRESCRIPTIONS
-- =====================================
INSERT INTO Prescriptions (prescription_description,patient_id,doctor_id,appointment_id) VALUES
('Take paracetamol for fever',1,1,1),
('Apply skin cream twice daily',2,2,2),
('Painkiller after meals',3,3,3),
('Flu medication for 5 days',4,4,4),
('Migraine prevention tablets',5,5,5);

-- =====================================
-- PRESCRIBED MEDICINES
-- =====================================
INSERT INTO prescribed_medicines (dosage,quantity,prescription_id,medicine_id) VALUES
('1 tablet twice daily',14,1,1),
('1 capsule daily',10,2,3),
('1 tablet when needed',7,3,1),
('2 tablets daily',10,4,1),
('1 tablet daily',30,5,4);