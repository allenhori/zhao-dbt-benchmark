select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    avg(p.v6) as s2,
    min(p.v7) as s3,
    avg(p.v5) as s4,
    median(p.v6) as s5
from {{ ref('int_ev_0222') }} as p
group by p.customer_id
