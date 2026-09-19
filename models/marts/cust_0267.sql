select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v1) as s1,
    sum(p.v1) as s2,
    median(p.v2) as s3,
    sum(p.v1) as s4,
    sum(p.v2) as s5
from {{ ref('int_ev_0416') }} as p
group by p.customer_id
