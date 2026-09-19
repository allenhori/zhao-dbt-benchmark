select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v6) as s1,
    sum(p.v2) as s2,
    sum(p.v6) as s3,
    avg(p.v2) as s4,
    stddev_samp(p.v2) as s5
from {{ ref('int_ev_0363') }} as p
group by p.customer_id
