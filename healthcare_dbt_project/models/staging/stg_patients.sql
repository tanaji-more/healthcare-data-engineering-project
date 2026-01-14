{{ config(materialized='view') }}

with source_data as (

    select
        f.value:id::string                            as patient_id,
        f.value:name[0].given[0]::string             as first_name,
        f.value:name[0].family::string               as last_name,
        f.value:gender::string                       as gender,
        f.value:birthDate::date                      as birth_date,
        current_timestamp()                          as loaded_at
    from {{ source('raw', 'patients_api_raw') }},
         lateral flatten(input => raw_data) f

)

select * from source_data
