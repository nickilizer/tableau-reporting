SELECT
  title
  , COUNT(title)  AS number_of_runs
  , MIN(min_diff) AS min_time_min
  , ROUND(AVG(min_diff)::decimal,2) AS avg_time_min
  , MAX(min_diff) AS max_time_min
FROM  (SELECT
  title
  , started_at
  , completed_at
  , DATE_PART('day', completed_at - started_at) * 24 + DATE_PART('hour', completed_at - started_at) * 60 + DATE_PART('minute', completed_at - started_at) AS min_diff
FROM _background_tasks WHERE job_name = 'Refresh Extracts'
AND finish_code = 0
--AND title IN()
AND LOWER(title) LIKE '%mab%'
  ) AS tbl
GROUP BY 1
ORDER BY 4 DESC
