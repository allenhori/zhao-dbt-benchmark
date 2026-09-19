select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    sum(p.v2) as s2,
    max(p.v2) as s3,
    stddev_samp(p.v2) as s4
from {{ ref('int_ev_0258') }} as p
group by p.customer_id
