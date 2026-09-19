select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v2) as s1,
    sum(p.v2) as s2,
    stddev_samp(p.v2) as s3,
    median(p.v6) as s4
from {{ ref('int_ev_0413') }} as p
group by p.customer_id
