SELECT measure_id, SUM(ABS(CAST (variability AS float)))/COUNT(variability) AS variance
FROM hospital_variability
WHERE variability<>''
GROUP BY measure_id
ORDER BY variance DESC
LIMIT 10;
