select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v2) as s1,
    max(p.v8) as s2,
    median(p.v8) as s3,
    avg(p.v2) as s4
from {{ ref('int_ev_0018') }} as p
group by p.customer_id
