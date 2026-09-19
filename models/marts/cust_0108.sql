select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v6) as s1,
    avg(p.v7) as s2,
    avg(p.v7) as s3,
    avg(p.v7) as s4,
    sum(p.v6) as s5
from {{ ref('int_ev_0009') }} as p
group by p.customer_id
