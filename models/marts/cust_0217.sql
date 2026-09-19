select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v1) as s1,
    stddev_samp(p.v8) as s2,
    stddev_samp(p.v1) as s3,
    stddev_samp(p.v1) as s4,
    avg(p.v8) as s5
from {{ ref('int_ev_0366') }} as p
group by p.customer_id
