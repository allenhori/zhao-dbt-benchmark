select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    stddev_samp(p.v3) as s2,
    max(p.v3) as s3,
    avg(p.v6) as s4,
    avg(p.v3) as s5,
    max(p.v6) as s6
from {{ ref('int_ev_0063') }} as p
group by p.customer_id
