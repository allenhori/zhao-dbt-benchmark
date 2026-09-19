select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    median(p.v5) as s2,
    median(p.v2) as s3,
    max(p.v2) as s4,
    avg(p.v5) as s5
from {{ ref('int_ev_0000') }} as p
group by p.customer_id
