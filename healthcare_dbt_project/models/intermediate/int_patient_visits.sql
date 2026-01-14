
-- patient-appointment fact-style table.


{{ config(materialized= 'view')}}

select 
    p.patient_id,
    p.first_name,
    p.last_name,
    p.gender,
    p.birth_date,

    v.appointment_id,
    v.appointment_date,
    v.scheduled_datetime,
    v.age as appointment_age,
    v.neighbourhood,
    v.scholarship_flag,
    v.hypertension_flag,
    v.diabetes_flag,
    v.alcoholism_flag,
    v.handicap_flag,
    v.sms_received_flag,
    v.no_show_flag,

    v.loaded_at as visit_loaded_at,

from {{ ref('stg_patients') }} p
left join {{ ref ('stg_visits') }} v
    on p.patient_id = v.patient_id