select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v4) as s1,
    median(p.v1) as s2,
    min(p.v1) as s3,
    max(p.v5) as s4
from {{ ref('int_ev_0048') }} as p
group by p.customer_id
