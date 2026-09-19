select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    min(p.v2) as s2,
    stddev_samp(p.v7) as s3,
    stddev_samp(p.v2) as s4
from {{ ref('int_ev_0286') }} as p
group by p.customer_id
