select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v8) as s1,
    sum(p.v8) as s2,
    avg(p.v6) as s3,
    sum(p.v8) as s4,
    avg(p.v3) as s5,
    stddev_samp(p.v6) as s6
from {{ ref('int_ev_0202') }} as p
group by p.customer_id
