select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v7) as s1,
    stddev_samp(p.v3) as s2,
    sum(p.v3) as s3,
    max(p.v5) as s4,
    min(p.v5) as s5
from {{ ref('int_ev_0206') }} as p
group by p.customer_id
