select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v2) as s1,
    avg(p.v7) as s2,
    sum(p.v2) as s3,
    min(p.v2) as s4,
    sum(p.v2) as s5,
    sum(p.v7) as s6
from {{ ref('int_ev_0102') }} as p
group by p.customer_id
