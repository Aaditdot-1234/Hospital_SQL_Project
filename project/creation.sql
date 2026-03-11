CREATE TABLE Patients(
    patient_id INT IDENTITY(1,1) PRIMARY KEY,
    patient_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone_number NVARCHAR(20) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender NVARCHAR(10) CHECK(gender IN ('Male','Female','Other')),
    address NVARCHAR(200) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Departments
CREATE TABLE Departments(
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
);
GO

-- Doctors
CREATE TABLE Doctors(
    doctor_id INT IDENTITY(1,1) PRIMARY KEY,
    doctor_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone_number NVARCHAR(15) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender NVARCHAR(10) CHECK(gender IN ('Male','Female','Other')),
    address NVARCHAR(100) NOT NULL,
    specialization NVARCHAR(100) NOT NULL,
    fees DECIMAL(10,2) NOT NULL,
    department_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
)
GO

-- Medicines
CREATE TABLE Medicines(
    medicine_id INT IDENTITY(1,1) PRIMARY KEY,
    medicine_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(500) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL CHECK(stock >= 0),
    expiry_date DATE NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Insurance
CREATE TABLE Insurance(
    insurance_id INT IDENTITY(1,1) PRIMARY KEY,
    provider_name NVARCHAR(100) NOT NULL UNIQUE,
    coverage_percent DECIMAL(5,2) NOT NULL CHECK(coverage_percent BETWEEN 0 AND 100),
    max_coverage_amount DECIMAL(10,2) NOT NULL,
    co_pay_percent DECIMAL(5,2) DEFAULT 0 CHECK(co_pay_percent BETWEEN 0 AND 100),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Time Table
CREATE TABLE Time_Table(
    time_table_id INT IDENTITY(1,1) PRIMARY KEY,
    day_of_week NVARCHAR(10) CHECK(day_of_week IN
    ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')),
    time_start TIME NOT NULL,
    time_end TIME NOT NULL,
    doctor_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
GO

-- Appointments
CREATE TABLE Appointments(
    appointment_id INT IDENTITY(1,1) PRIMARY KEY,
    appointment_date DATE NOT NULL,
    status NVARCHAR(20) CHECK(status IN ('Pending','Confirmed','Cancelled')),
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    time_table_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (time_table_id) REFERENCES Time_Table(time_table_id)
);
GO

-- Diagnosis
CREATE TABLE Diagnosis(
    diagnosis_id INT IDENTITY(1,1) PRIMARY KEY,
    diagnosis_description NVARCHAR(1000) NOT NULL,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
GO

-- Tests
CREATE TABLE Tests(
    test_id INT IDENTITY(1,1) PRIMARY KEY,
    test_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(500) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Patients Insurance
CREATE TABLE Patients_Insurance(
    policy_number NVARCHAR(100) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    insurance_id INT NOT NULL,
    patient_id INT NOT NULL,
    PRIMARY KEY (insurance_id, patient_id),
    FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
GO

-- Bills
CREATE TABLE Bills(
    bill_id INT IDENTITY(1,1) PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    gst_percent DECIMAL(5,2) DEFAULT 18,
    gst_amount DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status NVARCHAR(20) CHECK(status IN ('Pending','Paid','PartiallyPaid','Cancelled')),
    appointment_id INT NOT NULL UNIQUE,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
GO

-- Payments
CREATE TABLE Payments(
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT GETDATE(),
    payment_method NVARCHAR(20) CHECK(payment_method IN ('Cash','CreditCard','DebitCard','NetBanking')),
    bill_id INT NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id)
);
GO

-- Prescriptions
CREATE TABLE Prescriptions(
    prescription_id INT IDENTITY(1,1) PRIMARY KEY,
    prescription_description NVARCHAR(1000) NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
GO

-- Prescribed Medicines
CREATE TABLE prescribed_medicines(
    dosage NVARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
GO

-- Prescribed Tests
CREATE TABLE Prescribed_Tests(
    test_date DATE NOT NULL,
    prescription_id INT NOT NULL,
    test_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (prescription_id, test_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (test_id) REFERENCES Tests(test_id)
);
GO

ALTER TABLE Departments
ADD head_doctor_id INT;

ALTER TABLE Departments
ADD CONSTRAINT FK_Head_Doctor
FOREIGN KEY (head_doctor_id)
REFERENCES Doctors(doctor_id);