select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v1) as s1,
    stddev_samp(p.v8) as s2,
    median(p.v8) as s3,
    sum(p.v8) as s4,
    median(p.v8) as s5
from {{ ref('int_ev_0180') }} as p
group by p.customer_id
