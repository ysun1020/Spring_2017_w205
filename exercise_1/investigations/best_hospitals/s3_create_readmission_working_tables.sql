
DROP TABLE R1;

CREATE TABLE R1 AS
SELECT
p.provider_id,
p.num_valid_score,
CASE WHEN p.num_valid_score >= 8 THEN "Y"
ELSE "N" END AS readmin_valid_flag,
p.national_compare_score_total
FROM (
SELECT 
provider_id,
sum(national_compare_score) as national_compare_score_total,
count(national_compare_score) num_valid_score
FROM inter_readmission 
WHERE national_compare_score <> 9999 and sample_size >= 25
GROUP BY provider_id
)p;

DROP TABLE R2;

CREATE TABLE R2 AS
SELECT 
provider_id,
num_valid_score,
readmin_valid_flag,
national_compare_score_total,
DENSE_RANK() OVER(ORDER BY national_compare_score_total DESC) as RANK
FROM R1;
