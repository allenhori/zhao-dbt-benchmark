select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v1) as s1,
    median(p.v1) as s2,
    stddev_samp(p.v1) as s3,
    stddev_samp(p.v1) as s4
from {{ ref('int_ev_0356') }} as p
group by p.customer_id
