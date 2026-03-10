CREATE FUNCTION fn_GetPatientAge
(
    @patient_id INT
)
RETURNS INT
AS
BEGIN

    DECLARE @dob DATE
    DECLARE @age INT

    SELECT @dob = date_of_birth
    FROM Patients
    WHERE patient_id = @patient_id

    IF @dob IS NULL
        RETURN NULL

    SET @age = DATEDIFF(YEAR, @dob, GETDATE())

    -- Correct age if birthday not yet reached this year
    IF DATEADD(YEAR, @age, @dob) > GETDATE()
        SET @age = @age - 1

    RETURN @age

END


CREATE FUNCTION fn_CalculateNetBill
(
    @consultation_charge DECIMAL(10,2),
    @medicine_charge DECIMAL(10,2),
    @lab_charge DECIMAL(10,2),
    @insurance_percent DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN

    DECLARE @subtotal DECIMAL(12,2)
    DECLARE @discount DECIMAL(12,2)
    DECLARE @consult_gst DECIMAL(12,2)
    DECLARE @med_gst DECIMAL(12,2)
    DECLARE @lab_gst DECIMAL(12,2)
    DECLARE @final_amount DECIMAL(12,2)

    SET @subtotal = @consultation_charge + @medicine_charge + @lab_charge

    -- Insurance discount
    SET @discount = (@subtotal * @insurance_percent) / 100

    -- GST calculations
    SET @consult_gst = @consultation_charge * 0.18
    SET @med_gst = @medicine_charge * 0.12
    SET @lab_gst = @lab_charge * 0.05

    SET @final_amount =
        (@subtotal - @discount)
        + @consult_gst
        + @med_gst
        + @lab_gst

    RETURN @final_amount

END