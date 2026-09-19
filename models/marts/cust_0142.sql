select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v7) as s1,
    min(p.v3) as s2,
    min(p.v3) as s3,
    min(p.v3) as s4,
    max(p.v6) as s5,
    sum(p.v7) as s6
from {{ ref('int_ev_0015') }} as p
group by p.customer_id
