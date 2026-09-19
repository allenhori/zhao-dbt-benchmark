select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.m5) as s1,
    max(p.m5) as s2,
    median(p.m5) as s3,
    max(p.m8) as s4
from {{ ref('stg_ev_05') }} as p
group by p.customer_id
