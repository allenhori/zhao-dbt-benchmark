select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v3) as s1,
    max(p.v6) as s2,
    stddev_samp(p.v3) as s3,
    min(p.v6) as s4,
    max(p.v2) as s5,
    min(p.v6) as s6
from {{ ref('int_ev_0047') }} as p
group by p.customer_id
