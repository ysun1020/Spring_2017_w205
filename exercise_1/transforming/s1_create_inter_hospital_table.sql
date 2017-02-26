DROP TABLE inter_hospital;

CREATE TABLE inter_hospital AS
SELECT 
provider_id, 
hospital_name,
address,
city,
state,
zip_code,
county_name,
hospital_type,
emergency_services,
CASE WHEN hospital_overall_rating = "Not Available" THEN 9999
ELSE CAST(hospital_overall_rating as decimal(1,0)) END AS rating
FROM hospitals;
