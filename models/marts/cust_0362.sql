select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v7) as s1,
    min(p.v7) as s2,
    sum(p.v1) as s3,
    sum(p.v1) as s4,
    max(p.v1) as s5,
    max(p.v1) as s6
from {{ ref('int_ev_0391') }} as p
group by p.customer_id
