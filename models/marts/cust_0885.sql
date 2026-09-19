select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    max(p.v1) as s2,
    stddev_samp(p.v4) as s3,
    avg(p.v1) as s4
from {{ ref('int_ev_0096') }} as p
group by p.customer_id
