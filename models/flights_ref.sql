{{ config (materialized='table') }}

with source_data as (
    select * from  {{ source('bigquery', 'rawflights')  }}

)
select *
from source_data