select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    median(p.v6) as s2,
    sum(p.v6) as s3,
    max(p.v4) as s4
from {{ ref('int_ev_0417') }} as p
group by p.customer_id
