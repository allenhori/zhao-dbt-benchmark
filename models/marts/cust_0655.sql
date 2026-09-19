select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v2) as s1,
    stddev_samp(p.v2) as s2,
    sum(p.v2) as s3,
    min(p.v2) as s4,
    sum(p.v6) as s5
from {{ ref('int_ev_0129') }} as p
group by p.customer_id
