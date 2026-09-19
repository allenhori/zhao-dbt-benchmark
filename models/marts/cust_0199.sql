select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v4) as s1,
    sum(p.v8) as s2,
    stddev_samp(p.v7) as s3,
    stddev_samp(p.v4) as s4,
    median(p.v8) as s5,
    min(p.v8) as s6
from {{ ref('int_ev_0067') }} as p
group by p.customer_id
