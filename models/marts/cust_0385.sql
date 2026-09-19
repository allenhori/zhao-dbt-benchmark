select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    min(p.v2) as s2,
    median(p.v3) as s3,
    sum(p.v2) as s4,
    stddev_samp(p.v3) as s5
from {{ ref('int_ev_0012') }} as p
group by p.customer_id
