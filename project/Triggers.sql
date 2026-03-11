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

        RAISERROR('Doctor already has an appointment at this time slot.',16,1);
    END
END

-- 2nd Trigger

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

-- 3rd Trigger 

CREATE TRIGGER trg_UpdateFollowUpOnAbnormal
ON Prescribed_Tests
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Iterate through the rows being inserted or updated
    DECLARE @PrescriptionID INT;
    DECLARE @TestResult NVARCHAR(50);

    DECLARE cur CURSOR FOR 
    SELECT prescription_id, test_result FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @PrescriptionID, @TestResult;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if the result is marked as 'Abnormal'
        IF @TestResult = 'Abnormal'
        BEGIN
            -- Attempt to update the 'Medical Record' (Prescription description)
            UPDATE Prescriptions
            SET prescription_description = prescription_description + ' [SYSTEM NOTE: Follow-up required due to abnormal lab result]',
                updated_at = GETDATE()
            WHERE prescription_id = @PrescriptionID;

            -- If no row was updated, it means the prescription/record doesn't exist
            IF @@ROWCOUNT = 0
            BEGIN
                RAISERROR ('Warning: Lab result is abnormal, but no matching Prescription record was found to update.', 10, 1);
            END
            
            -- Also update the flag on the test record itself
            UPDATE Prescribed_Tests
            SET follow_up_required = 1
            WHERE prescription_id = @PrescriptionID AND test_result = 'Abnormal';
        END

        FETCH NEXT FROM cur INTO @PrescriptionID, @TestResult;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
GO





-- CREATE OR ALTER TRIGGER trg_sync_bill_status_aadit
-- ON _aaditAppointments
-- AFTER UPDATE
-- AS
-- BEGIN
--     SET NOCOUNT ON;

--     -- 1. HANDLE CONFIRMED STATUS (Create or Update Bill)
--     IF EXISTS (SELECT 1 FROM inserted WHERE status = 'Confirmed')
--     BEGIN
--         -- This 'MERGE' statement handles both INSERT and UPDATE in one go
--         MERGE _aaditBills AS target
--         USING (
--             SELECT 
--                 i.appointment_id,
--                 (d.fees + ISNULL(med.total_medicine_cost,0) + ISNULL(lab.total_lab_cost,0)) AS base_amount,
--                 i.status
--             FROM inserted i
--             JOIN _aaditDoctors d ON i.doctor_id = d.doctor_id
--             LEFT JOIN (
--                 SELECT p.appointment_id, SUM(pm.quantity * m.price) AS total_medicine_cost
--                 FROM _aaditPrescriptions p
--                 JOIN _aaditprescribed_medicines pm ON p.prescription_id = pm.prescription_id
--                 JOIN _aaditMedicines m ON pm.medicine_id = m.medicine_id
--                 GROUP BY p.appointment_id
--             ) med ON i.appointment_id = med.appointment_id
--             LEFT JOIN (
--                 SELECT pt.prescription_id, SUM(t.price) AS total_lab_cost
--                 FROM _aaditPrescribed_Tests pt
--                 JOIN _aaditTests t ON pt.test_id = t.test_id
--                 GROUP BY pt.prescription_id
--             ) lab ON lab.prescription_id IN (
--                 SELECT prescription_id FROM _aaditPrescriptions WHERE appointment_id = i.appointment_id
--             )
--             WHERE i.status = 'Confirmed'
--         ) AS source
--         ON (target.appointment_id = source.appointment_id)
        
--         -- If Bill exists, update the amounts
--         WHEN MATCHED THEN
--             UPDATE SET 
--                 target.amount = source.base_amount,
--                 target.gst_amount = source.base_amount * 0.18,
--                 target.total_amount = source.base_amount * 1.18,
--                 target.status = 'Pending', -- Bill is generated but payment is pending
--                 target.updated_at = GETDATE()
        
--         -- If Bill doesn't exist, create it
--         WHEN NOT MATCHED THEN
--             INSERT (appointment_id, amount, gst_percent, gst_amount, total_amount, status, created_at, updated_at)
--             VALUES (
--                 source.appointment_id, 
--                 source.base_amount, 
--                 18, 
--                 source.base_amount * 0.18, 
--                 source.base_amount * 1.18, 
--                 'Pending', 
--                 GETDATE(), 
--                 GETDATE()
--             );
--     END

--     -- 2. HANDLE CANCELLED STATUS
--     IF EXISTS (SELECT 1 FROM inserted WHERE status = 'Cancelled')
--     BEGIN
--         UPDATE b
--         SET 
--             b.status = 'Cancelled', 
--             b.amount = 0,
--             b.gst_amount = 0,
--             b.total_amount = 0,
--             b.updated_at = GETDATE()
--         FROM _aaditBills b
--         JOIN inserted i ON b.appointment_id = i.appointment_id
--         WHERE i.status = 'Cancelled';
--     END
-- END
-- GO