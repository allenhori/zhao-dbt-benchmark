select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v4) as s1,
    stddev_samp(p.v8) as s2,
    stddev_samp(p.v8) as s3,
    avg(p.v8) as s4,
    min(p.v8) as s5
from {{ ref('int_ev_0398') }} as p
group by p.customer_id
