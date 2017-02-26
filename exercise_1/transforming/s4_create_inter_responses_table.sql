DROP TABLE inter_responses;

CREATE TABLE inter_responses AS
SELECT
provider_id,
CAST(communication_with_nurses_floor AS float) AS nurses_floor,
CAST(communication_with_nurses_achievement AS float) AS nurses_threshold,
CAST(communication_with_nurses_benchmark AS float) AS nurses_benchmark,
CASE WHEN communication_with_nurses_baseline_rate = "Not Available" THEN 9999
ELSE CAST(communication_with_nurses_baseline_rate AS float) END AS nurses_baseline,
CASE WHEN communication_with_nurses_performance_rate = "Not Available" THEN 9999
ELSE CAST(communication_with_nurses_performance_rate AS float) END AS nurses_performance,
CASE WHEN communication_with_nurses_achievement_points = "Not Available" THEN 9999
WHEN communication_with_nurses_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(communication_with_nurses_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(communication_with_nurses_achievement_points,0,1) AS int) END AS nurses_achievement,
CASE WHEN communication_with_nurses_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(communication_with_nurses_improvement_points,0,1) AS int) END AS nurses_improvement,

CAST(communication_with_doctors_floor AS float) AS doctors_floor,
CAST(communication_with_doctors_achievement AS float) AS doctors_threshold,
CAST(communication_with_doctors_benchmark AS float) AS doctors_benchmark,
CASE WHEN communication_with_doctors_baseline_rate = "Not Available" THEN 9999
ELSE CAST(communication_with_doctors_baseline_rate AS float) END AS doctors_baseline,
CASE WHEN communication_with_doctors_performance_rate = "Not Available" THEN 9999
ELSE CAST(communication_with_doctors_performance_rate AS float) END AS doctors_performance,
CASE WHEN communication_with_doctors_achievement_points = "Not Available" THEN 9999
WHEN communication_with_doctors_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(communication_with_doctors_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(communication_with_doctors_achievement_points,0,1) AS int) END AS doctors_achievement,
CASE WHEN communication_with_doctors_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(communication_with_doctors_improvement_points,0,1) AS int) END AS doctors_improvement,

CAST(responsiveness_of_hospital_staff_floor AS float) AS responsiveness_floor,
CAST(responsiveness_of_hospital_staff_achievement_threshold AS float) AS responsiveness_threshold,
CAST(responsiveness_of_hospital_staff_benchmark AS float) AS responsiveness_benchmark,
CASE WHEN responsiveness_of_hospital_staff_baseline_rate = "Not Available" THEN 9999
ELSE CAST(responsiveness_of_hospital_staff_baseline_rate AS float) END AS responsiveness_baseline,
CASE WHEN responsiveness_of_hospital_staff_performance_rate = "Not Available" THEN 9999
ELSE CAST(responsiveness_of_hospital_staff_performance_rate AS float) END AS responsiveness_performance,
CASE WHEN responsiveness_of_hospital_staff_achievement_points = "Not Available" THEN 9999
WHEN responsiveness_of_hospital_staff_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(responsiveness_of_hospital_staff_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(responsiveness_of_hospital_staff_achievement_points,0,1) AS int) END AS responsiveness_achievement,
CASE WHEN responsiveness_of_hospital_staff_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(responsiveness_of_hospital_staff_improvement_points,0,1) AS int) END AS responsiveness_improvement,

CAST(pain_management_floor AS float) AS pain_floor,
CAST(pain_management_achievement_threshold AS float) AS pain_threshold,
CAST(pain_management_benchmark AS float) AS pain_benchmark,
CASE WHEN pain_management_baseline_rate = "Not Available" THEN 9999
ELSE CAST(pain_management_baseline_rate AS float) END AS pain_baseline,
CASE WHEN pain_management_performance_rate = "Not Available" THEN 9999
ELSE CAST(pain_management_performance_rate AS float) END AS pain_performance,
CASE WHEN pain_management_achievement_points = "Not Available" THEN 9999
WHEN pain_management_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(pain_management_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(pain_management_achievement_points,0,1) AS int) END AS pain_achievement,
CASE WHEN pain_management_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(pain_management_improvement_points,0,1) AS int) END AS pain_improvement,

CAST(communication_about_medicines_floor AS float) AS medicine_floor,
CAST(communication_about_medicines_achievement_threshold AS float) AS medicine_threshold,
CAST(communication_about_medicines_benchmark AS float) AS medicine_benchmark,
CASE WHEN communication_about_medicines_baseline_rate = "Not Available" THEN 9999
ELSE CAST(communication_about_medicines_baseline_rate AS float) END AS medicine_baseline,
CASE WHEN communication_about_medicines_performance_rate = "Not Available" THEN 9999
ELSE CAST(communication_about_medicines_performance_rate AS float) END AS medicine_performance,
CASE WHEN communication_about_medicines_achievement_points = "Not Available" THEN 9999
WHEN communication_about_medicines_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(communication_about_medicines_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(communication_about_medicines_achievement_points,0,1) AS int) END AS medicine_achievement,
CASE WHEN communication_about_medicines_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(communication_about_medicines_improvement_points,0,1) AS int) END AS medicine_improvement,

CAST(cleanliness_and_quietness_of_hospital_environment_floor AS float) AS cleanliness_floor,
CAST(cleanliness_and_quietness_of_hospital_environment_achievement_threshold AS float) AS cleanliness_threshold,
CAST(cleanliness_and_quietness_of_hospital_environment_benchmark AS float) AS cleanliness_benchmark,
CASE WHEN cleanliness_and_quietness_of_hospital_environment_baseline_rate = "Not Available" THEN 9999
ELSE CAST(cleanliness_and_quietness_of_hospital_environment_baseline_rate AS float) END AS cleanliness_baseline,
CASE WHEN cleanliness_and_quietness_of_hospital_environment_performance_rate = "Not Available" THEN 9999
ELSE CAST(cleanliness_and_quietness_of_hospital_environment_performance_rate AS float) END AS cleanliness_performance,
CASE WHEN cleanliness_and_quietness_of_hospital_environment_achievement_points = "Not Available" THEN 9999
WHEN cleanliness_and_quietness_of_hospital_environment_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(cleanliness_and_quietness_of_hospital_environment_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(cleanliness_and_quietness_of_hospital_environment_achievement_points,0,1) AS int) END AS cleanliness_achievement,
CASE WHEN cleanliness_and_quietness_of_hospital_environment_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(cleanliness_and_quietness_of_hospital_environment_improvement_points,0,1) AS int) END AS cleanliness_improvement,

CAST(discharge_information_floor AS float) AS discharge_floor,
CAST(discharge_information_achievement_threshold AS float) AS discharge_threshold,
CAST(discharge_information_benchmark AS float) AS discharge_benchmark,
CASE WHEN discharge_information_baseline_rate = "Not Available" THEN 9999
ELSE CAST(discharge_information_baseline_rate AS float) END AS discharge_baseline,
CASE WHEN discharge_information_performance_rate = "Not Available" THEN 9999
ELSE CAST(discharge_information_performance_rate AS float) END AS discharge_performance,
CASE WHEN discharge_information_achievement_points = "Not Available" THEN 9999
WHEN discharge_information_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(discharge_information_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(discharge_information_achievement_points,0,1) AS int) END AS discharge_achievement,
CASE WHEN discharge_information_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(discharge_information_improvement_points,0,1) AS int) END AS discharge_improvement,

CAST(overall_rating_of_hospital_floor AS float) AS overall_floor,
CAST(overall_rating_of_hospital_achievement_threshold AS float) AS overall_threshold,
CAST(overall_rating_of_hospital_benchmark AS float) AS overall_benchmark,
CASE WHEN overall_rating_of_hospital_baseline_rate = "Not Available" THEN 9999
ELSE CAST(overall_rating_of_hospital_baseline_rate AS float) END AS overall_baseline,
CASE WHEN overall_rating_of_hospital_performance_rate = "Not Available" THEN 9999
ELSE CAST(overall_rating_of_hospital_performance_rate AS float) END AS overall_performance,
CASE WHEN overall_rating_of_hospital_achievement_points = "Not Available" THEN 9999
WHEN overall_rating_of_hospital_achievement_points = "10 out of 10" 
THEN CAST(SUBSTRING(overall_rating_of_hospital_achievement_points,0,2) AS int)
ELSE CAST(SUBSTRING(overall_rating_of_hospital_achievement_points,0,1) AS int) END AS overall_achievement,
CASE WHEN overall_rating_of_hospital_improvement_points = "Not Available" THEN 9999
ELSE CAST(SUBSTRING(overall_rating_of_hospital_improvement_points,0,1) AS int) END AS overall_improvement,
CASE WHEN HCAHPS_base_score = "Not Available" THEN 9999
ELSE CAST(HCAHPS_base_score as float) END AS base_score,
CASE WHEN HCAHPS_consistency_score = "Not Available" THEN 9999
ELSE CAST(HCAHPS_consistency_score as float) END AS consistency_score
FROM surveys_responses;
