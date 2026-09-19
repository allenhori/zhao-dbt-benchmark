select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    median(p.v4) as s2,
    median(p.v4) as s3,
    min(p.v4) as s4,
    avg(p.v3) as s5,
    median(p.v2) as s6
from {{ ref('int_ev_0232') }} as p
group by p.customer_id
