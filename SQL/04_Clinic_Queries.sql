--1. Find the revenue we got from each sales channel in a given year
SELECT sales_channel,
       SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

--2. Find top 10 the most valuable customers for a given year
SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

--3. Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year
WITH revenue AS (
    SELECT MONTH(datetime) AS month,
           SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
),
expense AS (
    SELECT MONTH(datetime) AS month,
           SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
)
SELECT r.month,
       r.revenue,
       e.expense,
       (r.revenue - e.expense) AS profit,
       CASE 
           WHEN (r.revenue - e.expense) > 0 THEN 'Profitable'
           ELSE 'Not Profitable'
       END AS status
FROM revenue r
JOIN expense e ON r.month = e.month;

--4. For each city find the most profitable clinic for a given month
WITH profit_calc AS (
    SELECT c.city, cs.cid,
           SUM(cs.amount) - COALESCE(SUM(e.amount),0) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.datetime) = 5
    GROUP BY c.city, cs.cid
),
ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY city ORDER BY profit DESC) AS rnk
    FROM profit_calc
)
SELECT *
FROM ranked
WHERE rnk = 1;

--5. For each state find the second least profitable clinic for a given month
WITH profit_calc AS (
    SELECT c.state, cs.cid,
           SUM(cs.amount) - COALESCE(SUM(e.amount),0) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.datetime) = 5
    GROUP BY c.state, cs.cid
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS rnk
    FROM profit_calc
)
SELECT *
FROM ranked
WHERE rnk = 2;
