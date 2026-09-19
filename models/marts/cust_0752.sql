select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v5) as s1,
    min(p.v3) as s2,
    stddev_samp(p.v5) as s3,
    min(p.v6) as s4,
    sum(p.v3) as s5,
    sum(p.v3) as s6
from {{ ref('int_ev_0348') }} as p
group by p.customer_id
