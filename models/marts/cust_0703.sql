select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    stddev_samp(p.v6) as s2,
    max(p.v6) as s3,
    max(p.v6) as s4
from {{ ref('int_ev_0080') }} as p
group by p.customer_id
