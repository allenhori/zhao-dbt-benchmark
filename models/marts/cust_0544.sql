select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v7) as s1,
    median(p.v7) as s2,
    max(p.v7) as s3,
    stddev_samp(p.v2) as s4,
    median(p.v7) as s5,
    sum(p.v7) as s6
from {{ ref('int_ev_0386') }} as p
group by p.customer_id
