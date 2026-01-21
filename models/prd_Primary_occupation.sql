--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table', schema='production') }}
WITH cte1 as (
SELECT
"region_name",
"state_name",
"primary_occupation_of_head_of_the_family",
 COUNT(DISTINCT "house_hold_id") AS "count_house_hold_Pri_occ"
FROM {{ref('stg_family')}}
GROUP BY "region_name","state_name","primary_occupation_of_head_of_the_family")
-- Final SELECT statement combining the outputs of all CTEs
SELECT *
FROM cte1