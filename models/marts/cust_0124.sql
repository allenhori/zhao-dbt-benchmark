select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v1) as s1,
    median(p.v1) as s2,
    stddev_samp(p.v1) as s3,
    min(p.v1) as s4,
    max(p.v2) as s5
from {{ ref('int_ev_0030') }} as p
group by p.customer_id
