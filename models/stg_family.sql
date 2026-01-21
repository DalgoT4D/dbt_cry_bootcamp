--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table', schema='staging') }}
WITH cte2 as (
SELECT "caste", "gender", "religion", "state_name", "region_name", "beneficiary_id", "type_of_ration_card", "average_monthly_income_of_the_family", "primary_occupation_of_head_of_the_family"
FROM {{ source('CRY_Programme_data_dalgo', 'Family_information') }}
) , cte1 as (
SELECT "caste", "gender", "religion", "state_name", "region_name", "type_of_ration_card", "average_monthly_income_of_the_family", "primary_occupation_of_head_of_the_family", "beneficiary_id" AS "house_hold_id"
 FROM cte2
)
-- Final SELECT statement combining the outputs of all CTEs
SELECT *
FROM cte1