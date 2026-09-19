select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v3) as s1,
    median(p.v3) as s2,
    min(p.v3) as s3,
    stddev_samp(p.v3) as s4
from {{ ref('int_ev_0248') }} as p
group by p.customer_id
