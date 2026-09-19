select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v3) as s1,
    stddev_samp(p.v3) as s2,
    sum(p.v3) as s3,
    min(p.v3) as s4,
    stddev_samp(p.v4) as s5,
    max(p.v3) as s6
from {{ ref('int_ev_0178') }} as p
group by p.customer_id
