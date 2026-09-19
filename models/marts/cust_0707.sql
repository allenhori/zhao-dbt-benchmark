select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v6) as s1,
    min(p.v5) as s2,
    min(p.v6) as s3,
    median(p.v7) as s4,
    max(p.v7) as s5
from {{ ref('int_ev_0343') }} as p
group by p.customer_id
