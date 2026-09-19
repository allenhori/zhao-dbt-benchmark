select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v6) as s1,
    avg(p.v6) as s2,
    min(p.v7) as s3,
    max(p.v6) as s4
from {{ ref('int_ev_0221') }} as p
group by p.customer_id
