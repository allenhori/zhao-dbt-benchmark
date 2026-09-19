select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v5) as s1,
    max(p.v5) as s2,
    min(p.v1) as s3,
    stddev_samp(p.v5) as s4
from {{ ref('int_ev_0370') }} as p
group by p.customer_id
