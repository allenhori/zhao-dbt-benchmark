select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    sum(p.v6) as s2,
    sum(p.v6) as s3,
    stddev_samp(p.v6) as s4,
    median(p.v2) as s5,
    max(p.v6) as s6
from {{ ref('int_ev_0354') }} as p
group by p.customer_id
