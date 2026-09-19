select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v4) as s1,
    stddev_samp(p.v3) as s2,
    avg(p.v3) as s3,
    max(p.v3) as s4
from {{ ref('int_ev_0080') }} as p
group by p.customer_id
