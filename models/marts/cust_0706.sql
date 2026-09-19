select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.m6) as s1,
    stddev_samp(p.m6) as s2,
    median(p.m5) as s3,
    avg(p.m11) as s4
from {{ ref('stg_ev_00') }} as p
group by p.customer_id
