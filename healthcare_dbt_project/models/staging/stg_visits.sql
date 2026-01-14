{{ config(materialized='view') }}

select
    PatientId::string          as patient_id,
    AppointmentID::string      as appointment_id,
    Gender::string             as gender,
    ScheduledDay::timestamp    as scheduled_datetime,
    AppointmentDay::date       as appointment_date,
    Age::int                   as age,
    Neighbourhood::string      as neighbourhood,
    Scholarship::int           as scholarship_flag,
    Hipertension::int          as hypertension_flag,
    Diabetes::int              as diabetes_flag,
    Alcoholism::int            as alcoholism_flag,
    Handcap::int               as handicap_flag,
    SMS_received::int          as sms_received_flag,
    No_show::string          as no_show_flag,
    load_time                  as loaded_at
from {{ source('raw', 'visits_operational_raw') }}
