select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v5) as s1,
    max(p.v5) as s2,
    stddev_samp(p.v5) as s3,
    avg(p.v4) as s4
from {{ ref('int_ev_0209') }} as p
group by p.customer_id
