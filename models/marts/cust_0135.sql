select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v2) as s1,
    avg(p.v4) as s2,
    avg(p.v2) as s3,
    median(p.v4) as s4
from {{ ref('int_ev_0276') }} as p
group by p.customer_id
