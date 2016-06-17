CREATE EXTERNAL TABLE IF NOT EXISTS hospitals
(
provider_id string,
name string,
city string,
state string,
zip string,
country_name string,
phone_number string,
type string,
ownership string,
emergency_service string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

CREATE EXTERNAL TABLE IF NOT EXISTS effective_care
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip string,
country_name string,
phone_number string,
condition string,
measure_id string,
measure_name string,
score float,
sample int,
footnote string,
start_date string,
end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

CREATE EXTERNAL TABLE IF NOT EXISTS measures
(
measure_name string,
measure_id string,
start_quarter string,
start_date string,
end_quarter string,
end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures';

CREATE EXTERNAL TABLE IF NOT EXISTS surveys_responses
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip string,
country_name string,
s1 string,
s2 string,
s3 string,
s4 string,
s5 string,
s6 string,
s7 string,
s8 string,
s9 string,
s10 string,
s11 string,
s12 string,
s13 string,
s14 string,
s15 string,
s16 string,
s17 string,
s18 string,
s19 string,
s20 string,
s21 string,
s22 string,
s23 string,
s24 string,
base_score float,
consistency_score float
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';
