select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    stddev_samp(p.v1) as s2,
    median(p.v3) as s3,
    max(p.v3) as s4,
    sum(p.v4) as s5
from {{ ref('int_ev_0166') }} as p
group by p.customer_id
