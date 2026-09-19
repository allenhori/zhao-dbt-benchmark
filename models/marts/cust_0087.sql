select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v3) as s1,
    median(p.v3) as s2,
    sum(p.v3) as s3,
    sum(p.v5) as s4
from {{ ref('int_ev_0180') }} as p
group by p.customer_id
