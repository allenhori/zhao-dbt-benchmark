select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    sum(p.v5) as s2,
    stddev_samp(p.v3) as s3,
    avg(p.v3) as s4,
    median(p.v3) as s5
from {{ ref('int_ev_0035') }} as p
group by p.customer_id
