select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    max(p.v2) as s2,
    max(p.v7) as s3,
    max(p.v2) as s4,
    sum(p.v2) as s5
from {{ ref('int_ev_0080') }} as p
group by p.customer_id
