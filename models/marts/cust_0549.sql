select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v1) as s1,
    min(p.v1) as s2,
    min(p.v4) as s3,
    sum(p.v4) as s4,
    median(p.v1) as s5
from {{ ref('int_ev_0340') }} as p
group by p.customer_id
