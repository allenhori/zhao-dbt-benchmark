select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v5) as s1,
    sum(p.v2) as s2,
    stddev_samp(p.v2) as s3,
    avg(p.v2) as s4
from {{ ref('int_ev_0210') }} as p
group by p.customer_id
