select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v5) as s1,
    sum(p.v1) as s2,
    stddev_samp(p.v1) as s3,
    sum(p.v6) as s4,
    max(p.v6) as s5
from {{ ref('int_ev_0077') }} as p
group by p.customer_id
