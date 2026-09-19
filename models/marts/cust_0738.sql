select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    stddev_samp(p.v5) as s2,
    median(p.v7) as s3,
    min(p.v7) as s4,
    sum(p.v7) as s5
from {{ ref('int_ev_0227') }} as p
group by p.customer_id
