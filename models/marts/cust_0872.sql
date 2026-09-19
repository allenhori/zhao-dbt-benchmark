select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    median(p.v5) as s2,
    median(p.v1) as s3,
    max(p.v5) as s4,
    sum(p.v1) as s5,
    avg(p.v7) as s6
from {{ ref('int_ev_0276') }} as p
group by p.customer_id
