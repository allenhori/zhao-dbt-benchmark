select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v3) as s1,
    stddev_samp(p.v8) as s2,
    avg(p.v6) as s3,
    stddev_samp(p.v8) as s4,
    stddev_samp(p.v8) as s5,
    median(p.v6) as s6
from {{ ref('int_ev_0001') }} as p
group by p.customer_id
