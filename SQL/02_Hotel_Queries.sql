--1. For every user in the system, get the user_id and last booked room_no
SELECT user_id, room_no
FROM (
    SELECT user_id, room_no,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) AS rn
    FROM bookings
) t
WHERE rn = 1;

SELECT bc.booking_id,
       SUM(i.item_rate * bc.item_quantity) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 11
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.booking_id;

SELECT bc.bill_id,
       SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING SUM(i.item_rate * bc.item_quantity) > 1000;

WITH item_orders AS (
    SELECT item_id,
           MONTH(bill_date) AS month,
           SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE YEAR(bill_date) = 2021
    GROUP BY item_id, MONTH(bill_date)
),
ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY month ORDER BY total_qty DESC) AS max_rank,
           RANK() OVER (PARTITION BY month ORDER BY total_qty ASC) AS min_rank
    FROM item_orders
)
SELECT *
FROM ranked
WHERE max_rank = 1 OR min_rank = 1;

WITH monthly_bills AS (
    SELECT bill_id,
           MONTH(bill_date) AS month,
           SUM(i.item_rate * bc.item_quantity) AS total_amount
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bill_date) = 2021
    GROUP BY bill_id, MONTH(bill_date)
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY month ORDER BY total_amount DESC) AS rnk
    FROM monthly_bills
)
SELECT *
FROM ranked
WHERE rnk = 2;

