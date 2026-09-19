select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v4) as s1,
    max(p.v5) as s2,
    stddev_samp(p.v4) as s3,
    max(p.v5) as s4,
    median(p.v4) as s5,
    sum(p.v4) as s6
from {{ ref('int_ev_0091') }} as p
group by p.customer_id
