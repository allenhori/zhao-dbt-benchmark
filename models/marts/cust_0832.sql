select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v1) as s1,
    max(p.v7) as s2,
    max(p.v1) as s3,
    max(p.v3) as s4
from {{ ref('int_ev_0296') }} as p
group by p.customer_id
