select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v2) as s1,
    max(p.v2) as s2,
    sum(p.v1) as s3,
    sum(p.v1) as s4,
    median(p.v3) as s5
from {{ ref('int_ev_0412') }} as p
group by p.customer_id
