select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    sum(p.v5) as s2,
    min(p.v5) as s3,
    stddev_samp(p.v2) as s4,
    min(p.v2) as s5,
    max(p.v2) as s6
from {{ ref('int_ev_0202') }} as p
group by p.customer_id
