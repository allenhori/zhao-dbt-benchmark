select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    stddev_samp(p.v2) as s2,
    stddev_samp(p.v4) as s3,
    min(p.v5) as s4,
    avg(p.v5) as s5
from {{ ref('int_ev_0387') }} as p
group by p.customer_id
