select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v7) as s1,
    avg(p.v3) as s2,
    sum(p.v7) as s3,
    min(p.v8) as s4,
    min(p.v8) as s5
from {{ ref('int_ev_0266') }} as p
group by p.customer_id
