-- Q: Trips per day with 7-day moving average
WITH daily AS (
  SELECT date(trip_ts) AS d, COUNT(*) AS trips
  FROM trips
  GROUP BY 1
)
SELECT d,
       trips,
       AVG(trips) OVER (ORDER BY d ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS trips_ma7
FROM daily
ORDER BY d;
