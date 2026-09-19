select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v8) as s1,
    sum(p.v6) as s2,
    min(p.v6) as s3,
    min(p.v8) as s4
from {{ ref('int_ev_0068') }} as p
group by p.customer_id
