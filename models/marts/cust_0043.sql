select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v1) as s1,
    median(p.v8) as s2,
    sum(p.v7) as s3,
    max(p.v1) as s4,
    avg(p.v7) as s5
from {{ ref('int_ev_0149') }} as p
group by p.customer_id
