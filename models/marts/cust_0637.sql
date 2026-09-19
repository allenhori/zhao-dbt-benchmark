select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v1) as s1,
    median(p.v2) as s2,
    stddev_samp(p.v2) as s3,
    median(p.v2) as s4,
    sum(p.v1) as s5,
    max(p.v7) as s6
from {{ ref('int_ev_0164') }} as p
group by p.customer_id
