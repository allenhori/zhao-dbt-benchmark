select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v7) as s1,
    stddev_samp(p.v6) as s2,
    stddev_samp(p.v7) as s3,
    max(p.v7) as s4,
    median(p.v6) as s5
from {{ ref('int_ev_0211') }} as p
group by p.customer_id
