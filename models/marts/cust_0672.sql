select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v1) as s1,
    max(p.v3) as s2,
    median(p.v1) as s3,
    sum(p.v1) as s4
from {{ ref('int_ev_0136') }} as p
group by p.customer_id
