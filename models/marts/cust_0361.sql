select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.m6) as s1,
    min(p.m6) as s2,
    stddev_samp(p.m10) as s3,
    max(p.m6) as s4
from {{ ref('stg_ev_06') }} as p
group by p.customer_id
