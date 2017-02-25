#!/bin/bash

# Save current directory

MY_CWD=$(pwd)

# Create staging directories

mkdir ~/staging
mkdir ~/staging/exercise_1

# Change to staging directory

cd ~/staging/exercise_1

# Get file from data.medicare.gov

MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicaredata.zip

# Unzip data

unzip medicaredata.zip

# Remove first line of files and rename - 5 files total

OLD_1_FILE="Hospital General Information.csv"
NEW_1_FILE="hospitals.csv"
tail -n +2 "$OLD_1_FILE" >$NEW_1_FILE

OLD_2_FILE="Timely and Effective Care - Hospital.csv"
NEW_2_FILE="effective_care.csv"
tail -n +2 "$OLD_2_FILE" >$NEW_2_FILE

OLD_3_FILE="Readmissions and Deaths - Hospital.csv"
NEW_3_FILE="readmissions.csv"
tail -n +2 "$OLD_3_FILE" >$NEW_3_FILE

OLD_4_FILE="Measure Dates.csv"
NEW_4_FILE="measures.csv"
tail -n +2 "$OLD_4_FILE" >$NEW_4_FILE

OLD_5_FILE="hvbp_hcahps_11_10_2016.csv"
NEW_5_FILE="surveys_responses.csv"
tail -n +2 "$OLD_5_FILE" >$NEW_5_FILE

#Create main comparison hdfs directory

hdfs dfs -mkdir /user/w205/hospital_compare

# Create hdfs directory for each file and copy each file to hdfs

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -put $NEW_1_FILE /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -put $NEW_2_FILE /user/w205/hospital_compare/effective_care

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put $NEW_3_FILE /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put $NEW_4_FILE /user/w205/hospital_compare/measures

hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
hdfs dfs -put $NEW_5_FILE /user/w205/hospital_compare/surveys_responses

# Change directory back to original

cd $MY_CWD

# Clean Exit

exit


