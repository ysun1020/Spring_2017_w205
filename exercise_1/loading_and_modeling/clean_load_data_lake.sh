#!/bin/bash

# Save current directory 

MY_CWD=$(pwd)

# Empty and remove staging directories

rm ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging

# Remove files from hdfs
hdfs dfs -rm /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care/effective_care.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare/measures/measures.csv
hdfs dfs -rm /user/w205/hospital_compare/surveys_responses/surveys_responses.csv

#Remove hdfs directories

hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/measures
hdfs dfs -rmdir /user/w205/hospital_compare/surveys_responses

hdfs dfs -rmdir /user/w205/hospital_compare

# Change directory back to original

cd $MY_CWD

# Clean Exit 

exit


