DROP TABLE T1;

CREATE TABLE T1 AS
SELECT p.provider_id as provider_id, p.measure_id,
       DENSE_RANK() OVER(PARTITION BY measure_id ORDER BY p.score ASC) as Rank
FROM (
SELECT *
FROM inter_effective_care
WHERE score <> 9999 AND score_unit = "min" AND sample_size >= 25 AND sample_size <> 9999 AND measure_id NOT IN("OP_1", "OP_3b")
)p;

DROP TABLE T2; 

CREATE TABLE T2 AS
SELECT p.provider_id as provider_id, p.measure_id,
       DENSE_RANK() OVER(PARTITION BY measure_id ORDER BY p.score DESC) as rank
FROM (
SELECT *
FROM inter_effective_care
WHERE score <> 9999 AND score_unit = "pct" AND sample_size >= 25 AND sample_size <> 9999 AND measure_id NOT IN("OP_2", "PC_01", "OP_22", "VTE_6", "OP_31")
)p;

DROP TABLE T3; 

CREATE TABLE T3 AS
SELECT p.provider_id as provider_id, p.measure_id,
       DENSE_RANK() OVER(PARTITION BY measure_id ORDER BY p.score ASC) as rank
FROM (
SELECT *
FROM inter_effective_care
WHERE score <> 9999 AND sample_size >= 25 AND sample_size <> 9999 AND measure_id IN("PC_01", "OP_22", "VTE_6")
)p;

