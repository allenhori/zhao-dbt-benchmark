select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    median(p.v2) as s2,
    sum(p.v2) as s3,
    median(p.v3) as s4,
    median(p.v2) as s5,
    min(p.v2) as s6
from {{ ref('int_ev_0423') }} as p
group by p.customer_id
