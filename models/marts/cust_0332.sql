select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v6) as s1,
    min(p.v6) as s2,
    stddev_samp(p.v3) as s3,
    max(p.v4) as s4,
    sum(p.v4) as s5
from {{ ref('int_ev_0234') }} as p
group by p.customer_id
