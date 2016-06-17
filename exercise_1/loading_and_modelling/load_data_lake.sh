mkdir tmp
cd tmp
wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
unzip Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary

mkdir useful_data
tail -n +2 Hospital\ General\ Information.csv > useful_data/hospitals.csv
tail -n +2 Timely\ and\ Effective\ Care\ -\ Hospital.csv > useful_data/effective_care.csv
tail -n +2 Readmissions\ and\ Deaths\ -\ Hospital.csv > useful_data/readmissions.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > useful_data/surveys_responses.csv
tail -n +2 Measure\ Dates.csv > useful_data/Measures.csv

cd useful_data
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care/effective_care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions/readmissions
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys_responses/surveys_responses
hdfs dfs -put Measures.csv /user/w205/hospital_compare/Measures/Measures


