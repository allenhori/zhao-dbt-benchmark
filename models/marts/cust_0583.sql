select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v2) as s1,
    avg(p.v4) as s2,
    stddev_samp(p.v2) as s3,
    stddev_samp(p.v5) as s4
from {{ ref('int_ev_0149') }} as p
group by p.customer_id
