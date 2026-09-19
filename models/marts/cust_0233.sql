select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    min(p.v2) as s2,
    stddev_samp(p.v6) as s3,
    min(p.v6) as s4
from {{ ref('int_ev_0285') }} as p
group by p.customer_id
