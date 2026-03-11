create procedure sp-monthly-department-report
    @month varchar(20),
    @year int,
as
begin
    declare @start_date date;
    declare @end_date date;

    set @start_date = datefromparts(@year, @month, 1);
    set @end_date = dateadd(Month, 1, @start_date);

    select * from  Patients p
    join Appointments a on p.patient_id = a.patient_id
    join Doctors d on a.doctor_id = d.doctor_id
    join Departments dept on d.department_id = dept.department_id
    where a.created_at >= @start_date and a.created_at < @end_date
end

create procedure sp-patient-billing-system
    @PatientId int
as
BEGIN
    select * from students
END