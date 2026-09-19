select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v4) as s1,
    min(p.v5) as s2,
    median(p.v2) as s3,
    stddev_samp(p.v5) as s4,
    sum(p.v2) as s5,
    sum(p.v4) as s6
from {{ ref('int_ev_0188') }} as p
group by p.customer_id
