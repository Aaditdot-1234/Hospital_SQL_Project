CREATE TRIGGER trg_prevent_double_booking
ON Appointments
AFTER INSERT
AS
BEGIN

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Appointments a
            ON a.doctor_id = i.doctor_id
        JOIN Time_Table t1
            ON i.time_table_id = t1.time_table_id
        JOIN Time_Table t2
            ON a.time_table_id = t2.time_table_id
        WHERE 
            a.appointment_id <> i.appointment_id
            AND a.status IN ('Pending','Confirmed')
            AND t1.day_of_week = t2.day_of_week
            AND t1.time_start = t2.time_start
    )
    BEGIN
        ROLLBACK;

        RAISERROR(
        'Doctor already has an appointment at this time slot.',
        16,
        1
        );

    END

END


CREATE TRIGGER trg_generate_bill
ON Appointments
AFTER UPDATE
AS
BEGIN

    IF UPDATE(status)
    BEGIN

        IF EXISTS (
            SELECT 1
            FROM inserted i
            JOIN Bills b
            ON i.appointment_id = b.appointment_id
        )
        BEGIN
            RAISERROR('Bill already exists for this appointment',16,1);
            ROLLBACK;
            RETURN;
        END

        INSERT INTO Bills
        (
            appointment_id,
            amount,
            status
        )

        SELECT
            i.appointment_id,

            d.fees
            + ISNULL(med.total_medicine_cost,0)
            + ISNULL(lab.total_lab_cost,0),

            'Pending'

        FROM inserted i

        JOIN Doctors d
        ON i.doctor_id = d.doctor_id

        LEFT JOIN
        (
            SELECT
                p.appointment_id,
                SUM(pm.quantity * m.price) total_medicine_cost
            FROM Prescriptions p
            JOIN prescribed_medicines pm
                ON p.prescription_id = pm.prescription_id
            JOIN Medicines m
                ON pm.medicine_id = m.medicine_id
            GROUP BY p.appointment_id
        ) med
        ON i.appointment_id = med.appointment_id

        LEFT JOIN
        (
            SELECT
                pt.prescription_id,
                SUM(t.price) total_lab_cost
            FROM Prescribed_Tests pt
            JOIN Tests t
                ON pt.test_id = t.test_id
            GROUP BY pt.prescription_id
        ) lab
        ON lab.prescription_id IN
        (
            SELECT prescription_id
            FROM Prescriptions
            WHERE appointment_id = i.appointment_id
        )

        WHERE i.status = 'Completed';

    END

END