create table Patients(
    patient_id int identity(1, 1) primary key,
    patient_name nvarchar(100) not null,
    email nvarchar(100) not null unique,
    phone_number nvarchar(15) not null unique,
    date_of_birth date not null,
    gender nvarchar(10) check(gender in ('Male', 'Female', 'Other')),
    address nvarchar(100) not null,
    created_at datetime default getdate(),
    updated_at datetime default getdate()
) create table Doctors(
    doctor_id int identity(1, 1) primary key,
    doctor_name nvarchar(100) not null,
    email nvarchar(100) not null unique,
    phone_number nvarchar(15) not null unique,
    date_of_birth date not null,
    gender nvarchar(10) check(gender in ('Male', 'Female', 'Other')),
    address nvarchar(100) not null,
    specialization nvarchar(100) not null,
    fees decimal(10, 2) not null,
    created_at datetime default getdate(),
    updated_at datetime default getdate()
) create table Departments(
    department_id int identity(1, 1) primary key,
    department_name nvarchar(100) not null,
    head_doctor_id int not null,
    foreign key (head_doctor_id) references Doctors(doctor_id)
) create table Diagnosis(
    diagnosis_id int identity(1, 1) primary key,
    diagnosis_description nvarchar(1000) not null,
    created_at datetime default getdate(),
    updated_at datetime default getdate(),
    doctor_id int not null,
    patient_id int not null,
    foreign key (doctor_id) references Doctors(doctor_id),
    foreign key (patient_id) references Patients(patient_id)
) create table Time_Table(
    time_table_id int identity(1, 1) primary key,
    day_of_week nvarchar(10) check(
        day_of_week in (
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
            'Sunday'
        )
    ),
    time_start time not null,
    time_end time not null,
    doctor_id int not null,
    foreign key (doctor_id) references Doctors(doctor_id)
) create table Appointments(
    appointment_id int identity(1, 1) primary key,
    status nvarchar(10) check(status in ('Pending', 'Confirmed', 'Cancelled')),
    patient_id int not null,
    doctor_id int not null,
    time_table_id int not null,
    foreign key (patient_id) references Patients(patient_id),
    foreign key (doctor_id) references Doctors(doctor_id),
    foreign key (time_table_id) references Time_Table(time_table_id)
) create table Patients_Insurance(
    policy_number nvarchar(100) not null unique,
    start_date date not null,
    end_date date not null,
    insurance_id int not null,
    patient_id int not null,
    primary key (insurance_id, patient_id),
    foreign key (insurance_id) references Insurance(insurance_id),
    foreign key (patient_id) references Patients(patient_id)
) create table Insurance(
    insurance_id int identity(1, 1) primary key,
    provider_name nvarchar(100) not null unique,
    coverage_details nvarchar(1000) not null
) create table Bills(
    bill_id int identity(1, 1) primary key,
    amount decimal(10, 2) not null,
    status nvarchar(10) check(
        status in ('Pending', 'Paid', 'PartiallyPaid', 'Cancelled')
    ),
    appointment_id int not null unique,
    foreign key (appointment_id) references Appointments(appointment_id)
) create table Payments(
    payment_id int identity(1, 1) primary key,
    amount_paid decimal(10, 2) not null,
    payment_date datetime default getdate() not null,
    payment_method nvarchar(10) check(
        payment_method in ('Cash', 'CreditCard', 'DebitCard', 'NetBanking')
    ),
    bill_id int not null,
    foreign key (bill_id) references Bills(bill_id)
) create table Prescriptions(
    prescription_id int identity(1, 1) primary key,
    prescription_description nvarchar(1000) not null,
    created_at datetime default getdate(),
    updated_at datetime default getdate(),
    patient_id int not null,
    doctor_id int not null,
    appointment_id int not null,
    foreign key (patient_id) references Patients(patient_id),
    foreign key (doctor_id) references Doctors(doctor_id),
    foreign key (appointment_id) references Appointments(appointment_id)
) create table prescribed_medicines(
    dosage nvarchar(100) not null,
    quantity int not null,
    prescription_id int not null,
    medicine_id int not null,
    primary key (prescription_id, medicine_id),
    foreign key (prescription_id) references Prescriptions(prescription_id),
    foreign key (medicine_id) references Medicines(medicine_id)
) create table Medicines(
    medicine_id int identity(1, 1) primary key,
    medicine_name nvarchar(100) not null,
    description nvarchar(1000) not null,
    price decimal(10, 2) not null,
    stock int not null,
    expiry_date date not null
)