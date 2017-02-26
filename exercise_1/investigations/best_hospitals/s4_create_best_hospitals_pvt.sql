DROP TABLE best_hospital_pvt;

CREATE TABLE best_hospital_pvt AS
SELECT 
inter_hospital.provider_id AS provider_id,
inter_hospital.hospital_name AS hospital_name,
inter_hospital.state AS state,
inter_hospital.rating AS over_rating,
valid_score.num_valid_score AS num_valid_score,
valid_flag AS valid_flag,
CASE WHEN r2.readmin_valid_flag IS NULL THEN "N"
ELSE r2.readmin_valid_flag END AS readmin_valid_flag,
CASE WHEN ed_1b.rank IS NULL THEN 0
ELSE ed_1b.rank END AS ed_1b_rank,
CASE WHEN ed_2b.rank IS NULL THEN 0
ELSE ed_2b.rank END AS ed_2b_rank,
CASE WHEN imm_2.rank IS NULL THEN 0
ELSE imm_2.rank END AS imm_2_rank,
CASE WHEN imm_3_op_27_fac_adhpct.rank IS NULL THEN 0
ELSE imm_3_op_27_fac_adhpct.rank END AS imm_3_op_27_fac_adhpct_rank,
CASE WHEN op_18b.rank IS NULL THEN 0
ELSE op_18b.rank END AS op_18b_rank,
CASE WHEN op_20.rank IS NULL THEN 0
ELSE op_20.rank END AS op_20_rank,
CASE WHEN op_21.rank IS NULL THEN 0
ELSE op_21.rank END AS op_21_rank,
CASE WHEN op_22.rank IS NULL THEN 0
ELSE op_22.rank END AS op_22_rank,
CASE WHEN op_23.rank IS NULL THEN 0
ELSE op_23.rank END AS op_23_rank,
CASE WHEN op_29.rank IS NULL THEN 0
ELSE op_29.rank END AS op_29_rank,
CASE WHEN op_30.rank IS NULL THEN 0
ELSE op_30.rank END AS op_30_rank,
CASE WHEN op_4.rank IS NULL THEN 0
ELSE op_4.rank END AS op_4_rank,
CASE WHEN op_5.rank IS NULL THEN 0
ELSE op_5.rank END AS op_5_rank,
CASE WHEN pc_01.rank IS NULL THEN 0
ELSE pc_01.rank END AS pc_01_rank,
CASE WHEN stk_4.rank IS NULL THEN 0
ELSE stk_4.rank END AS stk_4_rank,
CASE WHEN vte_5.rank IS NULL THEN 0
ELSE vte_5.rank END AS vte_5_rank,
CASE WHEN vte_6.rank IS NULL THEN 0
ELSE vte_6.rank END AS vte_6_rank,
CASE WHEN r2.rank IS NULL THEN 0
ELSE r2.rank END AS readmin_rank 
FROM inter_hospital 
LEFT JOIN valid_score on inter_hospital.provider_id = valid_score.provider_id
LEFT JOIN ed_1b on inter_hospital.provider_id = ed_1b.provider_id
LEFT JOIN ed_2b on inter_hospital.provider_id = ed_2b.provider_id
LEFT JOIN imm_2 on inter_hospital.provider_id = imm_2.provider_id
LEFT JOIN imm_3_op_27_fac_adhpct on inter_hospital.provider_id = imm_3_op_27_fac_adhpct.provider_id
LEFT JOIN op_18b on inter_hospital.provider_id = op_18b.provider_id
LEFT JOIN op_20 ON inter_hospital.provider_id = op_20.provider_id
LEFT JOIN op_21 ON inter_hospital.provider_id = op_21.provider_id
LEFT JOIN op_22 ON inter_hospital.provider_id = op_22.provider_id
LEFT JOIN op_23 ON inter_hospital.provider_id = op_23.provider_id  
LEFT JOIN op_29 ON inter_hospital.provider_id = op_29.provider_id
LEFT JOIN op_30 ON inter_hospital.provider_id = op_30.provider_id
LEFT JOIN op_4 ON inter_hospital.provider_id = op_4.provider_id
LEFT JOIN op_5 ON inter_hospital.provider_id = op_5.provider_id
LEFT JOIN pc_01 ON inter_hospital.provider_id = pc_01.provider_id
LEFT JOIN stk_4 ON inter_hospital.provider_id = stk_4.provider_id
LEFT JOIN vte_5 ON inter_hospital.provider_id = vte_5.provider_id
LEFT JOIN vte_6 ON inter_hospital.provider_id = vte_6.provider_id
LEFT JOIN R2 on inter_hospital.provider_id = R2.provider_id
WHERE inter_hospital.rating <> 9999;


