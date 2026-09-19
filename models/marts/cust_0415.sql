select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v8) as s1,
    min(p.v1) as s2,
    min(p.v5) as s3,
    avg(p.v5) as s4,
    min(p.v8) as s5,
    median(p.v5) as s6
from {{ ref('int_ev_0123') }} as p
group by p.customer_id
