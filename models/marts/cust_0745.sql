select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.m3) as s1,
    sum(p.m4) as s2,
    median(p.m4) as s3,
    min(p.m3) as s4,
    sum(p.m10) as s5
from {{ ref('stg_ev_02') }} as p
group by p.customer_id
