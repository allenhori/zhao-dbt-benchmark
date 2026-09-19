select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v5) as s1,
    median(p.v1) as s2,
    median(p.v3) as s3,
    max(p.v3) as s4,
    avg(p.v1) as s5,
    max(p.v1) as s6
from {{ ref('int_ev_0089') }} as p
group by p.customer_id
