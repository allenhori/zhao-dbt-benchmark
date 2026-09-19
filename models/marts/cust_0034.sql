select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v2) as s1,
    stddev_samp(p.v4) as s2,
    max(p.v2) as s3,
    max(p.v1) as s4,
    median(p.v4) as s5
from {{ ref('int_ev_0412') }} as p
group by p.customer_id
