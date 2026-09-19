select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v1) as s1,
    max(p.v1) as s2,
    stddev_samp(p.v1) as s3,
    min(p.v1) as s4
from {{ ref('int_ev_0170') }} as p
group by p.customer_id
