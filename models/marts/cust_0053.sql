select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v3) as s1,
    min(p.v1) as s2,
    median(p.v3) as s3,
    sum(p.v1) as s4,
    avg(p.v1) as s5,
    sum(p.v3) as s6
from {{ ref('int_ev_0274') }} as p
group by p.customer_id
