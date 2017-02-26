DROP TABLE survey_top_performer;

CREATE TABLE survey_top_performer AS
SELECT 
provider_id,
overall_baseline,
overall_performance,
overall_achievement,
consistency_score
FROM inter_responses
WHERE overall_performance <> 9999 AND overall_achievement IN (7, 8, 9, 10) AND consistency_score >= 15;


SELECT 
survey_top_performer.provider_id,
best_hospital_final.hospital_name,
best_hospital_final.overall_rating AS overall_rating,
best_hospital_final.rank_score AS rank_score,
survey_top_performer.overall_performance,
survey_top_performer.overall_achievement,
survey_top_performer.consistency_score
FROM best_hospital_final INNER JOIN 
survey_top_performer ON best_hospital_final.provider_id = survey_top_performer.provider_id
ORDER BY rank_score
LIMIT 10;
