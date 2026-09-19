select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.m1) as s1,
    sum(p.m1) as s2,
    sum(p.m1) as s3,
    min(p.m4) as s4,
    min(p.m4) as s5
from {{ ref('stg_ev_00') }} as p
group by p.customer_id
