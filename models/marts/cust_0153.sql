select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v2) as s1,
    max(p.v3) as s2,
    min(p.v3) as s3,
    avg(p.v2) as s4,
    median(p.v2) as s5,
    max(p.v3) as s6
from {{ ref('int_ev_0045') }} as p
group by p.customer_id
