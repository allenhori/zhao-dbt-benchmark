select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v3) as s1,
    avg(p.v5) as s2,
    stddev_samp(p.v3) as s3,
    stddev_samp(p.v3) as s4,
    max(p.v3) as s5,
    min(p.v3) as s6
from {{ ref('int_ev_0370') }} as p
group by p.customer_id
