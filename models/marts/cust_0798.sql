select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    stddev_samp(p.v4) as s2,
    avg(p.v4) as s3,
    max(p.v2) as s4
from {{ ref('int_ev_0394') }} as p
group by p.customer_id
