select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    median(p.v3) as s2,
    median(p.v2) as s3,
    max(p.v2) as s4
from {{ ref('int_ev_0311') }} as p
group by p.customer_id
