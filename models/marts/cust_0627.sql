select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v5) as s1,
    min(p.v4) as s2,
    max(p.v5) as s3,
    max(p.v5) as s4,
    sum(p.v5) as s5
from {{ ref('int_ev_0270') }} as p
group by p.customer_id
