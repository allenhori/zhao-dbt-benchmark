select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    stddev_samp(p.v1) as s1,
    stddev_samp(p.v1) as s2,
    avg(p.v4) as s3,
    max(p.v1) as s4
from {{ ref('int_ev_0300') }} as p
group by p.customer_id
