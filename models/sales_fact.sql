{{ config (materialized='table') }}

--with source_data as (
--    select * from  {{ source('bigquery', 'customer_tbl')  }}
--)
--select *
--from source_data limit 10


SELECT
i.invoice_no,
i.customer_no,
i.vin_no,
c.customer_name,
v.model_name,
v.sales_price_jod,
v.tax_amount,

EXTRACT(QUARTER FROM d.accounting_date) AS qtr,
EXTRACT(MONTH FROM d.accounting_date) AS month,
EXTRACT(YEAR FROM d.accounting_date) AS year



FROM {{ source('bigquery', 'Invoice_tbl')  }} i LEFT JOIN {{ source('bigquery', 'date_tbl')  }} d 
 ON i.invoice_no=d.invoice_no
 LEFT JOIN {{ source('bigquery', 'customer_tbl')  }} c 
 ON i.customer_no=c.customer_no
 LEFT JOIN {{ source('bigquery', 'vehicle')  }} v
 ON i.vin_no = v.vin_no

