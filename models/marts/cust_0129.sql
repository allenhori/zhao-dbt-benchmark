select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v6) as s1,
    median(p.v3) as s2,
    median(p.v6) as s3,
    sum(p.v3) as s4
from {{ ref('int_ev_0007') }} as p
group by p.customer_id
