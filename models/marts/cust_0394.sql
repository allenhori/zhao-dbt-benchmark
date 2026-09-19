select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.m7) as s1,
    avg(p.m12) as s2,
    stddev_samp(p.m7) as s3,
    stddev_samp(p.m12) as s4
from {{ ref('stg_ev_06') }} as p
group by p.customer_id
