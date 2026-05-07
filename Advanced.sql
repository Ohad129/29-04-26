-- Build the full report from Query 4: COALESCE + ROUND + COUNT(CASE WHEN) + HAVING + ORDER BY alias

SELECT
	rep_name,
	count(*) as sales_number,
	count(CASE WHEN product = 'Tablet' THEN 1 END) AS tablets,
	coalesce(round(sum(amount), 2), 0) as total_amount,
	coalesce(round(avg(amount), 1), 0) as sales_average
FROM sales
GROUP BY rep_name
HAVING count(*) >= 2
ORDER BY total_amount DESC;




-- didn't quit understood what to do here, I rewrote the code here and changed aliases, the laptop column with Tablet, and one decimal place in sales_average
