select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v3) as s1,
    stddev_samp(p.v3) as s2,
    min(p.v3) as s3,
    avg(p.v3) as s4,
    avg(p.v3) as s5,
    sum(p.v5) as s6
from {{ ref('int_ev_0383') }} as p
group by p.customer_id
