select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.m11) as s1,
    sum(p.m11) as s2,
    stddev_samp(p.m11) as s3,
    stddev_samp(p.m11) as s4,
    sum(p.m4) as s5,
    stddev_samp(p.m12) as s6
from {{ ref('stg_ev_02') }} as p
group by p.customer_id
