select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v5) as s1,
    stddev_samp(p.v4) as s2,
    sum(p.v5) as s3,
    avg(p.v4) as s4,
    max(p.v1) as s5
from {{ ref('int_ev_0293') }} as p
group by p.customer_id
