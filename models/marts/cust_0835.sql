select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v7) as s1,
    min(p.v2) as s2,
    min(p.v2) as s3,
    stddev_samp(p.v7) as s4,
    stddev_samp(p.v2) as s5,
    stddev_samp(p.v2) as s6
from {{ ref('int_ev_0074') }} as p
group by p.customer_id
