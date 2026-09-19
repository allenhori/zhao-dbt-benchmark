select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    avg(p.v2) as s2,
    min(p.v1) as s3,
    min(p.v2) as s4,
    max(p.v2) as s5,
    median(p.v2) as s6
from {{ ref('int_ev_0343') }} as p
group by p.customer_id
