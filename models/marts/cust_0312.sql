select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    median(p.v6) as s2,
    stddev_samp(p.v3) as s3,
    stddev_samp(p.v6) as s4
from {{ ref('int_ev_0396') }} as p
group by p.customer_id
