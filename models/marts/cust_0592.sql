select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    min(p.v7) as s2,
    min(p.v7) as s3,
    avg(p.v7) as s4,
    sum(p.v6) as s5
from {{ ref('int_ev_0007') }} as p
group by p.customer_id
