select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    stddev_samp(p.v1) as s2,
    stddev_samp(p.v3) as s3,
    median(p.v3) as s4,
    avg(p.v5) as s5,
    avg(p.v1) as s6
from {{ ref('int_ev_0125') }} as p
group by p.customer_id
