select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    min(p.v3) as s2,
    sum(p.v6) as s3,
    min(p.v3) as s4
from {{ ref('int_ev_0046') }} as p
group by p.customer_id
