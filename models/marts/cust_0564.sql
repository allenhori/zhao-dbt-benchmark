select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    max(p.v4) as s2,
    max(p.v4) as s3,
    sum(p.v5) as s4,
    stddev_samp(p.v5) as s5,
    median(p.v4) as s6
from {{ ref('int_ev_0245') }} as p
group by p.customer_id
