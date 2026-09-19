select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    stddev_samp(p.v4) as s2,
    avg(p.v6) as s3,
    max(p.v6) as s4
from {{ ref('int_ev_0200') }} as p
group by p.customer_id
