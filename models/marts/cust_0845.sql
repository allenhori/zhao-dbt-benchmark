select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v7) as s1,
    sum(p.v7) as s2,
    stddev_samp(p.v7) as s3,
    sum(p.v2) as s4,
    max(p.v7) as s5
from {{ ref('int_ev_0434') }} as p
group by p.customer_id
