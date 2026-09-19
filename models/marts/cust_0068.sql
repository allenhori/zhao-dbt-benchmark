select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v3) as s1,
    min(p.v3) as s2,
    max(p.v4) as s3,
    median(p.v3) as s4,
    median(p.v4) as s5,
    min(p.v4) as s6
from {{ ref('int_ev_0125') }} as p
group by p.customer_id
