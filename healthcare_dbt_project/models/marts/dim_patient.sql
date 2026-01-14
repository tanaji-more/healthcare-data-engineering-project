
--added the dim_patient model to create a dimension table  for patients

{{ config (materialized = 'table') }}

select distinct
    patient_id, 
    first_name,
    last_name,
    gender,
    birth_date,
    datediff(year, birth_date, current_date) as age,
    loaded_at 
from {{ ref('stg_patients') }}
where patient_id is not null