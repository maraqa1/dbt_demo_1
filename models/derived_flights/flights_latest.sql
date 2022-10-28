{{ config (
    materialized='table'
) 

}}

with source_data as (
    select * from  {{ source('bigquery', 'flights') }}

)
select * from source_data