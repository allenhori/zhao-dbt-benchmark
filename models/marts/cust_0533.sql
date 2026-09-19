select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v2) as s1,
    median(p.v2) as s2,
    stddev_samp(p.v3) as s3,
    avg(p.v2) as s4,
    min(p.v2) as s5
from {{ ref('int_ev_0172') }} as p
group by p.customer_id
