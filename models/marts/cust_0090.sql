select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    median(p.v2) as s2,
    sum(p.v2) as s3,
    median(p.v7) as s4,
    max(p.v7) as s5,
    max(p.v7) as s6
from {{ ref('int_ev_0049') }} as p
group by p.customer_id
