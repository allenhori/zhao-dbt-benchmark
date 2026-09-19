select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    stddev_samp(p.v3) as s2,
    median(p.v3) as s3,
    avg(p.v7) as s4,
    avg(p.v7) as s5,
    sum(p.v3) as s6
from {{ ref('int_ev_0299') }} as p
group by p.customer_id
