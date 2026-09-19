select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v1) as s1,
    stddev_samp(p.v7) as s2,
    avg(p.v1) as s3,
    min(p.v7) as s4,
    median(p.v1) as s5
from {{ ref('int_ev_0185') }} as p
group by p.customer_id
