select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v7) as s1,
    max(p.v3) as s2,
    avg(p.v7) as s3,
    max(p.v6) as s4,
    min(p.v7) as s5,
    stddev_samp(p.v6) as s6
from {{ ref('int_ev_0067') }} as p
group by p.customer_id
