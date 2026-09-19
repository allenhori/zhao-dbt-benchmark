select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v8) as s1,
    median(p.v8) as s2,
    avg(p.v7) as s3,
    min(p.v8) as s4,
    sum(p.v7) as s5
from {{ ref('int_ev_0346') }} as p
group by p.customer_id
