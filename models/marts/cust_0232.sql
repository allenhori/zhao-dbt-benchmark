select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    median(p.v7) as s2,
    stddev_samp(p.v6) as s3,
    avg(p.v6) as s4
from {{ ref('int_ev_0221') }} as p
group by p.customer_id
