DROP TABLE inter_effective_care;

CREATE TABLE inter_effective_care AS
SELECT 
provider_id, 
concat(provider_id, measure_id) AS unique_id,	
condition,
measure_ID as measure_id, 
measure_name, 
CASE WHEN score = "Not Available" THEN 9999
WHEN score = "Very High (60,000+ patients annually)" THEN 60000
WHEN score = "High (40,000 - 59,999 patients annually)" THEN 40000
WHEN score = "Medium (20,000 - 39,999 patients annually)" THEN 20000
WHEN score = "Low (0 - 19,999 patients annually)" THEN 5000
ELSE CAST(score as int) END AS score,
CASE WHEN measure_ID in ("ED_1b", "ED_2b", "OP_1", "OP_18b", "OP_20", "OP_21", "OP_3b", "OP_5") THEN "min"
WHEN measure_ID = "EDV" THEN "volume"
ELSE "pct" END AS score_unit,
CASE WHEN sample in ("Not Available", "") THEN 9999
ELSE CAST(sample as int) END AS sample_size,
measure_start_date,
measure_end_date
FROM effective_care;
