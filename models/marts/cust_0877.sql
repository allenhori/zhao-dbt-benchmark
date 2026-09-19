select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    avg(p.v3) as s2,
    median(p.v6) as s3,
    max(p.v1) as s4,
    median(p.v1) as s5
from {{ ref('int_ev_0261') }} as p
group by p.customer_id
