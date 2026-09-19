select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v6) as s1,
    min(p.v4) as s2,
    avg(p.v6) as s3,
    avg(p.v4) as s4,
    stddev_samp(p.v6) as s5,
    median(p.v6) as s6
from {{ ref('int_ev_0092') }} as p
group by p.customer_id
