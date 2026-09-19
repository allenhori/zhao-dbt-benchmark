select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    min(p.v1) as s2,
    median(p.v1) as s3,
    median(p.v2) as s4,
    min(p.v2) as s5,
    stddev_samp(p.v2) as s6
from {{ ref('int_ev_0434') }} as p
group by p.customer_id
