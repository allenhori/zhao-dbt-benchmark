select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v3) as s1,
    stddev_samp(p.v6) as s2,
    max(p.v6) as s3,
    median(p.v6) as s4,
    sum(p.v6) as s5,
    avg(p.v6) as s6
from {{ ref('int_ev_0002') }} as p
group by p.customer_id
