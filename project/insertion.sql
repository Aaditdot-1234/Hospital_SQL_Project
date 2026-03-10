--first enter the department names without head_doctor_id

INSERT INTO Departments (department_name)
VALUES
('Cardiology'),
('Neurology'),
('General Medicine'),
('Dermatology'),
('Orthopedics'),
('Pediatrics'),
('ENT'),
('Gynecology'),
('Psychiatry');

--then enter the doctors with the department id

INSERT INTO Doctors
(doctor_name,email,phone_number,date_of_birth,gender,address,specialization,fees,department_id)
VALUES
('Dr. Anil Kapoor','anil@hospital.com','9100000001','1975-04-10','Male','Mumbai','Cardiologist',1000,1),
('Dr. Sneha Joshi','sneha@hospital.com','9100000002','1980-09-12','Female','Mumbai','Neurologist',1200,2),
('Dr. Raj Patel','raj@hospital.com','9100000003','1978-01-20','Male','Pune','General Physician',800,3),
('Dr. Meera Iyer','meera@hospital.com','9100000004','1985-06-11','Female','Chennai','Dermatologist',900,4),
('Dr. Vikram Shah','vikram@hospital.com','9100000005','1976-02-15','Male','Ahmedabad','Orthopedic',1100,5),
('Dr. Kavita Rao','kavita@hospital.com','9100000006','1982-07-17','Female','Bangalore','Pediatrician',950,6),
('Dr. Rohit Sen','rohit@hospital.com','9100000007','1979-10-05','Male','Kolkata','ENT Specialist',850,7),
('Dr. Nisha Kapoor','nisha@hospital.com','9100000008','1983-11-22','Female','Delhi','Gynecologist',1000,8),
('Dr. Arvind Menon','arvind@hospital.com','9100000009','1974-03-19','Male','Kochi','Cardiologist',1300,1),
('Dr. Sunita Desai','sunita@hospital.com','9100000010','1981-12-01','Female','Mumbai','Psychiatrist',1150,9);

--then update the department table with the head_doctor_id

UPDATE Departments SET head_doctor_id = 1 WHERE department_id = 1;
UPDATE Departments SET head_doctor_id = 2 WHERE department_id = 2;
UPDATE Departments SET head_doctor_id = 3 WHERE department_id = 3;
UPDATE Departments SET head_doctor_id = 4 WHERE department_id = 4;
UPDATE Departments SET head_doctor_id = 5 WHERE department_id = 5;
UPDATE Departments SET head_doctor_id = 6 WHERE department_id = 6;
UPDATE Departments SET head_doctor_id = 7 WHERE department_id = 7;
UPDATE Departments SET head_doctor_id = 8 WHERE department_id = 8;
UPDATE Departments SET head_doctor_id = 10 WHERE department_id = 9;

--and then perform all the operations in one go no dependency issues

INSERT INTO Patients (patient_name,email,phone_number,date_of_birth,gender,address) VALUES
('Rahul Sharma','rahul1@gmail.com','9000000001','1995-06-12','Male','Mumbai'),
('Priya Mehta','priya2@gmail.com','9000000002','1998-02-10','Female','Pune'),
('Amit Verma','amit3@gmail.com','9000000003','1992-11-01','Male','Delhi'),
('Sneha Patil','sneha4@gmail.com','9000000004','1990-07-18','Female','Mumbai'),
('Karan Singh','karan5@gmail.com','9000000005','1988-05-30','Male','Delhi'),
('Neha Gupta','neha6@gmail.com','9000000006','1997-03-22','Female','Jaipur'),
('Arjun Nair','arjun7@gmail.com','9000000007','1994-09-11','Male','Kochi'),
('Pooja Shah','pooja8@gmail.com','9000000008','1996-01-14','Female','Ahmedabad'),
('Rohan Das','rohan9@gmail.com','9000000009','1993-10-03','Male','Kolkata'),
('Anita Kulkarni','anita10@gmail.com','9000000010','1989-12-25','Female','Pune');

INSERT INTO Medicines (medicine_name,description,price,stock,expiry_date) VALUES
('Paracetamol','Fever and pain relief',20,500,'2027-01-01'),
('Amoxicillin','Antibiotic',50,300,'2026-08-01'),
('Ibuprofen','Pain relief anti-inflammatory',30,400,'2027-03-01'),
('Cetirizine','Allergy relief',25,200,'2026-05-01'),
('Metformin','Diabetes medicine',40,250,'2027-02-10'),
('Atorvastatin','Cholesterol control',60,300,'2026-11-01'),
('Aspirin','Blood thinner',15,350,'2027-07-01'),
('Azithromycin','Antibiotic',70,150,'2026-09-01'),
('Pantoprazole','Acidity medicine',35,400,'2027-04-01'),
('Vitamin D','Supplement',45,500,'2027-12-01');

INSERT INTO Insurance (provider_name,coverage_percent,max_coverage_amount,co_pay_percent) VALUES
('Star Health',80,50000,20),
('HDFC Ergo',90,100000,10),
('ICICI Lombard',85,80000,15),
('Bajaj Allianz',75,60000,25),
('New India Assurance',70,50000,30),
('Care Insurance',88,90000,12),
('Aditya Birla Health',82,75000,18),
('Reliance Health',78,65000,22),
('Future Generali',80,70000,20),
('Tata AIG',92,120000,8);

INSERT INTO Departments (department_name,head_doctor_id) VALUES
('Cardiology',1),
('Neurology',2),
('General Medicine',3),
('Dermatology',4),
('Orthopedics',5),
('Pediatrics',6),
('ENT',7),
('Gynecology',8),
('Cardiology-2',9),
('Psychiatry',10);

INSERT INTO Time_Table (day_of_week,time_start,time_end,doctor_id) VALUES
('Monday','09:00','12:00',1),
('Tuesday','10:00','13:00',2),
('Wednesday','08:00','11:00',3),
('Thursday','09:00','12:00',4),
('Friday','10:00','14:00',5),
('Saturday','09:00','12:00',6),
('Monday','13:00','16:00',7),
('Tuesday','14:00','17:00',8),
('Wednesday','10:00','13:00',9),
('Thursday','11:00','15:00',10);

INSERT INTO Appointments (appointment_date,status,patient_id,doctor_id,time_table_id) VALUES
('2026-03-10','Confirmed',1,1,1),
('2026-03-11','Pending',2,2,2),
('2026-03-12','Confirmed',3,3,3),
('2026-03-13','Confirmed',4,4,4),
('2026-03-14','Cancelled',5,5,5),
('2026-03-15','Confirmed',6,6,6),
('2026-03-16','Pending',7,7,7),
('2026-03-17','Confirmed',8,8,8),
('2026-03-18','Confirmed',9,9,9),
('2026-03-19','Pending',10,10,10);

INSERT INTO Diagnosis (diagnosis_description,doctor_id,patient_id) VALUES
('High fever',3,1),
('Migraine',2,2),
('Chest pain observation',1,3),
('Skin allergy',4,4),
('Fracture check',5,5),
('Child fever',6,6),
('Ear infection',7,7),
('Pregnancy consultation',8,8),
('Heart checkup',9,9),
('Depression symptoms',10,10);

INSERT INTO Patients_Insurance (policy_number,start_date,end_date,insurance_id,patient_id) VALUES
('POL001','2025-01-01','2027-01-01',1,1),
('POL002','2024-01-01','2026-01-01',2,2),
('POL003','2024-06-01','2026-06-01',3,3),
('POL004','2025-03-01','2027-03-01',4,4),
('POL005','2025-04-01','2027-04-01',5,5),
('POL006','2025-05-01','2027-05-01',6,6),
('POL007','2025-06-01','2027-06-01',7,7),
('POL008','2025-07-01','2027-07-01',8,8),
('POL009','2025-08-01','2027-08-01',9,9),
('POL010','2025-09-01','2027-09-01',10,10);

INSERT INTO Tests (test_name,description,price) VALUES
('Blood Test','General blood analysis',500),
('MRI Scan','Brain MRI scan',5000),
('ECG','Heart activity test',800),
('X-Ray','Bone imaging',600),
('CT Scan','Detailed imaging',4500),
('Urine Test','Urine analysis',300),
('Thyroid Test','Thyroid function',700),
('Liver Test','Liver function',900),
('Kidney Test','Kidney function',850),
('Allergy Test','Allergy detection',1000);

INSERT INTO Prescriptions (prescription_description,patient_id,doctor_id,appointment_id) VALUES
('Fever treatment',1,3,1),
('Migraine medication',2,2,2),
('Heart observation',3,1,3),
('Skin allergy cream',4,4,4),
('Bone pain relief',5,5,5),
('Child fever meds',6,6,6),
('Ear infection meds',7,7,7),
('Pregnancy vitamins',8,8,8),
('Heart medicine',9,9,9),
('Mental health medication',10,10,10);

INSERT INTO prescribed_medicines (dosage,quantity,prescription_id,medicine_id) VALUES
('1 tablet twice daily',5,1,1),
('1 capsule daily',7,2,2),
('1 tablet after meal',10,3,3),
('Apply twice daily',1,4,4),
('2 tablets daily',8,5,5),
('1 tablet daily',5,6,6),
('1 capsule twice',6,7,7),
('1 tablet daily',5,8,8),
('1 tablet after meal',7,9,9),
('1 tablet daily',10,10,10);

INSERT INTO Prescribed_Tests (test_date,prescription_id,test_id) VALUES
('2026-03-10',1,1),
('2026-03-11',2,2),
('2026-03-12',3,3),
('2026-03-13',4,4),
('2026-03-14',5,5),
('2026-03-15',6,6),
('2026-03-16',7,7),
('2026-03-17',8,8),
('2026-03-18',9,9),
('2026-03-19',10,10);

INSERT INTO Bills (amount,gst_percent,gst_amount,total_amount,status,appointment_id) VALUES
(1000,18,180,1180,'Pending',1),
(2000,18,360,2360,'Paid',2),
(1500,18,270,1770,'Pending',3),
(1200,18,216,1416,'Paid',4),
(3000,18,540,3540,'Pending',5),
(800,18,144,944,'Paid',6),
(1600,18,288,1888,'Pending',7),
(2500,18,450,2950,'Pending',8),
(4000,18,720,4720,'Paid',9),
(2200,18,396,2596,'Pending',10);

INSERT INTO Payments (amount_paid,payment_method,bill_id) VALUES
(1180,'CreditCard',1),
(2360,'Cash',2),
(1770,'DebitCard',3),
(1416,'NetBanking',4),
(3540,'CreditCard',5),
(944,'Cash',6),
(1888,'DebitCard',7),
(2950,'NetBanking',8),
(4720,'CreditCard',9),
(2596,'Cash',10);