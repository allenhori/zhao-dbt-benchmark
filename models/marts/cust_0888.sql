select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v3) as s1,
    median(p.v4) as s2,
    min(p.v2) as s3,
    stddev_samp(p.v4) as s4,
    max(p.v3) as s5
from {{ ref('int_ev_0158') }} as p
group by p.customer_id
