select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v4) as s1,
    max(p.v4) as s2,
    min(p.v3) as s3,
    min(p.v6) as s4,
    stddev_samp(p.v4) as s5
from {{ ref('int_ev_0389') }} as p
group by p.customer_id
