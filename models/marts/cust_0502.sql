select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v5) as s1,
    sum(p.v6) as s2,
    min(p.v5) as s3,
    stddev_samp(p.v5) as s4,
    sum(p.v6) as s5
from {{ ref('int_ev_0039') }} as p
group by p.customer_id
