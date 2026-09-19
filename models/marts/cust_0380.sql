select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v7) as s1,
    max(p.v1) as s2,
    stddev_samp(p.v7) as s3,
    stddev_samp(p.v1) as s4,
    min(p.v7) as s5
from {{ ref('int_ev_0325') }} as p
group by p.customer_id
