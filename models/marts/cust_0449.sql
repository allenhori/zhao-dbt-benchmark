select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v5) as s1,
    median(p.v5) as s2,
    min(p.v2) as s3,
    median(p.v5) as s4,
    avg(p.v5) as s5
from {{ ref('int_ev_0101') }} as p
group by p.customer_id
