select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    max(p.v5) as s2,
    sum(p.v5) as s3,
    median(p.v5) as s4
from {{ ref('int_ev_0152') }} as p
group by p.customer_id
