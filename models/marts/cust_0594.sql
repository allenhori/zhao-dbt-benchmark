select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    median(p.v4) as s2,
    sum(p.v7) as s3,
    median(p.v3) as s4,
    sum(p.v4) as s5
from {{ ref('int_ev_0206') }} as p
group by p.customer_id
