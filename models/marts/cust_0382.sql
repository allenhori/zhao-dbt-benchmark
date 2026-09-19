select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    stddev_samp(p.v1) as s2,
    max(p.v5) as s3,
    sum(p.v1) as s4,
    min(p.v5) as s5
from {{ ref('int_ev_0417') }} as p
group by p.customer_id
