select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v1) as s1,
    max(p.v7) as s2,
    max(p.v1) as s3,
    max(p.v7) as s4,
    stddev_samp(p.v7) as s5,
    min(p.v1) as s6
from {{ ref('int_ev_0321') }} as p
group by p.customer_id
