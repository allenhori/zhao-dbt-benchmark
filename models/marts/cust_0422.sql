select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.m10) as s1,
    stddev_samp(p.m3) as s2,
    min(p.m10) as s3,
    max(p.m3) as s4
from {{ ref('stg_ev_01') }} as p
group by p.customer_id
