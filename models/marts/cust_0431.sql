select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v8) as s1,
    median(p.v4) as s2,
    median(p.v8) as s3,
    min(p.v4) as s4,
    sum(p.v4) as s5,
    max(p.v4) as s6
from {{ ref('int_ev_0052') }} as p
group by p.customer_id
