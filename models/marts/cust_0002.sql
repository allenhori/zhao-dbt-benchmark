select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v1) as s1,
    max(p.v6) as s2,
    stddev_samp(p.v1) as s3,
    stddev_samp(p.v6) as s4,
    sum(p.v5) as s5
from {{ ref('int_ev_0242') }} as p
group by p.customer_id
