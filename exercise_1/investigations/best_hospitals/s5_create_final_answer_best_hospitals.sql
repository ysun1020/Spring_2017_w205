DROP TABLE best_hospital_final;

CREATE TABLE best_hospital_final AS
SELECT *
FROM (
SELECT
provider_id,
hospital_name,
state,
over_rating as overall_rating, 
ed_1b_rank + ed_2b_rank + imm_2_rank + imm_3_op_27_fac_adhpct_rank + op_18b_rank + op_20_rank + op_21_rank + op_22_rank + op_23_rank + op_29_rank + op_30_rank + op_4_rank + op_5_rank + pc_01_rank + stk_4_rank + vte_5_rank + vte_6_rank  + readmin_rank AS rank_score
FROM best_hospital_pvt
WHERE valid_flag = "Y" and readmin_valid_flag = "Y" and over_rating >= 4
)p
ORDER BY rank_score ASC;


SELECT *
FROM best_hospital_final
LIMIT 10;

