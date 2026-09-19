select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v4) as s1,
    min(p.v5) as s2,
    sum(p.v5) as s3,
    max(p.v1) as s4,
    max(p.v4) as s5,
    max(p.v5) as s6
from {{ ref('int_ev_0148') }} as p
group by p.customer_id
