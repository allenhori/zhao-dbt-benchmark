select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    stddev_samp(p.v6) as s2,
    min(p.v2) as s3,
    median(p.v6) as s4,
    median(p.v2) as s5,
    sum(p.v2) as s6
from {{ ref('int_ev_0325') }} as p
group by p.customer_id
