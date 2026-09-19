select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v7) as s1,
    avg(p.v5) as s2,
    sum(p.v5) as s3,
    avg(p.v2) as s4
from {{ ref('int_ev_0064') }} as p
group by p.customer_id
