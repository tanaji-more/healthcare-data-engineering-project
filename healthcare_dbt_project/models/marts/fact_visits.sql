-- added stg_visits as fact_visits table

{{ config (materialized= 'table') }} 

select 
    appointment_id,
    patient_id,
    appointment_date,
    scheduled_datetime,
    age,
    neighbourhood,
    scholarship_flag,
    hypertension_flag,
    diabetes_flag,
    alcoholism_flag,
    handicap_flag,
    sms_received_flag,  
    no_show_flag,
    loaded_at

from {{ ref ('stg_visits') }}

