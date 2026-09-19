select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v2) as s1,
    median(p.v6) as s2,
    median(p.v6) as s3,
    median(p.v2) as s4,
    stddev_samp(p.v2) as s5
from {{ ref('int_ev_0003') }} as p
group by p.customer_id
