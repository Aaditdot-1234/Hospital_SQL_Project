PRAGMA foreign_keys = ON;

CREATE TABLE Patients(
    patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone_number TEXT NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male','Female','Other')),
    address TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Doctors(
    doctor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    doctor_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone_number TEXT NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male','Female','Other')),
    address TEXT NOT NULL,
    specialization TEXT NOT NULL,
    fees DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Medicines(
    medicine_id INTEGER PRIMARY KEY AUTOINCREMENT,
    medicine_name TEXT NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INTEGER NOT NULL CHECK(stock >= 0),
    expiry_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Insurance(
    insurance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    provider_name TEXT NOT NULL UNIQUE,
    coverage_details TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Departments(
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name TEXT NOT NULL,
    head_doctor_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (head_doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Time_Table(
    time_table_id INTEGER PRIMARY KEY AUTOINCREMENT,
    day_of_week TEXT CHECK(
        day_of_week IN (
            'Monday','Tuesday','Wednesday',
            'Thursday','Friday','Saturday','Sunday'
        )
    ),
    time_start TIME NOT NULL,
    time_end TIME NOT NULL,
    doctor_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Appointments(
    appointment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    appointment_date DATE NOT NULL,
    status TEXT CHECK(status IN ('Pending','Confirmed','Cancelled')),
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    time_table_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (time_table_id) REFERENCES Time_Table(time_table_id)
);

CREATE TABLE Diagnosis(
    diagnosis_id INTEGER PRIMARY KEY AUTOINCREMENT,
    diagnosis_description TEXT NOT NULL,
    doctor_id INTEGER NOT NULL,
    patient_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Patients_Insurance(
    policy_number TEXT NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    insurance_id INTEGER NOT NULL,
    patient_id INTEGER NOT NULL,
    PRIMARY KEY (insurance_id, patient_id),
    FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Bills(
    bill_id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount DECIMAL(10,2) NOT NULL,
    status TEXT CHECK(
        status IN ('Pending','Paid','PartiallyPaid','Cancelled')
    ),
    appointment_id INTEGER NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Payments(
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    payment_method TEXT CHECK(
        payment_method IN ('Cash','CreditCard','DebitCard','NetBanking')
    ),
    bill_id INTEGER NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id)
);

CREATE TABLE Prescriptions(
    prescription_id INTEGER PRIMARY KEY AUTOINCREMENT,
    prescription_description TEXT NOT NULL,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    appointment_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE prescribed_medicines(
    dosage TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    prescription_id INTEGER NOT NULL,
    medicine_id INTEGER NOT NULL,
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);