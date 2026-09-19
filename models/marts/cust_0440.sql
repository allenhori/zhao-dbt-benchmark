select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v8) as s1,
    sum(p.v1) as s2,
    median(p.v8) as s3,
    min(p.v2) as s4,
    sum(p.v8) as s5,
    sum(p.v2) as s6
from {{ ref('int_ev_0039') }} as p
group by p.customer_id
