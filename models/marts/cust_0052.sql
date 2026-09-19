select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v2) as s1,
    median(p.v2) as s2,
    max(p.v4) as s3,
    sum(p.v4) as s4,
    stddev_samp(p.v4) as s5,
    median(p.v4) as s6
from {{ ref('int_ev_0321') }} as p
group by p.customer_id
