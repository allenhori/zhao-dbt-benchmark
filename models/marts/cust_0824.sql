select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    max(p.v5) as s2,
    min(p.v1) as s3,
    sum(p.v1) as s4,
    stddev_samp(p.v8) as s5
from {{ ref('int_ev_0415') }} as p
group by p.customer_id
