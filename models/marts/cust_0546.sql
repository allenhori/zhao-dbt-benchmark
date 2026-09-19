select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v3) as s1,
    min(p.v4) as s2,
    stddev_samp(p.v3) as s3,
    min(p.v4) as s4,
    max(p.v1) as s5,
    median(p.v1) as s6
from {{ ref('int_ev_0194') }} as p
group by p.customer_id
