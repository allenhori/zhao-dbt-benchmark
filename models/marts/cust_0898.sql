select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v3) as s1,
    median(p.v2) as s2,
    sum(p.v6) as s3,
    median(p.v2) as s4,
    stddev_samp(p.v3) as s5,
    median(p.v2) as s6
from {{ ref('int_ev_0352') }} as p
group by p.customer_id
