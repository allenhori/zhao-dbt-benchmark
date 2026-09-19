select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v6) as s1,
    sum(p.v3) as s2,
    sum(p.v1) as s3,
    avg(p.v1) as s4
from {{ ref('int_ev_0327') }} as p
group by p.customer_id
