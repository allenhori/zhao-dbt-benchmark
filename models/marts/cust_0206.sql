select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v7) as s1,
    sum(p.v3) as s2,
    max(p.v6) as s3,
    max(p.v3) as s4,
    sum(p.v7) as s5,
    sum(p.v6) as s6
from {{ ref('int_ev_0099') }} as p
group by p.customer_id
