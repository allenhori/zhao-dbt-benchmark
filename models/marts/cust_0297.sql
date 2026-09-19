select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    median(p.v4) as s2,
    min(p.v8) as s3,
    stddev_samp(p.v4) as s4,
    max(p.v8) as s5,
    stddev_samp(p.v4) as s6
from {{ ref('int_ev_0124') }} as p
group by p.customer_id
