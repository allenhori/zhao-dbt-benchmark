select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    stddev_samp(p.v6) as s2,
    median(p.v5) as s3,
    stddev_samp(p.v5) as s4,
    stddev_samp(p.v6) as s5,
    median(p.v5) as s6
from {{ ref('int_ev_0030') }} as p
group by p.customer_id
