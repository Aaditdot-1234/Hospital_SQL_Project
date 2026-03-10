SELECT *
FROM
(
    SELECT
        dept.department_name,
        d.doctor_name,
        SUM(b.final_amount) AS total_revenue,

        RANK() OVER
        (
            PARTITION BY dept.department_id
            ORDER BY SUM(b.final_amount) DESC
        ) AS doctor_rank

    FROM Doctors d
    JOIN Departments dept
        ON d.department_id = dept.department_id
    JOIN Appointments a
        ON d.doctor_id = a.doctor_id
    JOIN Bills b
        ON a.appointment_id = b.appointment_id

    WHERE a.status = 'Completed'

    GROUP BY
        dept.department_id,
        dept.department_name,
        d.doctor_name
) ranked_doctors

WHERE doctor_rank <= 3

ORDER BY
    department_name,
    doctor_rank;


SELECT
    FORMAT(month_date, 'MMM yyyy') AS month,

    monthly_revenue,

    SUM(monthly_revenue) OVER
    (
        ORDER BY month_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue

FROM
(
    SELECT
        DATEFROMPARTS(YEAR(b.bill_date), MONTH(b.bill_date), 1) AS month_date,
        SUM(b.final_amount) AS monthly_revenue

    FROM Bills b

    GROUP BY
        YEAR(b.bill_date),
        MONTH(b.bill_date)
) revenue_data

ORDER BY month_date;