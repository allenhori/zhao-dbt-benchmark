select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v1) as s1,
    max(p.v1) as s2,
    sum(p.v1) as s3,
    stddev_samp(p.v6) as s4
from {{ ref('int_ev_0290') }} as p
group by p.customer_id
