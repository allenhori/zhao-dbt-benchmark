select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v2) as s1,
    stddev_samp(p.v2) as s2,
    median(p.v8) as s3,
    stddev_samp(p.v2) as s4,
    max(p.v8) as s5,
    stddev_samp(p.v8) as s6
from {{ ref('int_ev_0071') }} as p
group by p.customer_id
