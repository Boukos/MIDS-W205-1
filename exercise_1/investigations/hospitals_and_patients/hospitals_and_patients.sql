SELECT hospital_name, AVG(base_score)+AVG(consistency_score) AS score
FROM surveys_responses
GROUP BY hospital_name
ORDER BY score DESC
LIMIT 10;
