select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    max(p.v2) as s2,
    sum(p.v1) as s3,
    max(p.v1) as s4
from {{ ref('int_ev_0110') }} as p
group by p.customer_id
