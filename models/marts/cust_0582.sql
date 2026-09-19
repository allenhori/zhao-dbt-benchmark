select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v4) as s1,
    max(p.v4) as s2,
    median(p.v4) as s3,
    avg(p.v4) as s4,
    stddev_samp(p.v4) as s5
from {{ ref('int_ev_0421') }} as p
group by p.customer_id
