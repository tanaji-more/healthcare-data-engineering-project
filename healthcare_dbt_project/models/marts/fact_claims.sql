-- added stg_claims as fact_claims table

{{ config (materialized= 'table') }}

select 
    claim_amount,
    region,
    smoker_flag,
    bmi,
    children,
    age,
    loaded_at
from {{ ref ('stg_claims') }}