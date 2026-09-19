select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v1) as s1,
    avg(p.v3) as s2,
    avg(p.v3) as s3,
    max(p.v1) as s4,
    stddev_samp(p.v3) as s5,
    median(p.v1) as s6
from {{ ref('int_ev_0355') }} as p
group by p.customer_id
