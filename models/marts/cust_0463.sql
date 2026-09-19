select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    sum(p.v1) as s2,
    stddev_samp(p.v7) as s3,
    median(p.v7) as s4,
    avg(p.v1) as s5,
    max(p.v7) as s6
from {{ ref('int_ev_0093') }} as p
group by p.customer_id
