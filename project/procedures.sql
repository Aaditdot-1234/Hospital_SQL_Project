CREATE PROCEDURE sp_monthly_department_report
    @month INT,
    @year INT
AS
BEGIN
    DECLARE @start_date DATE;
    DECLARE @end_date DATE;

    SET @start_date = DATEFROMPARTS(@year,@month,1);
    SET @end_date = DATEADD(MONTH,1,@start_date);

    SELECT 
        dept.department_name,
        COUNT(a.appointment_id) AS total_appointments,
        COUNT(DISTINCT a.patient_id) AS unique_patients,
        ISNULL(SUM(CASE WHEN a.appointment_id IS NOT NULL THEN d.fees ELSE 0 END),0) AS consultation_revenue
    FROM Departments dept
    LEFT JOIN Doctors d 
        ON dept.department_id = d.department_id
    LEFT JOIN Appointments a 
        ON d.doctor_id = a.doctor_id
        AND a.created_at >= @start_date
        AND a.created_at < @end_date
    GROUP BY dept.department_name
    ORDER BY dept.department_name;
END

EXEC sp_monthly_department_report 3, 2026;


CREATE PROCEDURE sp_patient_billing_history
    @patient_id INT
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Patients WHERE patient_id=@patient_id)
    BEGIN
        RAISERROR('Patient ID does not exist',16,1);
        RETURN;
    END

    SELECT 
        a.appointment_id,
        a.created_at AS appointment_date,
        d.doctor_name,
        d.fees AS consultation_charge,
        ISNULL(med.total_medicine_cost,0) AS medicine_cost,
        ISNULL(test.total_test_cost,0) AS lab_cost,
        0 AS insurance_discount,
        b.gst_amount,
        b.total_amount
    FROM Appointments a
    JOIN Doctors d ON a.doctor_id=d.doctor_id
    JOIN Bills b ON a.appointment_id=b.appointment_id

    LEFT JOIN
    (
        SELECT 
            pm.prescription_id,
            SUM(pm.quantity * m.price) AS total_medicine_cost
        FROM prescribed_medicines pm
        JOIN Medicines m 
            ON pm.medicine_id=m.medicine_id
        GROUP BY pm.prescription_id
    ) med ON med.prescription_id IN
        (SELECT prescription_id 
         FROM Prescriptions 
         WHERE appointment_id=a.appointment_id)

    LEFT JOIN
    (
        SELECT 
            pt.prescription_id,
            SUM(t.price) AS total_test_cost
        FROM Prescribed_Tests pt
        JOIN Tests t 
            ON pt.test_id=t.test_id
        GROUP BY pt.prescription_id
    ) test ON test.prescription_id IN
        (SELECT prescription_id 
         FROM Prescriptions 
         WHERE appointment_id=a.appointment_id)

    WHERE a.patient_id=@patient_id

    UNION ALL

    SELECT
        NULL,
        NULL,
        'GRAND TOTAL',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        SUM(b.total_amount)
    FROM Bills b
    JOIN Appointments a 
        ON b.appointment_id=a.appointment_id
    WHERE a.patient_id=@patient_id;
END

EXEC sp_patient_billing_history 1;


CREATE PROCEDURE sp_doctor_performance
    @min_appointments INT
AS
BEGIN

    SELECT
        d.doctor_id,
        d.doctor_name,

        COUNT(a.appointment_id) AS total_appointments,

        SUM(CASE 
            WHEN a.status='Confirmed' 
            THEN 1 ELSE 0 END) 
        AS completed_appointments,

        CAST(
            SUM(CASE 
                WHEN a.status='Confirmed' 
                THEN 1 ELSE 0 END)*100.0 /
            NULLIF(COUNT(a.appointment_id),0)
        AS DECIMAL(5,2))
        AS completion_rate,

        ISNULL(SUM(b.total_amount),0) AS total_revenue,

        COUNT(DISTINCT diag.diagnosis_id)
        AS unique_diagnoses

    FROM Doctors d

    LEFT JOIN Appointments a
        ON d.doctor_id=a.doctor_id

    LEFT JOIN Bills b
        ON a.appointment_id=b.appointment_id

    LEFT JOIN Diagnosis diag
        ON d.doctor_id=diag.doctor_id

    GROUP BY d.doctor_id,d.doctor_name

    HAVING COUNT(a.appointment_id)>=@min_appointments

    ORDER BY total_revenue DESC;

END

EXEC sp_doctor_performance 1;

CREATE PROCEDURE sp_unused_medicines
AS
BEGIN


    SELECT 
        medicine_id,
        medicine_name
    FROM Medicines
    WHERE medicine_id NOT IN
        (SELECT medicine_id 
         FROM prescribed_medicines);

    SELECT 
        medicine_id,
        medicine_name
    FROM Medicines

    EXCEPT

    SELECT 
        m.medicine_id,
        m.medicine_name
    FROM Medicines m
    JOIN prescribed_medicines pm
        ON m.medicine_id=pm.medicine_id;

END

EXEC sp_unused_medicines;

CREATE PROCEDURE sp_monthly_revenue_target
AS
BEGIN

    DECLARE @target INT = 500000;

    WITH MonthlyRevenue AS
    (
        SELECT
            YEAR(payment_date) AS year,
            MONTH(payment_date) AS month,
            SUM(amount_paid) AS total_revenue
        FROM Payments
        GROUP BY
            YEAR(payment_date),
            MONTH(payment_date)
    )

    SELECT
        month,
        year,
        total_revenue,

        CASE
            WHEN total_revenue>=@target
            THEN 'Yes'
            ELSE 'No'
        END AS target_met,

        total_revenue - @target AS surplus_or_deficit

    FROM MonthlyRevenue

    UNION ALL

    SELECT
        NULL,
        NULL,
        NULL,
        'Months Met Target',
        COUNT(*)
    FROM MonthlyRevenue
    WHERE total_revenue>=@target

    UNION ALL

    SELECT
        NULL,
        NULL,
        NULL,
        'Months Failed Target',
        COUNT(*)
    FROM MonthlyRevenue
    WHERE total_revenue<@target;

END

exec sp_monthly_revenue_target;