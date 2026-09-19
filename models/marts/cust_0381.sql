select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    min(p.v8) as s2,
    median(p.v7) as s3,
    stddev_samp(p.v7) as s4,
    stddev_samp(p.v6) as s5
from {{ ref('int_ev_0294') }} as p
group by p.customer_id
