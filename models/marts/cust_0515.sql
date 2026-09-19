select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v3) as s1,
    avg(p.v3) as s2,
    stddev_samp(p.v1) as s3,
    stddev_samp(p.v7) as s4
from {{ ref('int_ev_0333') }} as p
group by p.customer_id
