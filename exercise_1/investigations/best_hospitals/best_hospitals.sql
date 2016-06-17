SELECT hospital_name, CAST (best_procedure_count AS int) AS count,
total_score, avg_score, variability
FROM hospital_score_info
ORDER BY count DESC
LIMIT 10;



