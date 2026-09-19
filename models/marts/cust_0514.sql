select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v5) as s1,
    min(p.v5) as s2,
    sum(p.v7) as s3,
    sum(p.v2) as s4,
    max(p.v7) as s5,
    min(p.v2) as s6
from {{ ref('int_ev_0162') }} as p
group by p.customer_id
