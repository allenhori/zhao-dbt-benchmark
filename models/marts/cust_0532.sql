select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v6) as s1,
    sum(p.v7) as s2,
    sum(p.v2) as s3,
    max(p.v7) as s4
from {{ ref('int_ev_0229') }} as p
group by p.customer_id
