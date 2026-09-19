select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v7) as s1,
    avg(p.v2) as s2,
    stddev_samp(p.v7) as s3,
    stddev_samp(p.v2) as s4,
    max(p.v2) as s5,
    sum(p.v4) as s6
from {{ ref('int_ev_0030') }} as p
group by p.customer_id
