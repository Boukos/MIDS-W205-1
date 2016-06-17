SELECT state, CAST (best_procedure_count AS int) AS count,
total_score, avg_score
FROM state_score_info
ORDER BY count DESC
LIMIT 10;