select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v6) as s1,
    stddev_samp(p.v5) as s2,
    max(p.v6) as s3,
    sum(p.v5) as s4,
    max(p.v5) as s5
from {{ ref('int_ev_0184') }} as p
group by p.customer_id
