select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v2) as s1,
    min(p.v1) as s2,
    median(p.v3) as s3,
    min(p.v3) as s4,
    stddev_samp(p.v2) as s5
from {{ ref('int_ev_0196') }} as p
group by p.customer_id
