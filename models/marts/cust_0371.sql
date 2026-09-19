select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v1) as s1,
    min(p.v5) as s2,
    min(p.v5) as s3,
    sum(p.v1) as s4,
    avg(p.v1) as s5,
    stddev_samp(p.v5) as s6
from {{ ref('int_ev_0016') }} as p
group by p.customer_id
