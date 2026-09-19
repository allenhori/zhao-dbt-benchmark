select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.m5) as s1,
    sum(p.m10) as s2,
    min(p.m5) as s3,
    max(p.m5) as s4,
    max(p.m10) as s5,
    max(p.m5) as s6
from {{ ref('stg_ev_00') }} as p
group by p.customer_id
