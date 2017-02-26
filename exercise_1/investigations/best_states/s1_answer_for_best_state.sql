SELECT *
FROM (
SELECT 
state,
COUNT(provider_id) AS num_hospitals,
AVG(rank_score) as avg_hospital_rank_score
FROM best_hospital_final
GROUP BY state
)p
WHERE num_hospitals >= 10
ORDER BY avg_hospital_rank_score ASC
LIMIT 10;
