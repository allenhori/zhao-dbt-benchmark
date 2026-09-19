select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    max(p.v3) as s2,
    stddev_samp(p.v3) as s3,
    avg(p.v3) as s4,
    max(p.v5) as s5
from {{ ref('int_ev_0416') }} as p
group by p.customer_id
