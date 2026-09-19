select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    sum(p.v3) as s2,
    stddev_samp(p.v3) as s3,
    median(p.v3) as s4,
    avg(p.v1) as s5,
    min(p.v1) as s6
from {{ ref('int_ev_0140') }} as p
group by p.customer_id
