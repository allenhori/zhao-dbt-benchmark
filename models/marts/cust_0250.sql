select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    sum(p.v6) as s2,
    min(p.v7) as s3,
    sum(p.v1) as s4,
    avg(p.v6) as s5,
    sum(p.v6) as s6
from {{ ref('int_ev_0213') }} as p
group by p.customer_id
