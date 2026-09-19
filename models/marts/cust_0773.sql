select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v7) as s1,
    avg(p.v7) as s2,
    max(p.v4) as s3,
    max(p.v7) as s4,
    stddev_samp(p.v4) as s5
from {{ ref('int_ev_0296') }} as p
group by p.customer_id
