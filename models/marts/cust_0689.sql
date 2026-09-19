select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    avg(p.v2) as s2,
    stddev_samp(p.v7) as s3,
    min(p.v2) as s4,
    min(p.v4) as s5
from {{ ref('int_ev_0282') }} as p
group by p.customer_id
