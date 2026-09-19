select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    median(p.v5) as s2,
    min(p.v3) as s3,
    median(p.v5) as s4,
    sum(p.v5) as s5,
    median(p.v3) as s6
from {{ ref('int_ev_0148') }} as p
group by p.customer_id
