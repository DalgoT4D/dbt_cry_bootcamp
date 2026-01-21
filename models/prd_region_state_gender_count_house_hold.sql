--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table', schema='production') }}
WITH cte1 as (
SELECT
"region_name",
"state_name",
"gender",
 COUNT(DISTINCT "house_hold_id") AS "count_house_hold"
FROM {{ref('stg_family')}}
GROUP BY "region_name","state_name","gender")
-- Final SELECT statement combining the outputs of all CTEs
SELECT *
FROM cte1