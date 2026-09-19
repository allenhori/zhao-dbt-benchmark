select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    stddev_samp(p.v7) as s2,
    min(p.v2) as s3,
    min(p.v7) as s4,
    sum(p.v7) as s5,
    max(p.v6) as s6
from {{ ref('int_ev_0402') }} as p
group by p.customer_id
