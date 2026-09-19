select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    avg(p.v6) as s2,
    min(p.v2) as s3,
    stddev_samp(p.v5) as s4,
    avg(p.v6) as s5
from {{ ref('int_ev_0003') }} as p
group by p.customer_id
