-- patient + claims.fact-style table.

{{ config (materialized='view')}}

select
    p.patient_id,
    p.first_name,
    p.last_name,
    p.gender,
    p.birth_date,
    c.claim_amount,
    c.age as claim_age,
    c.gender as claim_gender,
    c.region,
    c.smoker_flag,
    c.bmi,
    c.children,
    c.loaded_at as claim_loaded_at

from {{ ref('stg_patients') }} p
left join {{ ref ('stg_claims') }} c
    on p.gender = c.gender
    and datediff(year, p.birth_date, current_date) between c.age - 2 and c.age + 2