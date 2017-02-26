SELECT
measure_id, 
"responsiveness" as survey_category,
stdev_score,
stdev_rank
FROM procedure_var_time
WHERE measure_id IN ("ED_1b", "ED_2b");

SELECT
measure_id, 
CASE WHEN measure_id in ("OP_29", "OP_30") THEN "comm_with_docs"
WHEN measure_id = "VTE_5" THEN "medicine" END AS survey_category,
stdev_score,
stdev_rank
FROM procedure_var_pct
WHERE measure_id IN ("OP_29", "OP_30", "VTE_5");

SELECT 
STDDEV_SAMP(nurses_performance) AS stdev_nurses,
STDDEV_SAMP(doctors_performance) AS stdev_doctors,
STDDEV_SAMP(responsiveness_performance) AS stdev_responsiveness,
STDDEV_SAMP(pain_performance) AS stdev_pain,
STDDEV_SAMP(medicine_performance) AS stdev_medicine,
STDDEV_SAMP(cleanliness_performance) AS stdev_cleanliness,
STDDEV_SAMP(discharge_performance) AS stdev_discharge
FROM inter_responses
WHERE
nurses_performance <> 9999 AND
doctors_performance <> 9999 AND
responsiveness_performance <> 9999 AND
pain_performance <> 9999 AND
medicine_performance <> 9999 AND
cleanliness_performance <> 9999 AND
discharge_performance <> 9999;
