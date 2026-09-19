select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v5) as s1,
    max(p.v6) as s2,
    max(p.v6) as s3,
    min(p.v5) as s4,
    sum(p.v6) as s5
from {{ ref('int_ev_0285') }} as p
group by p.customer_id
