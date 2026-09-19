select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    sum(p.v7) as s2,
    max(p.v2) as s3,
    stddev_samp(p.v7) as s4
from {{ ref('int_ev_0296') }} as p
group by p.customer_id
