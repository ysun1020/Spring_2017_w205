DROP TABLE inter_readmission;

CREATE TABLE inter_readmission AS
SELECT 
provider_id,
CONCAT(provider_id, measure_id) AS unique_id,
measure_id,
measure_name,
compared_to_national,
CASE WHEN compared_to_national="No Different than the National Rate" THEN 0
WHEN compared_to_national="Worse than the National Rate" THEN -1
WHEN compared_to_national="Better than the National Rate" THEN 1
ELSE 9999 END AS national_compare_score,
denominator AS sample_size,
CAST(score as decimal(1,0)) AS score,
CAST(lower_estimate as decimal(1,0)) AS lower_estimate,
CAST(higher_estimate as decimal(1,0)) as higher_estimate,
measure_start_date,
measure_end_date
FROM readmissions;
