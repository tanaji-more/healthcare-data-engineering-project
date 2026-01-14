{{ config(materialized='view') }}

select
    age::int              as age,
    sex                   as gender,
    bmi::float            as bmi,
    children::int         as children,
    smoker                as smoker_flag,
    region                as region,
    charges::float        as claim_amount,
    load_time             as loaded_at
from {{ source('raw', 'claims_csv_raw') }}
