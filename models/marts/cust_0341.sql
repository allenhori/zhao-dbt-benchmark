select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    avg(p.v2) as s2,
    stddev_samp(p.v2) as s3,
    min(p.v4) as s4,
    median(p.v4) as s5,
    stddev_samp(p.v4) as s6
from {{ ref('int_ev_0399') }} as p
group by p.customer_id
