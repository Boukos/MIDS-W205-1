CREATE TABLE procedure_max_score
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
AS
SELECT ec.*, ec_max.max_score, ec_max.avg_score
FROM effective_care AS ec
JOIN
(
SELECT measure_id, MAX(score) AS max_score,
AVG(score) AS avg_score 
FROM effective_care
WHERE score NOT LIKE 'N%'
GROUP BY measure_id
) 
AS ec_max
ON (ec.measure_id = ec_max.measure_id AND ec.score = ec_max.max_score);


CREATE TABLE hospital_score_info
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
AS
SELECT hospital_name, COUNT(hospital_name) AS best_procedure_count,
SUM(score) AS total_score, AVG(score) AS avg_score,
MAX(score)-MIN(score) AS variability
FROM procedure_max_score
GROUP BY hospital_name;


CREATE TABLE state_score_info
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
AS
SELECT state, COUNT(state) AS best_procedure_count,
SUM(score) AS total_score, AVG(score) AS avg_score,
MAX(score)-MIN(score) AS variability
FROM procedure_max_score
WHERE score NOT LIKE 'N%'
GROUP BY state;


CREATE TABLE hospital_variability
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
AS
SELECT ec.measure_id, ec.provider_id, ec.score-ec_max.avg_measure_score AS variability
FROM effective_care AS ec
JOIN
(
SELECT measure_id, AVG(avg_score) AS avg_measure_score FROM procedure_max_score
GROUP BY measure_id
)
AS ec_max
ON (ec.measure_id = ec_max.measure_id);
