select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v8) as s1,
    sum(p.v8) as s2,
    max(p.v5) as s3,
    stddev_samp(p.v8) as s4,
    avg(p.v5) as s5
from {{ ref('int_ev_0049') }} as p
group by p.customer_id
