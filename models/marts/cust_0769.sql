select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v5) as s1,
    avg(p.v5) as s2,
    max(p.v5) as s3,
    avg(p.v1) as s4,
    max(p.v5) as s5,
    max(p.v5) as s6
from {{ ref('int_ev_0387') }} as p
group by p.customer_id
