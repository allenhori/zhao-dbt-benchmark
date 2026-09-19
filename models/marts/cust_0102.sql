select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v3) as s1,
    min(p.v4) as s2,
    min(p.v3) as s3,
    sum(p.v3) as s4,
    sum(p.v5) as s5,
    avg(p.v3) as s6
from {{ ref('int_ev_0322') }} as p
group by p.customer_id
