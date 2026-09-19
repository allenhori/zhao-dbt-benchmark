select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    min(p.v7) as s2,
    max(p.v7) as s3,
    max(p.v1) as s4
from {{ ref('int_ev_0207') }} as p
group by p.customer_id
