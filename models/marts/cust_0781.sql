select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    median(p.v1) as s2,
    avg(p.v2) as s3,
    stddev_samp(p.v1) as s4,
    avg(p.v1) as s5,
    stddev_samp(p.v1) as s6
from {{ ref('int_ev_0292') }} as p
group by p.customer_id
