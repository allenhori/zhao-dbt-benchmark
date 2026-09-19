select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    sum(p.v7) as s2,
    sum(p.v7) as s3,
    stddev_samp(p.v7) as s4,
    stddev_samp(p.v5) as s5,
    sum(p.v7) as s6
from {{ ref('int_ev_0307') }} as p
group by p.customer_id
