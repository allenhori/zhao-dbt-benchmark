select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    min(p.v6) as s2,
    sum(p.v4) as s3,
    avg(p.v4) as s4,
    max(p.v6) as s5,
    stddev_samp(p.v6) as s6
from {{ ref('int_ev_0427') }} as p
group by p.customer_id
