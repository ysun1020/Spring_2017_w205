DROP TABLE procedure_var_time;

CREATE TABLE procedure_var_time AS
SELECT 
p.measure_id,
p.measure_name, 
p.max_score,
p.min_score,
p.average_score,
p.stdev_score,
RANK() OVER(ORDER BY p.stdev_score DESC) AS stdev_rank,
p.range,
RANK() OVER(ORDER BY p.range DESC) AS range_rank
FROM
(
SELECT 
measure_id,
measure_name,
MAX(score) AS max_score,
MIN(score) AS min_score,
AVG(score) AS average_score,
STDDEV_SAMP(score) AS stdev_score,
MAX(score)-MIN(score) AS range
FROM inter_effective_care
WHERE score <> 9999 AND score_unit = "min" AND sample_size >= 25 AND sample_size <> 9999 AND measure_id NOT IN("OP_1", "OP_3b")
GROUP BY measure_id, measure_name
)p
ORDER BY stdev_rank;

DROP TABLE procedure_var_pct;

CREATE TABLE procedure_var_pct AS
SELECT 
p.measure_id,
p.measure_name, 
p.max_score,
p.min_score,
p.average_score,
p.stdev_score,
RANK() OVER(ORDER BY p.stdev_score DESC) AS stdev_rank
FROM
(
SELECT 
measure_id,
measure_name,
MAX(score) AS max_score,
MIN(score) AS min_score,
AVG(score) AS average_score,
STDDEV_SAMP(score) AS stdev_score
FROM inter_effective_care
WHERE score <> 9999 AND score_unit = "pct" AND sample_size >= 25 AND sample_size <> 9999 AND measure_id NOT IN("OP_2", "OP_31")
GROUP BY measure_id, measure_name
)p
ORDER BY stdev_rank;
