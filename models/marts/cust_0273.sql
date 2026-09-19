select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    max(p.v4) as s2,
    sum(p.v6) as s3,
    sum(p.v6) as s4,
    stddev_samp(p.v4) as s5,
    min(p.v4) as s6
from {{ ref('int_ev_0237') }} as p
group by p.customer_id
